import 'package:flutter_test/flutter_test.dart';
import 'package:dashboard_kpi/features/crm/domain/entities/lead.dart';
import 'package:dashboard_kpi/features/crm/domain/enums/lead_source.dart';
import 'package:dashboard_kpi/features/crm/domain/enums/lead_status.dart';

void main() {
  final createdAt = DateTime.utc(2026, 1, 1);
  final updatedAt = DateTime.utc(2026, 1, 2);

  Lead createLead({
    String id = 'lead-1',
    String tenantId = 'tenant-1',
    String companyId = 'company-1',
    String ownerId = 'owner-1',
    LeadStatus status = LeadStatus.draft,
    DateTime? created,
    DateTime? updated,
    DateTime? deletedAt,
  }) {
    return Lead(
      id: id,
      tenantId: tenantId,
      companyId: companyId,
      ownerId: ownerId,
      source: LeadSource.whatsapp,
      status: status,
      createdAt: created ?? createdAt,
      updatedAt: updated ?? updatedAt,
      deletedAt: deletedAt,
    );
  }

  group('Lead entity', () {
    test('preserves approved core fields', () {
      final lead = createLead();

      expect(lead.id, 'lead-1');
      expect(lead.tenantId, 'tenant-1');
      expect(lead.companyId, 'company-1');
      expect(lead.ownerId, 'owner-1');
      expect(lead.source, LeadSource.whatsapp);
      expect(lead.status, LeadStatus.draft);
      expect(lead.isActive, isTrue);
      expect(lead.isDeleted, isFalse);
    });

    test('rejects empty required identifiers', () {
      expect(() => createLead(id: ' '), throwsArgumentError);
      expect(() => createLead(tenantId: ''), throwsArgumentError);
      expect(() => createLead(companyId: ''), throwsArgumentError);
      expect(() => createLead(ownerId: ''), throwsArgumentError);
    });

    test('rejects updatedAt before createdAt', () {
      expect(
        () => createLead(created: updatedAt, updated: createdAt),
        throwsArgumentError,
      );
    });

    test('rejects deletedAt before updatedAt', () {
      expect(() => createLead(deletedAt: createdAt), throwsArgumentError);
    });

    test('transitions to next valid status immutably', () {
      final original = createLead();
      final transitioned = original.transitionTo(
        LeadStatus.newLead,
        at: DateTime.utc(2026, 1, 3),
      );

      expect(original.status, LeadStatus.draft);
      expect(transitioned.status, LeadStatus.newLead);
      expect(transitioned.updatedAt, DateTime.utc(2026, 1, 3));
      expect(transitioned.id, original.id);
      expect(transitioned.tenantId, original.tenantId);
    });

    test('rejects invalid status transition', () {
      final lead = createLead();

      expect(
        () => lead.transitionTo(LeadStatus.won, at: DateTime.utc(2026, 1, 3)),
        throwsStateError,
      );
    });

    test('soft delete preserves record and sets deletedAt', () {
      final lead = createLead().softDelete(at: DateTime.utc(2026, 1, 3));

      expect(lead.isDeleted, isTrue);
      expect(lead.isActive, isFalse);
      expect(lead.deletedAt, DateTime.utc(2026, 1, 3));
      expect(lead.id, 'lead-1');
    });

    test('rejects status changes after soft delete', () {
      final lead = createLead(deletedAt: DateTime.utc(2026, 1, 3));

      expect(
        () =>
            lead.transitionTo(LeadStatus.newLead, at: DateTime.utc(2026, 1, 4)),
        throwsStateError,
      );
    });

    test('rejects repeated soft delete', () {
      final lead = createLead(deletedAt: DateTime.utc(2026, 1, 3));

      expect(
        () => lead.softDelete(at: DateTime.utc(2026, 1, 4)),
        throwsStateError,
      );
    });
  });
}
