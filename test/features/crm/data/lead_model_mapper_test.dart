import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/crm/data/models/lead_model.dart';
import 'package:dashboard_kpi/features/crm/data/mapper/lead_mapper.dart';
import 'package:dashboard_kpi/features/crm/domain/entities/lead.dart';
import 'package:dashboard_kpi/features/crm/domain/enums/lead_source.dart';
import 'package:dashboard_kpi/features/crm/domain/enums/lead_status.dart';

void main() {
  final createdAt = DateTime.utc(2026, 10, 14, 10);
  final updatedAt = DateTime.utc(2026, 10, 14, 11);
  final deletedAt = DateTime.utc(2026, 10, 14, 12);

  LeadModel makeModel({
    String leadSource = 'whatsapp',
    String status = 'NEW',
    DateTime? deletedAt,
  }) {
    return LeadModel(
      id: 'lead-1',
      tenantId: 'tenant-1',
      companyId: 'company-1',
      ownerId: 'user-1',
      leadSource: leadSource,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }

  group('LeadModel', () {
    test('serializes database snake_case keys', () {
      final json = makeModel().toJson();

      expect(json.keys.toSet(), {
        'id',
        'tenant_id',
        'company_id',
        'owner_id',
        'lead_source',
        'status',
        'created_at',
        'updated_at',
        'deleted_at',
      });

      expect(json['tenant_id'], 'tenant-1');
      expect(json['company_id'], 'company-1');
      expect(json['lead_source'], 'whatsapp');
      expect(json['status'], 'NEW');
      expect(json['deleted_at'], isNull);
    });

    test('round-trips JSON without losing fields', () {
      final original = makeModel(deletedAt: deletedAt);
      final restored = LeadModel.fromJson(original.toJson());

      expect(restored.id, original.id);
      expect(restored.tenantId, original.tenantId);
      expect(restored.companyId, original.companyId);
      expect(restored.ownerId, original.ownerId);
      expect(restored.leadSource, original.leadSource);
      expect(restored.status, original.status);
      expect(restored.createdAt, original.createdAt);
      expect(restored.updatedAt, original.updatedAt);
      expect(restored.deletedAt, original.deletedAt);
    });

    test('keeps deleted_at nullable', () {
      final restored = LeadModel.fromJson(makeModel().toJson());

      expect(restored.deletedAt, isNull);
    });

    test('serializes timestamps in UTC ISO-8601 format', () {
      final json = makeModel().toJson();

      expect(json['created_at'], createdAt.toIso8601String());
      expect(json['updated_at'], updatedAt.toIso8601String());
    });

    test('rejects malformed timestamp', () {
      final json = makeModel().toJson()
        ..['created_at'] = 'not-a-date';

      expect(
        () => LeadModel.fromJson(json),
        throwsFormatException,
      );
    });
  });

  group('LeadMapper', () {
    const mapper = LeadMapper();

    test('maps model to entity', () {
      final entity = mapper.toEntity(makeModel());

      expect(entity.id, 'lead-1');
      expect(entity.tenantId, 'tenant-1');
      expect(entity.companyId, 'company-1');
      expect(entity.ownerId, 'user-1');
      expect(entity.source, LeadSource.whatsapp);
      expect(entity.status, LeadStatus.newLead);
      expect(entity.deletedAt, isNull);
    });

    test('maps entity to model using contract enum values', () {
      final entity = Lead(
        id: 'lead-1',
        tenantId: 'tenant-1',
        companyId: 'company-1',
        ownerId: 'user-1',
        source: LeadSource.walkIn,
        status: LeadStatus.qualified,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

      final model = mapper.toModel(entity);

      expect(model.leadSource, 'walkIn');
      expect(model.status, 'QUALIFIED');
    });

    test('preserves soft deletion timestamp', () {
      final entity = mapper.toEntity(
        makeModel(
          status: 'ARCHIVED',
          deletedAt: deletedAt,
        ),
      );

      expect(entity.isDeleted, isTrue);
      expect(entity.deletedAt, deletedAt);
      expect(mapper.toModel(entity).deletedAt, deletedAt);
    });

    test('rejects unknown lead source', () {
      expect(
        () => mapper.toEntity(
          makeModel(leadSource: 'unknown_source'),
        ),
        throwsFormatException,
      );
    });

    test('rejects unknown lead status', () {
      expect(
        () => mapper.toEntity(
          makeModel(status: 'UNKNOWN_STATUS'),
        ),
        throwsFormatException,
      );
    });
  });
}
