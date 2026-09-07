import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/jamaah/data/datasource/jamaah_local_datasource.dart';
import 'package:dashboard_kpi/features/jamaah/data/models/jamaah_model.dart';

void main() {
  final createdAt = DateTime(2026, 9, 7);

  JamaahModel buildModel({
    String id = 'jamaah-001',
    String tenantId = 'tenant-001',
    String customerId = 'customer-001',
    DateTime? deletedAt,
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
      deletedAt: deletedAt,
    );
  }

  group('JamaahLocalDataSource', () {
    test('create menyimpan dan mengembalikan jamaah', () async {
      final dataSource = JamaahLocalDataSource();
      final model = buildModel();

      final result = await dataSource.create(model);

      expect(result.id, 'jamaah-001');
      expect(
        await dataSource.getById(id: 'jamaah-001', tenantId: 'tenant-001'),
        model,
      );
    });

    test('getAll hanya mengembalikan data tenant yang aktif', () async {
      final dataSource = JamaahLocalDataSource(
        initialItems: [
          buildModel(),
          buildModel(id: 'jamaah-002', tenantId: 'tenant-002'),
          buildModel(id: 'jamaah-003', deletedAt: createdAt),
        ],
      );

      final result = await dataSource.getAll(tenantId: 'tenant-001');

      expect(result.length, 1);
      expect(result.single.id, 'jamaah-001');
    });

    test(
      'getByCustomerReference menerapkan tenant dan customer scope',
      () async {
        final dataSource = JamaahLocalDataSource(
          initialItems: [
            buildModel(),
            buildModel(id: 'jamaah-002', customerId: 'customer-002'),
            buildModel(id: 'jamaah-003', tenantId: 'tenant-002'),
          ],
        );

        final result = await dataSource.getByCustomerReference(
          customerId: 'customer-001',
          tenantId: 'tenant-001',
        );

        expect(result.length, 1);
        expect(result.single.id, 'jamaah-001');
      },
    );

    test('getById mengembalikan null jika tenant berbeda', () async {
      final dataSource = JamaahLocalDataSource(initialItems: [buildModel()]);

      final result = await dataSource.getById(
        id: 'jamaah-001',
        tenantId: 'tenant-999',
      );

      expect(result, isNull);
    });

    test('update memperbarui data pada tenant yang sama', () async {
      final dataSource = JamaahLocalDataSource(initialItems: [buildModel()]);

      final updated = JamaahModel(
        id: 'jamaah-001',
        tenantId: 'tenant-001',
        customerId: 'customer-002',
        jamaahCode: 'JMH-0002',
        identityData: const {'displayName': 'Ahmad Fauzan Updated'},
        status: 'active',
        lifecycle: 'active',
        createdAt: createdAt,
        updatedAt: createdAt.add(const Duration(minutes: 1)),
      );

      final result = await dataSource.update(updated);

      expect(result.customerId, 'customer-002');
      expect(
        (await dataSource.getAll(tenantId: 'tenant-001')).single.jamaahCode,
        'JMH-0002',
      );
    });

    test('create menolak duplicate id', () async {
      final dataSource = JamaahLocalDataSource(initialItems: [buildModel()]);

      expect(() => dataSource.create(buildModel()), throwsA(isA<StateError>()));
    });
  });
}
