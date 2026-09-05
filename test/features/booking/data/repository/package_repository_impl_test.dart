import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/data/datasource/package_local_datasource.dart';
import 'package:dashboard_kpi/features/booking/data/mapper/package_mapper.dart';
import 'package:dashboard_kpi/features/booking/data/repository/package_repository_impl.dart';

void main() {
  group('PackageRepositoryImpl', () {
    late PackageRepositoryImpl repository;

    setUp(() {
      repository = PackageRepositoryImpl(
        dataSource: PackageLocalDataSource(),
        mapper: const PackageMapper(),
      );
    });

    test('mengembalikan package sebagai entity', () async {
      final packages = await repository.getPackages();

      expect(packages, hasLength(4));
      expect(packages.first.packageCode, 'UMR-2026-001');
    });

    test('mengembalikan package berdasarkan id sebagai entity', () async {
      final package = await repository.getPackageById('package-002');

      expect(package, isNotNull);
      expect(package!.packageCode, 'UMR-2026-002');
    });

    test('mengembalikan null untuk id yang tidak ditemukan', () async {
      final package = await repository.getPackageById('package-999');

      expect(package, isNull);
    });
  });
}
