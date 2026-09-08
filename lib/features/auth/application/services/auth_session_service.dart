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
    final user = await loginUseCase(email: email, password: password);

    if (user == null) {
      sessionController.clearSession();
      return false;
    }

    final SessionContext? sessionContext = await sessionEstablishmentService
        .establish(user: user);

    if (sessionContext == null || !sessionContext.isValid) {
      sessionController.clearSession();
      return false;
    }

    return sessionController.establishSession(sessionContext: sessionContext);
  }

  void logout() {
    sessionController.clearSession();
  }
}
