import '../../domain/entities/jamaah_entity.dart';
import '../../domain/repository/jamaah_repository.dart';
import '../../domain/value_objects/jamaah_customer_reference.dart';
import '../../domain/value_objects/jamaah_id.dart';
import '../../domain/value_objects/jamaah_tenant_context.dart';
import '../datasource/jamaah_datasource.dart';
import '../mapper/jamaah_mapper.dart';

class JamaahRepositoryImpl implements JamaahRepository {
  final JamaahDataSource dataSource;
  final JamaahMapper mapper;

  const JamaahRepositoryImpl({required this.dataSource, required this.mapper});

  @override
  Future<JamaahEntity> create(JamaahEntity jamaah) async {
    final model = mapper.toModel(jamaah);
    final created = await dataSource.create(model);
    return mapper.toEntity(created);
  }

  @override
  Future<JamaahEntity?> getById({
    required JamaahId id,
    required JamaahTenantContext tenantContext,
  }) async {
    final model = await dataSource.getById(
      id: id.value,
      tenantId: tenantContext.value,
    );

    if (model == null) {
      return null;
    }

    return mapper.toEntity(model);
  }

  @override
  Future<List<JamaahEntity>> getAll({
    required JamaahTenantContext tenantContext,
  }) async {
    final models = await dataSource.getAll(tenantId: tenantContext.value);

    return models.map(mapper.toEntity).toList();
  }

  @override
  Future<List<JamaahEntity>> getByCustomerReference({
    required JamaahCustomerReference customerReference,
    required JamaahTenantContext tenantContext,
  }) async {
    final models = await dataSource.getByCustomerReference(
      customerId: customerReference.value,
      tenantId: tenantContext.value,
    );

    return models.map(mapper.toEntity).toList();
  }

  @override
  Future<JamaahEntity> update(JamaahEntity jamaah) async {
    final model = mapper.toModel(jamaah);
    final updated = await dataSource.update(model);
    return mapper.toEntity(updated);
  }
}
