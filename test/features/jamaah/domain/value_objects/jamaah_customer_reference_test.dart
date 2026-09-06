import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/jamaah/domain/value_objects/jamaah_customer_reference.dart';

void main() {
  group('JamaahCustomerReference', () {
    test('menyimpan customer reference dan valid ketika tidak kosong', () {
      const reference = JamaahCustomerReference('customer-001');

      expect(reference.value, 'customer-001');
      expect(reference.isValid, isTrue);
    });

    test('tidak valid ketika value kosong', () {
      const reference = JamaahCustomerReference('');

      expect(reference.isValid, isFalse);
    });

    test('memiliki equality berbasis value', () {
      const first = JamaahCustomerReference('customer-001');
      const second = JamaahCustomerReference('customer-001');

      expect(first, second);
      expect(first.hashCode, second.hashCode);
    });
  });
}
