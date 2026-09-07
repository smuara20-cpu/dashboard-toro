import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/jamaah/domain/entities/jamaah_audit.dart';
import 'package:dashboard_kpi/features/jamaah/domain/entities/jamaah_entity.dart';
import 'package:dashboard_kpi/features/jamaah/domain/entities/jamaah_identity.dart';
import 'package:dashboard_kpi/features/jamaah/domain/entities/jamaah_lifecycle.dart';
import 'package:dashboard_kpi/features/jamaah/domain/entities/jamaah_status.dart';
import 'package:dashboard_kpi/features/jamaah/domain/repository/jamaah_repository.dart';
import 'package:dashboard_kpi/features/jamaah/domain/value_objects/jamaah_business_number.dart';
import 'package:dashboard_kpi/features/jamaah/domain/value_objects/jamaah_customer_reference.dart';
import 'package:dashboard_kpi/features/jamaah/domain/value_objects/jamaah_id.dart';
import 'package:dashboard_kpi/features/jamaah/domain/value_objects/jamaah_tenant_context.dart';

class TestJamaahIdentity implements JamaahIdentity {
  const TestJamaahIdentity();

  @override
  Map<String, dynamic> toData() {
    return const {};
  }
}

class TestJamaahStatus implements JamaahStatus {
  const TestJamaahStatus();

  @override
  String get value => 'test';
}

class TestJamaahLifecycle implements JamaahLifecycle {
  const TestJamaahLifecycle();

  @override
  String get value => 'test';
}

class TestJamaahRepository implements JamaahRepository {
  const TestJamaahRepository();

  @override
  Future<JamaahEntity> create(JamaahEntity jamaah) async {
    return jamaah;
  }

  @override
  Future<JamaahEntity?> getById({
    required JamaahId id,
    required JamaahTenantContext tenantContext,
  }) async {
    return null;
  }

  @override
  Future<List<JamaahEntity>> getAll({
    required JamaahTenantContext tenantContext,
  }) async {
    return [];
  }

  @override
  Future<List<JamaahEntity>> getByCustomerReference({
    required JamaahCustomerReference customerReference,
    required JamaahTenantContext tenantContext,
  }) async {
    return [];
  }

  @override
  Future<JamaahEntity> update(JamaahEntity jamaah) async {
    return jamaah;
  }
}

void main() {
  group('JamaahRepository', () {
    test('mendukung canonical repository contract', () async {
      const repository = TestJamaahRepository();

      final createdAt = DateTime(2026, 9, 6, 10, 0);
      final updatedAt = DateTime(2026, 9, 6, 10, 5);

      final jamaah = JamaahEntity(
        id: const JamaahId('jamaah-001'),
        tenantContext: const JamaahTenantContext('tenant-001'),
        businessNumber: const JamaahBusinessNumber('JMH-0001'),
        customerReference: const JamaahCustomerReference('customer-001'),
        identity: const TestJamaahIdentity(),
        status: const TestJamaahStatus(),
        lifecycle: const TestJamaahLifecycle(),
        audit: JamaahAudit(
          createdAt: createdAt,
          updatedAt: updatedAt,
          createdBy: 'user-001',
          updatedBy: 'user-002',
        ),
      );

      final created = await repository.create(jamaah);
      final byId = await repository.getById(
        id: jamaah.id,
        tenantContext: jamaah.tenantContext,
      );
      final all = await repository.getAll(tenantContext: jamaah.tenantContext);
      final byCustomer = await repository.getByCustomerReference(
        customerReference: jamaah.customerReference,
        tenantContext: jamaah.tenantContext,
      );
      final updated = await repository.update(jamaah);

      expect(created, same(jamaah));
      expect(byId, isNull);
      expect(all, isEmpty);
      expect(byCustomer, isEmpty);
      expect(updated, same(jamaah));
    });
  });
}
