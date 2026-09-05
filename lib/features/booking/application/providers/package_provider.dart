import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/package_local_datasource.dart';
import '../../data/mapper/package_mapper.dart';
import '../../data/repository/package_repository_impl.dart';
import '../../domain/repository/package_repository.dart';
import '../usecases/get_available_packages_usecase.dart';
import '../usecases/get_packages_usecase.dart';

final packageDataSourceProvider = Provider<PackageLocalDataSource>((ref) {
  return PackageLocalDataSource();
});

final packageMapperProvider = Provider<PackageMapper>((ref) {
  return const PackageMapper();
});

final packageRepositoryProvider = Provider<PackageRepository>((ref) {
  return PackageRepositoryImpl(
    dataSource: ref.read(packageDataSourceProvider),
    mapper: ref.read(packageMapperProvider),
  );
});

final getPackagesUseCaseProvider = Provider<GetPackagesUseCase>((ref) {
  return GetPackagesUseCase(repository: ref.read(packageRepositoryProvider));
});

final getAvailablePackagesUseCaseProvider =
    Provider<GetAvailablePackagesUseCase>((ref) {
      return GetAvailablePackagesUseCase(
        repository: ref.read(packageRepositoryProvider),
      );
    });
