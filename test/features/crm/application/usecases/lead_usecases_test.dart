import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/crm/application/usecases/create_lead_usecase.dart';
import 'package:dashboard_kpi/features/crm/application/usecases/update_lead_status_usecase.dart';
import 'package:dashboard_kpi/features/crm/application/usecases/soft_delete_lead_usecase.dart';
import 'package:dashboard_kpi/features/crm/domain/entities/lead.dart';
import 'package:dashboard_kpi/features/crm/domain/enums/lead_source.dart';
import 'package:dashboard_kpi/features/crm/domain/enums/lead_status.dart';
import 'package:dashboard_kpi/features/crm/domain/repository/lead_repository.dart';

final now = DateTime.utc(2026, 10, 14, 10);

Lead makeLead({LeadStatus status = LeadStatus.newLead, DateTime? deletedAt}) {
  return Lead(
    id: 'lead-1',
    tenantId: 'tenant-1',
    companyId: 'company-1',
    ownerId: 'user-1',
    source: LeadSource.whatsapp,
    status: status,
    createdAt: now,
    updatedAt: now,
    deletedAt: deletedAt,
  );
}

class FakeLeadRepository implements LeadRepository {
  Lead? storedLead;
  Lead? updatedLead;
  String? requestedTenantId;
  String? requestedCompanyId;
  int createCalls = 0;
  int updateCalls = 0;

  @override
  Future<Lead> createLead(Lead lead) async {
    createCalls++;
    storedLead = lead;
    return lead;
  }

  @override
  Future<Lead?> getLeadById({
    required String id,
    required String tenantId,
    required String companyId,
  }) async {
    requestedTenantId = tenantId;
    requestedCompanyId = companyId;

    final lead = storedLead;
    if (lead == null ||
        lead.id != id ||
        lead.tenantId != tenantId ||
        lead.companyId != companyId) {
      return null;
    }
    return lead;
  }

  @override
  Future<List<Lead>> getLeads({
    required String tenantId,
    required String companyId,
  }) async => [];

  @override
  Future<Lead> updateLead(Lead lead) async {
    updateCalls++;
    updatedLead = lead;
    storedLead = lead;
    return lead;
  }
}

void main() {
  group('CreateLeadUseCase', () {
    test('creates an active lead', () async {
      final repository = FakeLeadRepository();
      final result = await CreateLeadUseCase(repository: repository)(
        makeLead(),
      );

      expect(result.id, 'lead-1');
      expect(repository.createCalls, 1);
    });

    test('rejects an already deleted lead', () async {
      final repository = FakeLeadRepository();
      final deletedLead = makeLead(deletedAt: now);

      expect(
        () => CreateLeadUseCase(repository: repository)(deletedLead),
        throwsArgumentError,
      );
      expect(repository.createCalls, 0);
    });
  });

  group('UpdateLeadStatusUseCase', () {
    test('validates and persists a permitted transition', () async {
      final repository = FakeLeadRepository()..storedLead = makeLead();

      await UpdateLeadStatusUseCase(repository: repository)(
        id: 'lead-1',
        tenantId: 'tenant-1',
        companyId: 'company-1',
        targetStatus: LeadStatus.assigned,
        updatedAt: now.add(const Duration(minutes: 1)),
      );

      expect(repository.updatedLead?.status, LeadStatus.assigned);
      expect(repository.requestedTenantId, 'tenant-1');
      expect(repository.requestedCompanyId, 'company-1');
      expect(repository.updateCalls, 1);
    });

    test('rejects a lead outside the requested scope', () async {
      final repository = FakeLeadRepository()..storedLead = makeLead();

      await expectLater(
        UpdateLeadStatusUseCase(repository: repository)(
          id: 'lead-1',
          tenantId: 'other-tenant',
          companyId: 'company-1',
          targetStatus: LeadStatus.assigned,
          updatedAt: now,
        ),
        throwsStateError,
      );
      expect(repository.updateCalls, 0);
    });

    test('rejects an invalid status transition', () async {
      final repository = FakeLeadRepository()..storedLead = makeLead();

      await expectLater(
        UpdateLeadStatusUseCase(repository: repository)(
          id: 'lead-1',
          tenantId: 'tenant-1',
          companyId: 'company-1',
          targetStatus: LeadStatus.won,
          updatedAt: now,
        ),
        throwsStateError,
      );
      expect(repository.updateCalls, 0);
    });
  });

  group('SoftDeleteLeadUseCase', () {
    test('persists soft deletion without removing the record', () async {
      final repository = FakeLeadRepository()..storedLead = makeLead();

      await SoftDeleteLeadUseCase(repository: repository)(
        id: 'lead-1',
        tenantId: 'tenant-1',
        companyId: 'company-1',
        deletedAt: now.add(const Duration(minutes: 1)),
      );

      expect(repository.updatedLead?.isDeleted, isTrue);
      expect(repository.storedLead?.id, 'lead-1');
      expect(repository.updateCalls, 1);
    });

    test('rejects a missing lead', () async {
      final repository = FakeLeadRepository();

      await expectLater(
        SoftDeleteLeadUseCase(repository: repository)(
          id: 'missing',
          tenantId: 'tenant-1',
          companyId: 'company-1',
          deletedAt: now,
        ),
        throwsStateError,
      );
      expect(repository.updateCalls, 0);
    });
  });
}
