import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/jamaah/application/usecases/create_jamaah_usecase.dart';
import 'package:dashboard_kpi/features/jamaah/application/usecases/get_jamaah_by_customer_reference_usecase.dart';
import 'package:dashboard_kpi/features/jamaah/application/usecases/get_jamaah_by_id_usecase.dart';
import 'package:dashboard_kpi/features/jamaah/application/usecases/get_jamaahs_usecase.dart';
import 'package:dashboard_kpi/features/jamaah/application/usecases/update_jamaah_usecase.dart';
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

final class _TestIdentity implements JamaahIdentity {
  final Map<String, dynamic> data;

  const _TestIdentity(this.data);

  @override
  Map<String, dynamic> toData() {
    return Map<String, dynamic>.from(data);
  }
}

final class _TestStatus implements JamaahStatus {
  @override
  final String value;

  const _TestStatus(this.value);
}

final class _TestLifecycle implements JamaahLifecycle {
  @override
  final String value;

  const _TestLifecycle(this.value);
}

final class _TestRepository implements JamaahRepository {
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
      if (item.id.value == id.value &&
          item.tenantContext.value == tenantContext.value) {
        return item;
      }
    }

    return null;
  }

  @override
  Future<List<JamaahEntity>> getAll({
    required JamaahTenantContext tenantContext,
  }) async {
    return items
        .where((item) => item.tenantContext.value == tenantContext.value)
        .toList();
  }

  @override
  Future<List<JamaahEntity>> getByCustomerReference({
    required JamaahCustomerReference customerReference,
    required JamaahTenantContext tenantContext,
  }) async {
    return items
        .where(
          (item) =>
              item.customerReference.value == customerReference.value &&
              item.tenantContext.value == tenantContext.value,
        )
        .toList();
  }

  @override
  Future<JamaahEntity> update(JamaahEntity jamaah) async {
    for (var index = 0; index < items.length; index++) {
      if (items[index].id.value == jamaah.id.value &&
          items[index].tenantContext.value == jamaah.tenantContext.value) {
        items[index] = jamaah;
        return jamaah;
      }
    }

    throw StateError('Jamaah dengan id ${jamaah.id.value} tidak ditemukan.');
  }
}

void main() {
  final createdAt = DateTime(2026, 9, 7);

  JamaahEntity buildJamaah({
    String id = 'jamaah-001',
    String tenantId = 'tenant-001',
    String customerId = 'customer-001',
  }) {
    return JamaahEntity(
      id: JamaahId(id),
      tenantContext: JamaahTenantContext(tenantId),
      businessNumber: const JamaahBusinessNumber('JMH-0001'),
      customerReference: JamaahCustomerReference(customerId),
      identity: const _TestIdentity({'displayName': 'Ahmad Fauzan'}),
      status: const _TestStatus('active'),
      lifecycle: const _TestLifecycle('active'),
      audit: JamaahAudit(
        createdAt: createdAt,
        updatedAt: createdAt,
        createdBy: 'test',
        updatedBy: null,
      ),
    );
  }

  group('Jamaah Application UseCases', () {
    test('CreateJamaahUseCase mendelegasikan create ke repository', () async {
      final repository = _TestRepository();
      final useCase = CreateJamaahUseCase(repository: repository);
      final jamaah = buildJamaah();

      final result = await useCase(jamaah);

      expect(result, same(jamaah));
      expect(repository.items, hasLength(1));
    });

    test('GetJamaahByIdUseCase meneruskan id dan tenant context', () async {
      final repository = _TestRepository();
      final jamaah = buildJamaah();
      await repository.create(jamaah);

      final useCase = GetJamaahByIdUseCase(repository: repository);

      final result = await useCase(
        id: const JamaahId('jamaah-001'),
        tenantContext: const JamaahTenantContext('tenant-001'),
      );

      expect(result, same(jamaah));
    });

    test('GetJamaahsUseCase mengembalikan jamaah tenant yang sesuai', () async {
      final repository = _TestRepository();
      await repository.create(buildJamaah());
      await repository.create(
        buildJamaah(id: 'jamaah-002', tenantId: 'tenant-002'),
      );

      final useCase = GetJamaahsUseCase(repository: repository);

      final result = await useCase(
        tenantContext: const JamaahTenantContext('tenant-001'),
      );

      expect(result, hasLength(1));
      expect(result.single.id.value, 'jamaah-001');
    });

    test(
      'GetJamaahByCustomerReferenceUseCase meneruskan customer dan tenant',
      () async {
        final repository = _TestRepository();
        await repository.create(buildJamaah());
        await repository.create(
          buildJamaah(id: 'jamaah-002', customerId: 'customer-002'),
        );

        final useCase = GetJamaahByCustomerReferenceUseCase(
          repository: repository,
        );

        final result = await useCase(
          customerReference: const JamaahCustomerReference('customer-001'),
          tenantContext: const JamaahTenantContext('tenant-001'),
        );

        expect(result, hasLength(1));
        expect(result.single.customerReference.value, 'customer-001');
      },
    );

    test('UpdateJamaahUseCase mendelegasikan update ke repository', () async {
      final repository = _TestRepository();
      final jamaah = buildJamaah();
      await repository.create(jamaah);

      final useCase = UpdateJamaahUseCase(repository: repository);

      final result = await useCase(jamaah);

      expect(result, same(jamaah));
      expect(repository.items.single, same(jamaah));
    });
  });
}
