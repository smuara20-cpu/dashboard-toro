import '../../domain/entities/package_entity.dart';
import '../../domain/repository/package_repository.dart';

class GetAvailablePackagesUseCase {
  final PackageRepository repository;

  const GetAvailablePackagesUseCase({required this.repository});

  Future<List<PackageEntity>> call() async {
    final packages = await repository.getPackages();

    return packages
        .where((package) => package.isActive && package.availableSeat > 0)
        .toList();
  }
}
