import '../../domain/entities/session_context.dart';
import '../../domain/entities/tenant_context.dart';
import '../../domain/entities/user_entity.dart';
import '../state/session_state.dart';

class SessionController {
  SessionState _state = const SessionState();

  SessionState get state => _state;

  bool establishSession({
    required UserEntity user,
    required TenantContext tenantContext,
  }) {
    if (!tenantContext.isValid) {
      _state = const SessionState();
      return false;
    }

    _state = SessionState(
      status: SessionStateStatus.authenticated,
      sessionContext: SessionContext(user: user, tenantContext: tenantContext),
    );

    return true;
  }

  void clearSession() {
    _state = const SessionState();
  }
}
