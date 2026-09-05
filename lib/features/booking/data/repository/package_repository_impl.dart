import '../../domain/entities/package_entity.dart';
import '../../domain/repository/package_repository.dart';
import '../datasource/package_datasource.dart';
import '../mapper/package_mapper.dart';

class PackageRepositoryImpl implements PackageRepository {
  final PackageDataSource dataSource;
  final PackageMapper mapper;

  const PackageRepositoryImpl({required this.dataSource, required this.mapper});

  @override
  Future<List<PackageEntity>> getPackages() async {
    final models = await dataSource.getPackages();

    return models.map(mapper.toEntity).toList();
  }

  @override
  Future<PackageEntity?> getPackageById(String id) async {
    final model = await dataSource.getPackageById(id);

    if (model == null) {
      return null;
    }

    return mapper.toEntity(model);
  }
}
