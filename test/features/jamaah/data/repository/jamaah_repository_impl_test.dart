import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/jamaah/data/datasource/jamaah_local_datasource.dart';
import 'package:dashboard_kpi/features/jamaah/data/mapper/jamaah_mapper.dart';
import 'package:dashboard_kpi/features/jamaah/data/models/jamaah_model.dart';
import 'package:dashboard_kpi/features/jamaah/data/repository/jamaah_repository_impl.dart';
import 'package:dashboard_kpi/features/jamaah/domain/entities/jamaah_audit.dart';
import 'package:dashboard_kpi/features/jamaah/domain/entities/jamaah_entity.dart';
import 'package:dashboard_kpi/features/jamaah/domain/entities/jamaah_identity.dart';
import 'package:dashboard_kpi/features/jamaah/domain/entities/jamaah_lifecycle.dart';
import 'package:dashboard_kpi/features/jamaah/domain/entities/jamaah_status.dart';
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

void main() {
  final createdAt = DateTime(2026, 9, 7);

  JamaahModel buildModel({
    String id = 'jamaah-001',
    String tenantId = 'tenant-001',
    String customerId = 'customer-001',
  }) {
    return JamaahModel(
      id: id,
      tenantId: tenantId,
      customerId: customerId,
      jamaahCode: 'JMH-0001',
      identityData: const {'displayName': 'Ahmad Fauzan'},
      status: 'active',
      lifecycle: 'active',
      createdAt: createdAt,
      updatedAt: createdAt,
    );
  }

  JamaahEntity buildEntity({
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

  group('JamaahRepositoryImpl', () {
    test(
      'create menyimpan entity melalui datasource dan mengembalikan entity',
      () async {
        final dataSource = JamaahLocalDataSource();
        final repository = JamaahRepositoryImpl(
          dataSource: dataSource,
          mapper: const JamaahMapper(),
        );

        final result = await repository.create(buildEntity());

        expect(result.id.value, 'jamaah-001');
        expect(result.tenantContext.value, 'tenant-001');
        expect(result.customerReference.value, 'customer-001');
      },
    );

    test('getById menerapkan tenant scope', () async {
      final dataSource = JamaahLocalDataSource(initialItems: [buildModel()]);
      final repository = JamaahRepositoryImpl(
        dataSource: dataSource,
        mapper: const JamaahMapper(),
      );

      final found = await repository.getById(
        id: const JamaahId('jamaah-001'),
        tenantContext: const JamaahTenantContext('tenant-001'),
      );

      final notFound = await repository.getById(
        id: const JamaahId('jamaah-001'),
        tenantContext: const JamaahTenantContext('tenant-999'),
      );

      expect(found, isNotNull);
      expect(found!.id.value, 'jamaah-001');
      expect(notFound, isNull);
    });

    test('getAll memetakan model menjadi entity', () async {
      final dataSource = JamaahLocalDataSource(
        initialItems: [
          buildModel(),
          buildModel(id: 'jamaah-002', customerId: 'customer-002'),
        ],
      );
      final repository = JamaahRepositoryImpl(
        dataSource: dataSource,
        mapper: const JamaahMapper(),
      );

      final result = await repository.getAll(
        tenantContext: const JamaahTenantContext('tenant-001'),
      );

      expect(result.length, 2);
      expect(result[0], isA<JamaahEntity>());
      expect(result[1].id.value, 'jamaah-002');
    });

    test(
      'getByCustomerReference menerapkan tenant dan customer scope',
      () async {
        final dataSource = JamaahLocalDataSource(
          initialItems: [
            buildModel(),
            buildModel(id: 'jamaah-002', customerId: 'customer-002'),
          ],
        );
        final repository = JamaahRepositoryImpl(
          dataSource: dataSource,
          mapper: const JamaahMapper(),
        );

        final result = await repository.getByCustomerReference(
          customerReference: const JamaahCustomerReference('customer-001'),
          tenantContext: const JamaahTenantContext('tenant-001'),
        );

        expect(result.length, 1);
        expect(result.single.customerReference.value, 'customer-001');
      },
    );

    test('update memetakan entity ke model lalu kembali ke entity', () async {
      final dataSource = JamaahLocalDataSource(initialItems: [buildModel()]);
      final repository = JamaahRepositoryImpl(
        dataSource: dataSource,
        mapper: const JamaahMapper(),
      );

      final entity = buildEntity();

      final result = await repository.update(entity);

      expect(result.id.value, 'jamaah-001');
      expect(result.businessNumber.value, 'JMH-0001');
      expect(result.customerReference.value, 'customer-001');
    });
  });
}
