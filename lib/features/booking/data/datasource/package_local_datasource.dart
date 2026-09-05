import '../dummy/package_dummy.dart';
import '../models/package_model.dart';
import 'package_datasource.dart';

class PackageLocalDataSource implements PackageDataSource {
  final List<PackageModel> _packages = List<PackageModel>.from(packageDummy);

  @override
  Future<List<PackageModel>> getPackages() async {
    return List<PackageModel>.unmodifiable(_packages);
  }

  @override
  Future<PackageModel?> getPackageById(String id) async {
    for (final package in _packages) {
      if (package.id == id) {
        return package;
      }
    }

    return null;
  }
}
