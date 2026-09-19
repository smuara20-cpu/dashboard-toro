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

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    sessionController.clearSession();

    var remoteSessionEstablished = false;

    try {
      final user = await loginUseCase(
        email: email,
        password: password,
      );

      if (user == null) {
        return false;
      }

      remoteSessionEstablished = true;

      final SessionContext? sessionContext =
      await sessionEstablishmentService.establish(
        user: user,
      );

      if (sessionContext == null || !sessionContext.isValid) {
        await _clearRemoteSession();
        return false;
      }

      final sessionEstablished = sessionController.establishSession(
        sessionContext: sessionContext,
      );

      if (!sessionEstablished) {
        await _clearRemoteSession();
        return false;
      }

      remoteSessionEstablished = false;
      return true;
    } catch (_) {
      sessionController.clearSession();

      if (remoteSessionEstablished) {
        await _clearRemoteSession();
      }

      return false;
    }
  }

  Future<void> _clearRemoteSession() async {
    try {
      await loginUseCase.logout();
    } catch (_) {
      // Local authentication state remains cleared even if
      // remote logout fails.
    }
  }

  void logout() {
    sessionController.clearSession();

    _clearRemoteSession();
  }
}