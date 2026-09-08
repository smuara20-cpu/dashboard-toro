import '../../domain/entities/session_context.dart';
import '../state/session_state.dart';

class SessionController {
  SessionState _state = const SessionState();

  SessionState get state => _state;

  bool establishSession({required SessionContext sessionContext}) {
    if (!sessionContext.isValid) {
      _state = const SessionState();
      return false;
    }

    _state = SessionState(
      status: SessionStateStatus.authenticated,
      sessionContext: sessionContext,
    );

    return true;
  }

  void clearSession() {
    _state = const SessionState();
  }
}
