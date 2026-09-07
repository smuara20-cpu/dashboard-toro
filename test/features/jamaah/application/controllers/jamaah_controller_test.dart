import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/jamaah/application/controllers/jamaah_controller.dart';
import 'package:dashboard_kpi/features/jamaah/application/state/jamaah_state.dart';
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
  final List<JamaahEntity> items;
  bool failCreate;
  bool failUpdate;
  bool failGetById;
  bool failGetAll;
  bool failGetByCustomerReference;

  _TestRepository({
    List<JamaahEntity>? initialItems,
    this.failCreate = false,
    this.failUpdate = false,
    this.failGetById = false,
    this.failGetAll = false,
    this.failGetByCustomerReference = false,
  }) : items = List<JamaahEntity>.from(initialItems ?? const []);

  @override
  Future<JamaahEntity> create(JamaahEntity jamaah) async {
    if (failCreate) {
      throw StateError('create failure');
    }

    items.add(jamaah);
    return jamaah;
  }

  @override
  Future<JamaahEntity?> getById({
    required JamaahId id,
    required JamaahTenantContext tenantContext,
  }) async {
    if (failGetById) {
      throw StateError('getById failure');
    }

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
    if (failGetAll) {
      throw StateError('getAll failure');
    }

    return items
        .where((item) => item.tenantContext.value == tenantContext.value)
        .toList();
  }

  @override
  Future<List<JamaahEntity>> getByCustomerReference({
    required JamaahCustomerReference customerReference,
    required JamaahTenantContext tenantContext,
  }) async {
    if (failGetByCustomerReference) {
      throw StateError('getByCustomerReference failure');
    }

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
    if (failUpdate) {
      throw StateError('update failure');
    }

    for (var index = 0; index < items.length; index++) {
      if (items[index].id.value == jamaah.id.value) {
        items[index] = jamaah;
        return jamaah;
      }
    }

    throw StateError('jamaah not found');
  }
}

JamaahEntity _buildJamaah({
  String id = 'jamaah-001',
  String tenantId = 'tenant-001',
  String customerId = 'customer-001',
  String displayName = 'Ahmad Fauzan',
}) {
  final now = DateTime(2026, 9, 7);

  return JamaahEntity(
    id: JamaahId(id),
    tenantContext: JamaahTenantContext(tenantId),
    businessNumber: const JamaahBusinessNumber('JMH-0001'),
    customerReference: JamaahCustomerReference(customerId),
    identity: _TestIdentity({'displayName': displayName}),
    status: const _TestStatus('active'),
    lifecycle: const _TestLifecycle('active'),
    audit: JamaahAudit(
      createdAt: now,
      updatedAt: now,
      createdBy: 'test',
      updatedBy: null,
    ),
  );
}

JamaahController _buildController(_TestRepository repository) {
  return JamaahController(
    createJamaahUseCase: CreateJamaahUseCase(repository: repository),
    getJamaahByIdUseCase: GetJamaahByIdUseCase(repository: repository),
    getJamaahsUseCase: GetJamaahsUseCase(repository: repository),
    getJamaahByCustomerReferenceUseCase: GetJamaahByCustomerReferenceUseCase(
      repository: repository,
    ),
    updateJamaahUseCase: UpdateJamaahUseCase(repository: repository),
  );
}

