import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/jamaah/application/state/jamaah_state.dart';
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

JamaahEntity buildJamaah({String id = 'jamaah-001'}) {
  final now = DateTime(2026, 9, 7);

  return JamaahEntity(
    id: JamaahId(id),
    tenantContext: const JamaahTenantContext('tenant-001'),
    businessNumber: const JamaahBusinessNumber('JMH-0001'),
    customerReference: const JamaahCustomerReference('customer-001'),
    identity: const _TestIdentity({'displayName': 'Ahmad Fauzan'}),
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

void main() {
  group('JamaahState', () {
    test('default state adalah initial', () {
      const state = JamaahState();

      expect(state.status, JamaahStateStatus.initial);
      expect(state.jamaahs, isEmpty);
      expect(state.selectedJamaah, isNull);
      expect(state.errorMessage, isNull);
      expect(state.isLoading, isFalse);
      expect(state.isSuccess, isFalse);
      expect(state.isEmpty, isFalse);
      expect(state.hasError, isFalse);
    });

    test('copyWith dapat mengubah status dan selected jamaah', () {
      const state = JamaahState();
      final jamaah = buildJamaah();

      final updated = state.copyWith(
        status: JamaahStateStatus.success,
        jamaahs: [jamaah],
        selectedJamaah: jamaah,
      );

      expect(updated.status, JamaahStateStatus.success);
      expect(updated.jamaahs.single, same(jamaah));
      expect(updated.selectedJamaah, same(jamaah));
      expect(updated.isSuccess, isTrue);
    });

    test('copyWith dapat menghapus selected jamaah', () {
      final jamaah = buildJamaah();

      final state = JamaahState(
        status: JamaahStateStatus.success,
        jamaahs: [jamaah],
        selectedJamaah: jamaah,
      );

      final updated = state.copyWith(clearSelectedJamaah: true);

      expect(updated.selectedJamaah, isNull);
      expect(updated.jamaahs.single, same(jamaah));
    });

    test('copyWith dapat menghapus error message tanpa mengubah status', () {
      const state = JamaahState(
        status: JamaahStateStatus.failure,
        errorMessage: 'error',
      );

      final updated = state.copyWith(clearErrorMessage: true);

      expect(updated.errorMessage, isNull);
      expect(updated.status, JamaahStateStatus.failure);
      expect(updated.hasError, isTrue);
    });
  });
}
