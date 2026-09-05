import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/data/datasource/package_local_datasource.dart';

void main() {
  group('PackageLocalDataSource', () {
    late PackageLocalDataSource dataSource;

    setUp(() {
      dataSource = PackageLocalDataSource();
    });

    test('mengembalikan seluruh package', () async {
      final packages = await dataSource.getPackages();

      expect(packages, hasLength(4));
    });

    test('mengembalikan package berdasarkan id', () async {
      final package = await dataSource.getPackageById('package-001');

      expect(package, isNotNull);
      expect(package!.packageCode, 'UMR-2026-001');
    });

    test('mengembalikan null jika package tidak ditemukan', () async {
      final package = await dataSource.getPackageById('package-999');

      expect(package, isNull);
    });
  });
}
