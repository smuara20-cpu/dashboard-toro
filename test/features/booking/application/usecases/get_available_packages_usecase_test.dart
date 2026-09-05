import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/application/usecases/get_available_packages_usecase.dart';
import 'package:dashboard_kpi/features/booking/data/datasource/package_local_datasource.dart';
import 'package:dashboard_kpi/features/booking/data/mapper/package_mapper.dart';
import 'package:dashboard_kpi/features/booking/data/repository/package_repository_impl.dart';

void main() {
  group('GetAvailablePackagesUseCase', () {
    late GetAvailablePackagesUseCase useCase;

    setUp(() {
      final repository = PackageRepositoryImpl(
        dataSource: PackageLocalDataSource(),
        mapper: const PackageMapper(),
      );

      useCase = GetAvailablePackagesUseCase(repository: repository);
    });

    test('hanya mengembalikan package aktif dengan seat tersedia', () async {
      final packages = await useCase();

      expect(packages, hasLength(2));
      expect(
        packages.every(
          (package) => package.isActive && package.availableSeat > 0,
        ),
        isTrue,
      );
      expect(packages.any((package) => package.id == 'package-003'), isFalse);
      expect(packages.any((package) => package.id == 'package-004'), isFalse);
    });
  });
}
