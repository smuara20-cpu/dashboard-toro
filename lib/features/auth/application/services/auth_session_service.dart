import '../../domain/entities/session_context.dart';
import '../../domain/usecases/login_usecase.dart';
import '../controllers/session_controller.dart';
import 'session_establishment_service.dart';

class AuthSessionService {
  final LoginUseCase loginUseCase;
  final SessionEstablishmentService sessionEstablishmentService;
  final SessionController sessionController;

  const AuthSessionService({
    required this.loginUseCase,
    required this.sessionEstablishmentService,
    required this.sessionController,
  });

  Future<bool> login({required String email, required String password}) async {
    // Always start from a clean session boundary.
    // This prevents a previous authenticated session from
    // surviving a new authentication attempt.
    sessionController.clearSession();

    try {
      final user = await loginUseCase(email: email, password: password);

      // Authentication did not produce an authoritative user.
      if (user == null) {
        return false;
      }

      final SessionContext? sessionContext = await sessionEstablishmentService
          .establish(user: user);

      // Never establish an authenticated session without
      // a valid authoritative tenant context.
      if (sessionContext == null || !sessionContext.isValid) {
        return false;
      }

      return sessionController.establishSession(sessionContext: sessionContext);
    } catch (_) {
      // Fail closed.
      // Any authentication or tenant/session establishment
      // failure must leave the application unauthenticated.
      sessionController.clearSession();
      return false;
    }
  }

  void logout() {
    sessionController.clearSession();
  }
}
