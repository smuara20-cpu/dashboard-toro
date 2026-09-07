import '../../domain/entities/jamaah_entity.dart';
import '../../domain/repository/jamaah_repository.dart';
import '../../domain/value_objects/jamaah_customer_reference.dart';
import '../../domain/value_objects/jamaah_tenant_context.dart';

class GetJamaahByCustomerReferenceUseCase {
  final JamaahRepository repository;

  const GetJamaahByCustomerReferenceUseCase({required this.repository});

  Future<List<JamaahEntity>> call({
    required JamaahCustomerReference customerReference,
    required JamaahTenantContext tenantContext,
  }) {
    return repository.getByCustomerReference(
      customerReference: customerReference,
      tenantContext: tenantContext,
    );
  }
}
