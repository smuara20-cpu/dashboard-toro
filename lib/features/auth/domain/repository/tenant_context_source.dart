import '../entities/tenant_context.dart';
import '../entities/user_entity.dart';

abstract interface class TenantContextSource {
  Future<TenantContext?> resolve({required UserEntity user});
}
