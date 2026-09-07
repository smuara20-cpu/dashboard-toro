import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/jamaah/data/mapper/jamaah_mapper.dart';
import 'package:dashboard_kpi/features/jamaah/data/models/jamaah_model.dart';
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
  final Map<String, dynamic> data;

  const TestJamaahIdentity(this.data);

  @override
  Map<String, dynamic> toData() {
    return Map<String, dynamic>.from(data);
  }
}

class TestJamaahStatus implements JamaahStatus {
  @override
  final String value;

  const TestJamaahStatus(this.value);
}

class TestJamaahLifecycle implements JamaahLifecycle {
  @override
  final String value;

  const TestJamaahLifecycle(this.value);
}

void main() {
  group('JamaahMapper', () {
    final createdAt = DateTime(2026, 9, 6, 10, 0);
    final updatedAt = DateTime(2026, 9, 6, 10, 5);

    final entity = JamaahEntity(
      id: const JamaahId('jamaah-001'),
      tenantContext: const JamaahTenantContext('tenant-001'),
      businessNumber: const JamaahBusinessNumber('JMH-0001'),
      customerReference: const JamaahCustomerReference('customer-001'),
      identity: const TestJamaahIdentity({'full_name': 'Ahmad Fauzan'}),
      status: const TestJamaahStatus('active'),
      lifecycle: const TestJamaahLifecycle('active'),
      audit: JamaahAudit(
        createdAt: createdAt,
        updatedAt: updatedAt,
        createdBy: 'user-001',
        updatedBy: 'user-002',
      ),
    );

    test('maps model to entity', () {
      final model = JamaahModel(
        id: 'jamaah-001',
        tenantId: 'tenant-001',
        customerId: 'customer-001',
        jamaahCode: 'JMH-0001',
        identityData: const {'full_name': 'Ahmad Fauzan'},
        status: 'active',
        lifecycle: 'active',
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

      const mapper = JamaahMapper();
      final result = mapper.toEntity(model);

      expect(result.id.value, 'jamaah-001');
      expect(result.tenantContext.value, 'tenant-001');
      expect(result.customerReference.value, 'customer-001');
      expect(result.businessNumber.value, 'JMH-0001');
      expect(result.identity.toData(), {'full_name': 'Ahmad Fauzan'});
      expect(result.status.value, 'active');
      expect(result.lifecycle.value, 'active');
      expect(result.audit.createdAt, createdAt);
      expect(result.audit.updatedAt, updatedAt);
    });

    test('maps entity to model tanpa kehilangan identity data', () {
      const mapper = JamaahMapper();
      final result = mapper.toModel(entity);

      expect(result.id, 'jamaah-001');
      expect(result.tenantId, 'tenant-001');
      expect(result.customerId, 'customer-001');
      expect(result.jamaahCode, 'JMH-0001');
      expect(result.identityData, {'full_name': 'Ahmad Fauzan'});
      expect(result.status, 'active');
      expect(result.lifecycle, 'active');
      expect(result.createdAt, createdAt);
      expect(result.updatedAt, updatedAt);
      expect(result.deletedAt, isNull);
    });
  });
}
