import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/crm/data/datasource/lead_datasource.dart';
import 'package:dashboard_kpi/features/crm/data/mapper/lead_mapper.dart';
import 'package:dashboard_kpi/features/crm/data/models/lead_model.dart';
import 'package:dashboard_kpi/features/crm/data/repository/lead_repository_impl.dart';
import 'package:dashboard_kpi/features/crm/domain/entities/lead.dart';
import 'package:dashboard_kpi/features/crm/domain/enums/lead_source.dart';
import 'package:dashboard_kpi/features/crm/domain/enums/lead_status.dart';

final now = DateTime.utc(2026, 10, 14, 10);

Lead makeLead({
  String id = 'lead-1',
  String tenantId = 'tenant-1',
  String companyId = 'company-1',
  LeadStatus status = LeadStatus.newLead,
  DateTime? deletedAt,
}) {
  return Lead(
    id: id,
    tenantId: tenantId,
    companyId: companyId,
    ownerId: 'user-1',
    source: LeadSource.whatsapp,
    status: status,
    createdAt: now,
    updatedAt: now,
    deletedAt: deletedAt,
  );
}

class FakeLeadDataSource implements LeadDataSource {
  final List<LeadModel> records = [];
  String? requestedTenantId;
  String? requestedCompanyId;
  bool returnWrongScope = false;

  @override
  Future<LeadModel> createLead(LeadModel lead) async {
    records.add(lead);
    return lead;
  }

