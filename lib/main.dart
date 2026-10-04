import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/app.dart';
import 'app/router/route_paths.dart';
import 'app/router/app_router.dart';
import 'app/dependency/injector.dart';
import 'app/initializers/supabase_initializer.dart';
import 'features/auth/presentation/widgets/session_bootstrap_gate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeSupabase();
  await initializeInjector();

  Supabase.instance.client.auth.onAuthStateChange.listen((data) {
    if (data.event == AuthChangeEvent.passwordRecovery) {
      appRouter.go(RoutePaths.resetPassword);
    }
  });

  runApp(
    const ProviderScope(
      child: SessionBootstrapGate(
        child: App(),
      ),
    ),
  );
}