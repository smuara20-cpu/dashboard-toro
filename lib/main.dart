import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/app.dart';
import 'app/config/env_config.dart';
import 'app/dependency/injector.dart';
import 'app/initializers/supabase_initializer.dart';
import 'app/router/app_router.dart';
import 'app/router/route_paths.dart';
import 'features/auth/presentation/widgets/session_bootstrap_gate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!EnvConfig.hasSupabaseConfig) {
    runApp(const SupabaseConfigurationErrorApp());
    return;
  }

  await initializeSupabase();
  await initializeInjector();

  Supabase.instance.client.auth.onAuthStateChange.listen((data) {
    if (data.event == AuthChangeEvent.passwordRecovery) {
      appRouter.go(RoutePaths.resetPassword);
    }
  });

  runApp(const ProviderScope(child: SessionBootstrapGate(child: App())));
}

class SupabaseConfigurationErrorApp extends StatelessWidget {
  const SupabaseConfigurationErrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    final message =
        EnvConfig.configurationError ?? 'Konfigurasi Supabase tidak valid.';

    return MaterialApp(
      title: 'VENTRA Configuration',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.settings_outlined, size: 56),
                  const SizedBox(height: 20),
                  const Text(
                    'Konfigurasi aplikasi belum siap',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(message, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  const Text(
                    'Periksa SUPABASE_URL dan '
                    'SUPABASE_PUBLISHABLE_KEY pada konfigurasi '
                    'build. Jangan gunakan service_role key di aplikasi.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
