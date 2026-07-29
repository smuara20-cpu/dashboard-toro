import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'app/dependency/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeInjector();

  runApp(const ProviderScope(child: App()));
}
