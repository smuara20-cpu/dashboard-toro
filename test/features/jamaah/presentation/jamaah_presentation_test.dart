import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/jamaah/application/controllers/jamaah_controller.dart';
import 'package:dashboard_kpi/features/jamaah/application/providers/jamaah_provider.dart';
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
import 'package:dashboard_kpi/features/jamaah/presentation/pages/jamaah_page.dart';
import 'package:dashboard_kpi/features/jamaah/presentation/widgets/jamaah_card.dart';
import 'package:dashboard_kpi/features/jamaah/presentation/widgets/jamaah_empty_state.dart';
import 'package:dashboard_kpi/features/jamaah/presentation/widgets/jamaah_error_state.dart';
import 'package:dashboard_kpi/features/jamaah/presentation/widgets/jamaah_loading_state.dart';

final class _FakeIdentity implements JamaahIdentity {
  final Map<String, dynamic> data;

  const _FakeIdentity(this.data);

  @override
  Map<String, dynamic> toData() => data;
}

final class _FakeStatus implements JamaahStatus {
  @override
  final String value;

  const _FakeStatus(this.value);
}

final class _FakeLifecycle implements JamaahLifecycle {
  @override
  final String value;

  const _FakeLifecycle(this.value);
}

final class _FakeRepository implements JamaahRepository {
  final List<JamaahEntity> items;

  _FakeRepository({List<JamaahEntity> initialItems = const []})
    : items = List<JamaahEntity>.from(initialItems);

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
    for (final jamaah in items) {
      if (jamaah.id.value == id.value &&
          jamaah.tenantContext.value == tenantContext.value) {
        return jamaah;
      }
    }

    return null;
  }

  @override
  Future<List<JamaahEntity>> getAll({
    required JamaahTenantContext tenantContext,
  }) async {
    return items
        .where((jamaah) => jamaah.tenantContext.value == tenantContext.value)
        .toList();
  }

  @override
  Future<List<JamaahEntity>> getByCustomerReference({
    required JamaahCustomerReference customerReference,
    required JamaahTenantContext tenantContext,
  }) async {
    return items
        .where(
          (jamaah) =>
              jamaah.customerReference.value == customerReference.value &&
              jamaah.tenantContext.value == tenantContext.value,
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

    throw StateError('jamaah not found');
  }
}

JamaahEntity _buildJamaah({String id = 'jmh-001'}) {
  final now = DateTime(2026, 9, 7);

  return JamaahEntity(
    id: JamaahId(id),
    tenantContext: const JamaahTenantContext('tenant-test'),
    businessNumber: const JamaahBusinessNumber('JMH-0001'),
    customerReference: const JamaahCustomerReference('CUS-0001'),
    identity: const _FakeIdentity(<String, dynamic>{
      'displayName': 'Ahmad Fauzan',
    }),
    status: const _FakeStatus('Aktif'),
    lifecycle: const _FakeLifecycle('active'),
    audit: JamaahAudit(
      createdAt: now,
      updatedAt: now,
      createdBy: 'test',
      updatedBy: null,
    ),
  );
}

JamaahController _buildController({
  List<JamaahEntity> initialItems = const [],
}) {
  final repository = _FakeRepository(initialItems: initialItems);

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
  testWidgets('Jamaah loading state renders', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: JamaahLoadingState())),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Jamaah empty state renders', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: JamaahEmptyState())),
    );

    expect(find.text('Belum ada data Jamaah'), findsOneWidget);
  });

  testWidgets('Jamaah card renders approved safe fields', (tester) async {
    final jamaah = _buildJamaah();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: JamaahCard(jamaah: jamaah)),
      ),
    );

    expect(find.text('JMH-0001'), findsOneWidget);
    expect(find.text('Customer: CUS-0001'), findsOneWidget);
    expect(find.text('Aktif'), findsOneWidget);
    expect(find.text('Lifecycle: active'), findsOneWidget);
  });

  testWidgets('Jamaah error state exposes retry action', (tester) async {
    var retried = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: JamaahErrorState(
            message: 'Test error',
            onRetry: () => retried = true,
          ),
        ),
      ),
    );

    expect(find.text('Gagal memuat data Jamaah'), findsOneWidget);
    expect(find.text('Coba Lagi'), findsOneWidget);

    await tester.tap(find.text('Coba Lagi'));
    await tester.pump();

    expect(retried, isTrue);
  });

  testWidgets('Jamaah page renders success list', (tester) async {
    final jamaah = _buildJamaah();

    final controller = _buildController(initialItems: [jamaah]);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [jamaahControllerProvider.overrideWithValue(controller)],
        child: MaterialApp(
          home: JamaahPage(
            tenantContext: const JamaahTenantContext('tenant-test'),
          ),
        ),
      ),
    );

    await tester.pump();
    await tester.pump();

    expect(find.text('JMH-0001'), findsOneWidget);
    expect(find.text('Customer: CUS-0001'), findsOneWidget);
  });

  testWidgets('Jamaah page renders empty state from controller', (
    tester,
  ) async {
    final controller = _buildController();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [jamaahControllerProvider.overrideWithValue(controller)],
        child: MaterialApp(
          home: JamaahPage(
            tenantContext: const JamaahTenantContext('tenant-test'),
          ),
        ),
      ),
    );

    await tester.pump();
    await tester.pump();

    expect(find.text('Belum ada data Jamaah'), findsOneWidget);
  });

  testWidgets('Jamaah page uses explicit tenant context', (tester) async {
    final jamaah = _buildJamaah();

    final controller = _buildController(initialItems: [jamaah]);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [jamaahControllerProvider.overrideWithValue(controller)],
        child: MaterialApp(
          home: JamaahPage(
            tenantContext: const JamaahTenantContext('tenant-test'),
          ),
        ),
      ),
    );

    await tester.pump();
    await tester.pump();

    expect(controller.state.jamaahs, hasLength(1));
    expect(controller.state.jamaahs.single.tenantContext.value, 'tenant-test');
  });
}
