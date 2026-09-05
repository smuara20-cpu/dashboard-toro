import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/application/usecases/get_packages_usecase.dart';
import 'package:dashboard_kpi/features/booking/data/datasource/package_local_datasource.dart';
import 'package:dashboard_kpi/features/booking/data/mapper/package_mapper.dart';
import 'package:dashboard_kpi/features/booking/data/repository/package_repository_impl.dart';

void main() {
  group('GetPackagesUseCase', () {
    late GetPackagesUseCase useCase;

    setUp(() {
      final repository = PackageRepositoryImpl(
        dataSource: PackageLocalDataSource(),
        mapper: const PackageMapper(),
      );

      useCase = GetPackagesUseCase(repository: repository);
    });

    test('mengembalikan seluruh package', () async {
      final packages = await useCase();

      expect(packages, hasLength(4));
    });
  });
}
