import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/jamaah/data/models/jamaah_model.dart';

void main() {
  group('JamaahModel', () {
    final createdAt = DateTime(2026, 9, 6, 10, 0);
    final updatedAt = DateTime(2026, 9, 6, 10, 5);

    test('mendukung serialization dan deserialization', () {
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

      final json = model.toJson();
      final restored = JamaahModel.fromJson(json);

      expect(restored.id, model.id);
      expect(restored.tenantId, model.tenantId);
      expect(restored.customerId, model.customerId);
      expect(restored.jamaahCode, model.jamaahCode);
      expect(restored.identityData, model.identityData);
      expect(restored.status, model.status);
      expect(restored.lifecycle, model.lifecycle);
      expect(restored.createdAt, model.createdAt);
      expect(restored.updatedAt, model.updatedAt);
      expect(restored.deletedAt, isNull);
    });

    test('mendukung soft delete timestamp', () {
      final deletedAt = DateTime(2026, 9, 6, 11, 0);

      final model = JamaahModel(
        id: 'jamaah-001',
        tenantId: 'tenant-001',
        customerId: 'customer-001',
        jamaahCode: 'JMH-0001',
        identityData: const {},
        status: 'inactive',
        lifecycle: 'archived',
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
      );

      final restored = JamaahModel.fromJson(model.toJson());

      expect(restored.deletedAt, deletedAt);
    });
  });
}
