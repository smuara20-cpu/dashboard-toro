import '../entities/package_entity.dart';

abstract interface class PackageRepository {
  Future<List<PackageEntity>> getPackages();

  Future<PackageEntity?> getPackageById(String id);
}
