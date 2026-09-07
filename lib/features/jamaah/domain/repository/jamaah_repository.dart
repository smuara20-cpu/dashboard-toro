import '../entities/jamaah_entity.dart';
import '../value_objects/jamaah_customer_reference.dart';
import '../value_objects/jamaah_id.dart';
import '../value_objects/jamaah_tenant_context.dart';

abstract interface class JamaahRepository {
  Future<JamaahEntity> create(JamaahEntity jamaah);

  Future<JamaahEntity?> getById({
    required JamaahId id,
    required JamaahTenantContext tenantContext,
  });

  Future<List<JamaahEntity>> getAll({
    required JamaahTenantContext tenantContext,
  });

  Future<List<JamaahEntity>> getByCustomerReference({
    required JamaahCustomerReference customerReference,
    required JamaahTenantContext tenantContext,
  });

  Future<JamaahEntity> update(JamaahEntity jamaah);
}
