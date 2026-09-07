import '../../domain/entities/jamaah_entity.dart';
import '../../domain/repository/jamaah_repository.dart';
import '../../domain/value_objects/jamaah_id.dart';
import '../../domain/value_objects/jamaah_tenant_context.dart';

class GetJamaahByIdUseCase {
  final JamaahRepository repository;

  const GetJamaahByIdUseCase({required this.repository});

  Future<JamaahEntity?> call({
    required JamaahId id,
    required JamaahTenantContext tenantContext,
  }) {
    return repository.getById(id: id, tenantContext: tenantContext);
  }
}