void main() {
  const tenantContext = JamaahTenantContext('tenant-001');
  const customerReference = JamaahCustomerReference('customer-001');

  group('JamaahController', () {
    test('default state adalah initial', () {
      final controller = _buildController(_TestRepository());

      expect(controller.state.status, JamaahStateStatus.initial);
      expect(controller.state.jamaahs, isEmpty);
      expect(controller.state.selectedJamaah, isNull);
    });

    test('initialize berhasil memuat jamaah', () async {
      final jamaah = _buildJamaah();
      final controller = _buildController(
        _TestRepository(initialItems: [jamaah]),
      );

      final result = await controller.initialize(tenantContext: tenantContext);

      expect(result, isTrue);
      expect(controller.state.status, JamaahStateStatus.success);
      expect(controller.state.jamaahs.single, same(jamaah));
    });

    test('initialize mengembalikan false ketika gagal', () async {
      final controller = _buildController(_TestRepository(failGetAll: true));

      final result = await controller.initialize(tenantContext: tenantContext);

      expect(result, isFalse);
      expect(controller.state.status, JamaahStateStatus.failure);
      expect(controller.state.errorMessage, contains('getAll failure'));
    });

    test('initialize menghasilkan empty ketika tidak ada jamaah', () async {
      final controller = _buildController(_TestRepository());

      final result = await controller.initialize(tenantContext: tenantContext);

      expect(result, isTrue);
      expect(controller.state.status, JamaahStateStatus.empty);
      expect(controller.state.jamaahs, isEmpty);
    });

    test('refresh memuat ulang jamaah', () async {
      final jamaah = _buildJamaah();
      final repository = _TestRepository();
      final controller = _buildController(repository);

      final firstResult = await controller.refresh(
        tenantContext: tenantContext,
      );

      expect(firstResult, isTrue);
      expect(controller.state.isEmpty, isTrue);

      repository.items.add(jamaah);

      final secondResult = await controller.refresh(
        tenantContext: tenantContext,
      );

      expect(secondResult, isTrue);
      expect(controller.state.isSuccess, isTrue);
      expect(controller.state.jamaahs.single, same(jamaah));
    });

    test('refresh mengembalikan false ketika reload gagal', () async {
      final repository = _TestRepository(failGetAll: true);
      final controller = _buildController(repository);

      final result = await controller.refresh(tenantContext: tenantContext);

      expect(result, isFalse);
      expect(controller.state.hasError, isTrue);
      expect(controller.state.errorMessage, contains('getAll failure'));
    });

    test('loadById berhasil memilih jamaah', () async {
      final jamaah = _buildJamaah();
      final controller = _buildController(
        _TestRepository(initialItems: [jamaah]),
      );

      await controller.loadById(id: jamaah.id, tenantContext: tenantContext);

      expect(controller.state.selectedJamaah, same(jamaah));
      expect(controller.state.errorMessage, isNull);
    });

    test('loadById membersihkan selection ketika tidak ditemukan', () async {
      final controller = _buildController(_TestRepository());

      await controller.loadById(
        id: const JamaahId('jamaah-not-found'),
        tenantContext: tenantContext,
      );

      expect(controller.state.selectedJamaah, isNull);
      expect(controller.state.errorMessage, isNull);
    });

    test('loadById menyimpan failure ketika repository gagal', () async {
      final controller = _buildController(_TestRepository(failGetById: true));

      await controller.loadById(
        id: const JamaahId('jamaah-001'),
        tenantContext: tenantContext,
      );

      expect(controller.state.hasError, isTrue);
      expect(controller.state.errorMessage, contains('getById failure'));
    });

    test('loadByCustomerReference berhasil', () async {
      final jamaah = _buildJamaah();
      final controller = _buildController(
        _TestRepository(initialItems: [jamaah]),
      );

      await controller.loadByCustomerReference(
        customerReference: customerReference,
        tenantContext: tenantContext,
      );

      expect(controller.state.isSuccess, isTrue);
      expect(controller.state.jamaahs.single, same(jamaah));
    });

    test('loadByCustomerReference menghasilkan empty', () async {
      final controller = _buildController(_TestRepository());

      await controller.loadByCustomerReference(
        customerReference: customerReference,
        tenantContext: tenantContext,
      );

      expect(controller.state.isEmpty, isTrue);
      expect(controller.state.jamaahs, isEmpty);
    });

    test('loadByCustomerReference menyimpan failure', () async {
      final controller = _buildController(
        _TestRepository(failGetByCustomerReference: true),
      );

      await controller.loadByCustomerReference(
        customerReference: customerReference,
        tenantContext: tenantContext,
      );

      expect(controller.state.hasError, isTrue);
      expect(
        controller.state.errorMessage,
        contains('getByCustomerReference failure'),
      );
    });

    test('create berhasil dan melakukan refresh', () async {
      final repository = _TestRepository();
      final controller = _buildController(repository);
      final jamaah = _buildJamaah();

      final result = await controller.create(jamaah);

      expect(result, isTrue);
      expect(controller.state.isSuccess, isTrue);
      expect(controller.state.jamaahs.single, same(jamaah));
    });

    test('create mengembalikan false ketika persistence gagal', () async {
      final repository = _TestRepository(failCreate: true);
      final controller = _buildController(repository);
      final jamaah = _buildJamaah();

      final result = await controller.create(jamaah);

      expect(result, isFalse);
      expect(controller.state.hasError, isTrue);
      expect(controller.state.errorMessage, contains('create failure'));
    });

    test(
      'create mengembalikan false ketika persistence berhasil tetapi refresh gagal',
      () async {
        final repository = _TestRepository(failGetAll: true);
        final controller = _buildController(repository);
        final jamaah = _buildJamaah();

        final result = await controller.create(jamaah);

        expect(result, isFalse);
        expect(controller.state.hasError, isTrue);
        expect(controller.state.errorMessage, contains('getAll failure'));
        expect(repository.items, contains(same(jamaah)));
      },
    );

    test('update berhasil dan melakukan refresh', () async {
      final jamaah = _buildJamaah();
      final updated = _buildJamaah(displayName: 'Ahmad Fauzan Updated');
      final repository = _TestRepository(initialItems: [jamaah]);
      final controller = _buildController(repository);

      final result = await controller.update(updated);

      expect(result, isTrue);
      expect(controller.state.isSuccess, isTrue);
      expect(controller.state.selectedJamaah, same(updated));
      expect(controller.state.jamaahs.single, same(updated));
    });

    test('update mengembalikan false ketika persistence gagal', () async {
      final jamaah = _buildJamaah();
      final repository = _TestRepository(
        initialItems: [jamaah],
        failUpdate: true,
      );
      final controller = _buildController(repository);

      final result = await controller.update(jamaah);

      expect(result, isFalse);
      expect(controller.state.hasError, isTrue);
      expect(controller.state.errorMessage, contains('update failure'));
    });

    test(
      'update mengembalikan false ketika persistence berhasil tetapi refresh gagal',
      () async {
        final jamaah = _buildJamaah();
        final updated = _buildJamaah(displayName: 'Ahmad Fauzan Updated');
        final repository = _TestRepository(
          initialItems: [jamaah],
          failGetAll: true,
        );
        final controller = _buildController(repository);

        final result = await controller.update(updated);

        expect(result, isFalse);
        expect(controller.state.hasError, isTrue);
        expect(controller.state.errorMessage, contains('getAll failure'));
        expect(repository.items.single, same(updated));
        expect(controller.state.selectedJamaah, same(updated));
      },
    );

    test('selectJamaah mengubah selected jamaah', () {
      final controller = _buildController(_TestRepository());
      final jamaah = _buildJamaah();

      controller.selectJamaah(jamaah);

      expect(controller.state.selectedJamaah, same(jamaah));
      expect(controller.state.errorMessage, isNull);
    });

    test('clearSelection menghapus selected jamaah', () {
      final controller = _buildController(_TestRepository());
      final jamaah = _buildJamaah();

      controller.selectJamaah(jamaah);
      controller.clearSelection();

      expect(controller.state.selectedJamaah, isNull);
    });

    test('create menggunakan tenant jamaah untuk refresh', () async {
      final jamaah = _buildJamaah(tenantId: 'tenant-special');
      final repository = _TestRepository();
      final controller = _buildController(repository);

      final result = await controller.create(jamaah);

      expect(result, isTrue);
      expect(controller.state.jamaahs.single, same(jamaah));
    });
  });
}
