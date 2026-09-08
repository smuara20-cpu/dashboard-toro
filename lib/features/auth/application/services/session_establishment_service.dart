import '../../domain/entities/session_context.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/tenant_context_source.dart';

class SessionEstablishmentService {
  final TenantContextSource tenantContextSource;

  const SessionEstablishmentService({required this.tenantContextSource});

  Future<SessionContext?> establish({required UserEntity user}) async {
    final tenantContext = await tenantContextSource.resolve(user: user);

    if (tenantContext == null || !tenantContext.isValid) {
      return null;
    }

    return SessionContext(user: user, tenantContext: tenantContext);
  }
}
