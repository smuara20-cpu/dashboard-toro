import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/user_entity.dart';
import '../controllers/session_controller.dart';
import 'session_establishment_service.dart';

class SessionBootstrapService {
  final SupabaseClient client;
  final SessionEstablishmentService sessionEstablishmentService;
  final SessionController sessionController;

  const SessionBootstrapService({
    required this.client,
    required this.sessionEstablishmentService,
    required this.sessionController,
  });

  Future<bool> bootstrap() async {
    sessionController.clearSession();

    final session = client.auth.currentSession;

    if (session == null) {
      return false;
    }

    final user = client.auth.currentUser;

    if (user == null) {
      await _clearRemoteSession();
      return false;
    }

    try {
      final sessionContext = await sessionEstablishmentService.establish(
        user: UserEntity(
          id: user.id.trim(),
          email: (user.email ?? '').trim(),
        ),
      );

      if (sessionContext == null || !sessionContext.isValid) {
        await _clearRemoteSession();
        return false;
      }

      return sessionController.establishSession(
        sessionContext: sessionContext,
      );
    } catch (_) {
      sessionController.clearSession();
      await _clearRemoteSession();
      return false;
    }
  }

  Future<void> _clearRemoteSession() async {
    try {
      await client.auth.signOut();
    } catch (_) {}
  }
}