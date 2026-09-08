import 'user_entity.dart';
import 'tenant_context.dart';

class SessionContext {
  final UserEntity user;
  final TenantContext tenantContext;

  const SessionContext({required this.user, required this.tenantContext});

  bool get isValid => tenantContext.isValid;

  String get userId => user.id;

  String get tenantId => tenantContext.tenantId;

  String get companyId => tenantContext.companyId;

  SessionContext copyWith({UserEntity? user, TenantContext? tenantContext}) {
    return SessionContext(
      user: user ?? this.user,
      tenantContext: tenantContext ?? this.tenantContext,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SessionContext &&
            other.user.id == user.id &&
            other.tenantContext == tenantContext;
  }

  @override
  int get hashCode => Object.hash(user.id, tenantContext);

  @override
  String toString() {
    return 'SessionContext('
        'userId: ${user.id}, '
        'tenantId: ${tenantContext.tenantId}, '
        'companyId: ${tenantContext.companyId}'
        ')';
  }
}
