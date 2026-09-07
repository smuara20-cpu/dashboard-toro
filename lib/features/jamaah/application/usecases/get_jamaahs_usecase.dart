import '../../domain/entities/jamaah_entity.dart';
import '../../domain/repository/jamaah_repository.dart';
import '../../domain/value_objects/jamaah_tenant_context.dart';

class GetJamaahsUseCase {
  final JamaahRepository repository;

  const GetJamaahsUseCase({required this.repository});

  Future<List<JamaahEntity>> call({
    required JamaahTenantContext tenantContext,
  }) {
    return repository.getAll(tenantContext: tenantContext);
  }
}
