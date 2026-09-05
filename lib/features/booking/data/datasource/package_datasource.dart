import '../models/package_model.dart';

abstract interface class PackageDataSource {
  Future<List<PackageModel>> getPackages();

  Future<PackageModel?> getPackageById(String id);
}
