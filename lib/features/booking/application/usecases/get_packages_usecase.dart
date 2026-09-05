import '../../domain/entities/package_entity.dart';
import '../../domain/repository/package_repository.dart';

class GetPackagesUseCase {
  final PackageRepository repository;

  const GetPackagesUseCase({required this.repository});

  Future<List<PackageEntity>> call() {
    return repository.getPackages();
  }
}
