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

class TestJamaahRepository implements JamaahRepository {
  final List<JamaahEntity> items = [];

  @override
  Future<JamaahEntity> create(JamaahEntity jamaah) async {
    items.add(jamaah);
    return jamaah;
  }

  @override
  Future<JamaahEntity?> getById({
    required JamaahId id,
    required JamaahTenantContext tenantContext,
  }) async {
    for (final item in items) {
      if (item.id == id && item.tenantContext == tenantContext) {
        return item;
      }
    }

    return null;
  }

  @override
  Future<List<JamaahEntity>> getAll({
    required JamaahTenantContext tenantContext,
  }) async {
    return items.where((item) => item.tenantContext == tenantContext).toList();
  }

  @override
  Future<List<JamaahEntity>> getByCustomerReference({
    required JamaahCustomerReference customerReference,
    required JamaahTenantContext tenantContext,
  }) async {
    return items
        .where(
          (item) =>
              item.customerReference == customerReference &&
              item.tenantContext == tenantContext,
        )
        .toList();
  }

  @override
  Future<JamaahEntity> update(JamaahEntity jamaah) async {
    final index = items.indexWhere((item) => item.id == jamaah.id);

    if (index == -1) {
      throw StateError('Jamaah not found.');
    }

    items[index] = jamaah;
    return jamaah;
  }
}

final class TestIdentity implements JamaahIdentity {
  const TestIdentity();

  @override
  Map<String, dynamic> toData() {
    return const {'name': 'Test Jamaah'};
  }
}

final class TestStatus implements JamaahStatus {
  const TestStatus();

  @override
  String get value => 'active';
}

final class TestLifecycle implements JamaahLifecycle {
  const TestLifecycle();

  @override
  String get value => 'active';
}

JamaahEntity createTestJamaah({
  String id = 'jamaah-001',
  String tenantId = 'tenant-001',
  String customerId = 'customer-001',
  String businessNumber = 'JMH-0001',
}) {
  final now = DateTime(2026, 9, 7);

  return JamaahEntity(
    id: JamaahId(id),
    tenantContext: JamaahTenantContext(tenantId),
    businessNumber: JamaahBusinessNumber(businessNumber),
    customerReference: JamaahCustomerReference(customerId),
    identity: const TestIdentity(),
    status: const TestStatus(),
    lifecycle: const TestLifecycle(),
    audit: JamaahAudit(
      createdAt: now,
      updatedAt: now,
      createdBy: 'test',
      updatedBy: null,
    ),
  );
}

void main() {
  group('JamaahRepository contract', () {
    test(
      'dapat membuat dan membaca Jamaah berdasarkan ID dan tenant',
      () async {
        final repository = TestJamaahRepository();
        final jamaah = createTestJamaah();

        await repository.create(jamaah);

        final result = await repository.getById(
          id: jamaah.id,
          tenantContext: jamaah.tenantContext,
        );

        expect(result, jamaah);
      },
    );

    test('getAll hanya mengembalikan Jamaah pada tenant yang sama', () async {
      final repository = TestJamaahRepository();

      final tenantOne = createTestJamaah(
        id: 'jamaah-001',
        businessNumber: 'JMH-0001',
      );

      final tenantTwo = createTestJamaah(
        id: 'jamaah-002',
        tenantId: 'tenant-002',
        businessNumber: 'JMH-0002',
      );

      await repository.create(tenantOne);
      await repository.create(tenantTwo);

      final result = await repository.getAll(
        tenantContext: tenantOne.tenantContext,
      );

      expect(result, hasLength(1));
      expect(result.single.id, tenantOne.id);
    });

    test(
      'dapat membaca Jamaah berdasarkan customer reference dan tenant',
      () async {
        final repository = TestJamaahRepository();

        final first = createTestJamaah(
          id: 'jamaah-001',
          businessNumber: 'JMH-0001',
        );

        final second = createTestJamaah(
          id: 'jamaah-002',
          businessNumber: 'JMH-0002',
        );

        await repository.create(first);
        await repository.create(second);

        final result = await repository.getByCustomerReference(
          customerReference: first.customerReference,
          tenantContext: first.tenantContext,
        );

        expect(result, hasLength(2));
      },
    );

    test('dapat memperbarui Jamaah', () async {
      final repository = TestJamaahRepository();
      final jamaah = createTestJamaah();

      await repository.create(jamaah);

      final updated = createTestJamaah(
        id: jamaah.id.value,
        businessNumber: 'JMH-UPDATED',
      );

      final result = await repository.update(updated);

      expect(result.businessNumber.value, 'JMH-UPDATED');

      final stored = await repository.getById(
        id: jamaah.id,
        tenantContext: jamaah.tenantContext,
      );

      expect(stored?.businessNumber.value, 'JMH-UPDATED');
    });
  });
}
