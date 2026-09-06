import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/jamaah/domain/value_objects/jamaah_business_number.dart';

void main() {
  group('JamaahBusinessNumber', () {
    test('menyimpan business number dan valid ketika tidak kosong', () {
      const number = JamaahBusinessNumber('JMH-0001');

      expect(number.value, 'JMH-0001');
      expect(number.isValid, isTrue);
    });

    test('tidak valid ketika value kosong', () {
      const number = JamaahBusinessNumber('');

      expect(number.isValid, isFalse);
    });

    test('memiliki equality berbasis value', () {
      const first = JamaahBusinessNumber('JMH-0001');
      const second = JamaahBusinessNumber('JMH-0001');

      expect(first, second);
      expect(first.hashCode, second.hashCode);
    });
  });
}
