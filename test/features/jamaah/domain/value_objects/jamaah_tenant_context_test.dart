import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/jamaah/domain/value_objects/jamaah_tenant_context.dart';

void main() {
  group('JamaahTenantContext', () {
    test('menyimpan tenant context dan valid ketika tidak kosong', () {
      const context = JamaahTenantContext('tenant-001');

      expect(context.value, 'tenant-001');
      expect(context.isValid, isTrue);
    });

    test('tidak valid ketika value kosong', () {
      const context = JamaahTenantContext('');

      expect(context.isValid, isFalse);
    });

    test('memiliki equality berbasis value', () {
      const first = JamaahTenantContext('tenant-001');
      const second = JamaahTenantContext('tenant-001');

      expect(first, second);
      expect(first.hashCode, second.hashCode);
    });
  });
}
