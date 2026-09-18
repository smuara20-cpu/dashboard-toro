import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'app/dependency/injector.dart';
import 'app/initializers/supabase_initializer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeSupabase();
  await initializeInjector();

  runApp(const ProviderScope(child: App()));
}
