import '../../domain/entities/session_context.dart';

enum SessionStateStatus { unauthenticated, authenticated }

class SessionState {
  final SessionStateStatus status;
  final SessionContext? sessionContext;

  const SessionState({
    this.status = SessionStateStatus.unauthenticated,
    this.sessionContext,
  });

  bool get isAuthenticated =>
      status == SessionStateStatus.authenticated && sessionContext != null;

  bool get isUnauthenticated => status == SessionStateStatus.unauthenticated;

  SessionState copyWith({
    SessionStateStatus? status,
    SessionContext? sessionContext,
    bool clearSessionContext = false,
  }) {
    return SessionState(
      status: status ?? this.status,
      sessionContext: clearSessionContext
          ? null
          : sessionContext ?? this.sessionContext,
    );
  }
}
