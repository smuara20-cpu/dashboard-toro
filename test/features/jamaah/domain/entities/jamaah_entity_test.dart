import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/jamaah/domain/entities/jamaah_audit.dart';
import 'package:dashboard_kpi/features/jamaah/domain/entities/jamaah_entity.dart';
import 'package:dashboard_kpi/features/jamaah/domain/entities/jamaah_identity.dart';
import 'package:dashboard_kpi/features/jamaah/domain/entities/jamaah_lifecycle.dart';
import 'package:dashboard_kpi/features/jamaah/domain/entities/jamaah_status.dart';
import 'package:dashboard_kpi/features/jamaah/domain/value_objects/jamaah_business_number.dart';
import 'package:dashboard_kpi/features/jamaah/domain/value_objects/jamaah_customer_reference.dart';
import 'package:dashboard_kpi/features/jamaah/domain/value_objects/jamaah_id.dart';
import 'package:dashboard_kpi/features/jamaah/domain/value_objects/jamaah_tenant_context.dart';

class TestJamaahIdentity implements JamaahIdentity {
  const TestJamaahIdentity();
}

class TestJamaahStatus implements JamaahStatus {
  const TestJamaahStatus();
}

class TestJamaahLifecycle implements JamaahLifecycle {
  const TestJamaahLifecycle();
}

void main() {
  group('JamaahEntity', () {
    test('menyimpan canonical Jamaah domain contract', () {
      final createdAt = DateTime(2026, 9, 6, 10, 0);
      final updatedAt = DateTime(2026, 9, 6, 10, 5);

      final entity = JamaahEntity(
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

      expect(entity.id.value, 'jamaah-001');
      expect(entity.tenantContext.value, 'tenant-001');
      expect(entity.businessNumber.value, 'JMH-0001');
      expect(entity.customerReference.value, 'customer-001');
      expect(entity.identity, isA<TestJamaahIdentity>());
      expect(entity.status, isA<TestJamaahStatus>());
      expect(entity.lifecycle, isA<TestJamaahLifecycle>());
      expect(entity.audit.createdAt, createdAt);
      expect(entity.audit.updatedAt, updatedAt);
      expect(entity.audit.createdBy, 'user-001');
      expect(entity.audit.updatedBy, 'user-002');
    });
  });
}
