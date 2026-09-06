import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/jamaah/domain/entities/jamaah_audit.dart';

void main() {
  group('JamaahAudit', () {
    test('menyimpan audit metadata', () {
      final createdAt = DateTime(2026, 9, 6, 10, 0);
      final updatedAt = DateTime(2026, 9, 6, 10, 5);

      const createdBy = 'user-001';
      const updatedBy = 'user-002';

      final audit = JamaahAudit(
        createdAt: createdAt,
        updatedAt: updatedAt,
        createdBy: createdBy,
        updatedBy: updatedBy,
      );

      expect(audit.createdAt, createdAt);
      expect(audit.updatedAt, updatedAt);
      expect(audit.createdBy, createdBy);
      expect(audit.updatedBy, updatedBy);
    });
  });
}
