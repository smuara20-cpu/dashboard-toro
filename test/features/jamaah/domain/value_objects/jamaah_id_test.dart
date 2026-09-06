import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/jamaah/domain/value_objects/jamaah_id.dart';

void main() {
  group('JamaahId', () {
    test('menyimpan value dan valid ketika tidak kosong', () {
      const id = JamaahId('jamaah-001');

      expect(id.value, 'jamaah-001');
      expect(id.isValid, isTrue);
    });

    test('tidak valid ketika value kosong', () {
      const id = JamaahId('');

      expect(id.isValid, isFalse);
    });

    test('memiliki equality berbasis value', () {
      const first = JamaahId('jamaah-001');
      const second = JamaahId('jamaah-001');

      expect(first, second);
      expect(first.hashCode, second.hashCode);
    });
  });
}
