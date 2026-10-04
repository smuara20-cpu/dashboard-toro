import 'package:flutter/foundation.dart';

import '../../domain/entities/session_context.dart';
import '../state/session_state.dart';

class SessionController extends ChangeNotifier {
  SessionState _state = const SessionState();

  SessionState get state => _state;

  bool establishSession({
    required SessionContext sessionContext,
  }) {
    if (!sessionContext.isValid) {
      _state = const SessionState();
      notifyListeners();
      return false;
    }

    _state = SessionState(
      status: SessionStateStatus.authenticated,
      sessionContext: sessionContext,
    );

    notifyListeners();
    return true;
  }

  void clearSession() {
    _state = const SessionState();
    notifyListeners();
  }
}