import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/session_controller.dart';

final sessionControllerProvider = Provider<SessionController>((ref) {
  return SessionController();
});

final sessionStateProvider = Provider((ref) {
  return ref.watch(sessionControllerProvider).state;
});