  @override
  Future<LeadModel?> getLeadById({
    required String id,
    required String tenantId,
    required String companyId,
  }) async {
    requestedTenantId = tenantId;
    requestedCompanyId = companyId;

    try {
      return records.firstWhere(
        (item) =>
            item.id == id &&
            item.tenantId == tenantId &&
            item.companyId == companyId,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<LeadModel>> getLeads({
    required String tenantId,
    required String companyId,
  }) async {
    requestedTenantId = tenantId;
    requestedCompanyId = companyId;

    final matching = records
        .where(
          (item) =>
              item.tenantId == tenantId &&
              item.companyId == companyId,
        )
        .toList(growable: false);

    if (!returnWrongScope || matching.isEmpty) {
      return matching;
    }

    return [
      ...matching,
      LeadModel(
        id: 'foreign-lead',
        tenantId: 'other-tenant',
        companyId: companyId,
        ownerId: 'user-2',
        leadSource: 'whatsapp',
        status: 'NEW',
        createdAt: now,
        updatedAt: now,
      ),
    ];
  }

  @override
  Future<LeadModel> updateLead(LeadModel lead) async {
    final index = records.indexWhere(
      (item) =>
          item.id == lead.id &&
          item.tenantId == lead.tenantId &&
          item.companyId == lead.companyId,
    );

    if (index == -1) {
      throw StateError('Lead not found in requested scope.');
    }

    records[index] = lead;
    return lead;
  }
}

void main() {
  late FakeLeadDataSource dataSource;
  late LeadRepositoryImpl repository;

  setUp(() {
    dataSource = FakeLeadDataSource();
    repository = LeadRepositoryImpl(
      dataSource: dataSource,
      mapper: const LeadMapper(),
    );
  });

  group('LeadRepositoryImpl', () {
    test('creates an active lead', () async {
      final result = await repository.createLead(makeLead());

      expect(result.id, 'lead-1');
      expect(result.isActive, isTrue);
      expect(dataSource.records, hasLength(1));
    });

    test('rejects creating an already deleted lead', () async {
      final deleted = makeLead(deletedAt: now);

      await expectLater(
        repository.createLead(deleted),
        throwsArgumentError,
      );

      expect(dataSource.records, isEmpty);
    });

    test('gets a lead within tenant and company scope', () async {
      dataSource.records.add(LeadModel(
        id: 'lead-1',
        tenantId: 'tenant-1',
        companyId: 'company-1',
        ownerId: 'user-1',
        leadSource: 'whatsapp',
        status: 'NEW',
        createdAt: now,
        updatedAt: now,
      ));

      final result = await repository.getLeadById(
        id: 'lead-1',
        tenantId: 'tenant-1',
        companyId: 'company-1',
      );

      expect(result?.id, 'lead-1');
      expect(dataSource.requestedTenantId, 'tenant-1');
      expect(dataSource.requestedCompanyId, 'company-1');
    });

    test('returns null for a lead outside requested scope', () async {
      dataSource.records.add(LeadModel(
        id: 'lead-1',
        tenantId: 'tenant-1',
        companyId: 'company-1',
        ownerId: 'user-1',
        leadSource: 'whatsapp',
        status: 'NEW',
        createdAt: now,
        updatedAt: now,
      ));

      final result = await repository.getLeadById(
        id: 'lead-1',
        tenantId: 'other-tenant',
        companyId: 'company-1',
      );

      expect(result, isNull);
    });

    test('lists only active leads within requested scope', () async {
      dataSource.records.addAll([
        LeadModel(
          id: 'active-lead',
          tenantId: 'tenant-1',
          companyId: 'company-1',
          ownerId: 'user-1',
          leadSource: 'whatsapp',
          status: 'NEW',
          createdAt: now,
          updatedAt: now,
        ),
        LeadModel(
          id: 'deleted-lead',
          tenantId: 'tenant-1',
          companyId: 'company-1',
          ownerId: 'user-1',
          leadSource: 'instagram',
          status: 'ARCHIVED',
          createdAt: now,
          updatedAt: now,
          deletedAt: now.add(const Duration(minutes: 1)),
        ),
        LeadModel(
          id: 'other-tenant-lead',
          tenantId: 'other-tenant',
          companyId: 'company-1',
          ownerId: 'user-2',
          leadSource: 'facebook',
          status: 'NEW',
          createdAt: now,
          updatedAt: now,
        ),
      ]);

      final result = await repository.getLeads(
        tenantId: 'tenant-1',
        companyId: 'company-1',
      );

      expect(result.map((lead) => lead.id), ['active-lead']);
    });

    test('rejects data source returning a different tenant', () async {
      dataSource.records.add(LeadModel(
        id: 'lead-1',
        tenantId: 'tenant-1',
        companyId: 'company-1',
        ownerId: 'user-1',
        leadSource: 'whatsapp',
        status: 'NEW',
        createdAt: now,
        updatedAt: now,
      ));
      dataSource.returnWrongScope = true;

      await expectLater(
        repository.getLeads(
          tenantId: 'tenant-1',
          companyId: 'company-1',
        ),
        throwsStateError,
      );
    });

    test('updates a lead and preserves its scope', () async {
      dataSource.records.add(LeadModel(
        id: 'lead-1',
        tenantId: 'tenant-1',
        companyId: 'company-1',
        ownerId: 'user-1',
        leadSource: 'whatsapp',
        status: 'NEW',
        createdAt: now,
        updatedAt: now,
      ));

      final updated = makeLead(
        status: LeadStatus.assigned,
      );

      final result = await repository.updateLead(updated);

      expect(result.status, LeadStatus.assigned);
      expect(dataSource.records.single.status, 'ASSIGNED');
    });

    test('persists soft deletion without hard delete', () async {
      dataSource.records.add(LeadModel(
        id: 'lead-1',
        tenantId: 'tenant-1',
        companyId: 'company-1',
        ownerId: 'user-1',
        leadSource: 'whatsapp',
        status: 'NEW',
        createdAt: now,
        updatedAt: now,
      ));

      final deleted = makeLead(
        status: LeadStatus.newLead,
        deletedAt: now.add(const Duration(minutes: 1)),
      );

      await repository.updateLead(deleted);

      expect(dataSource.records, hasLength(1));
      expect(dataSource.records.single.deletedAt, isNotNull);
    });
  });
}

