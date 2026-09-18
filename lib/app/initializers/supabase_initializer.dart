import 'package:supabase_flutter/supabase_flutter.dart';

import '../config/env_config.dart';

Future<void> initializeSupabase() async {
  EnvConfig.validateSupabaseConfig();

  await Supabase.initialize(
    url: EnvConfig.supabaseUrl,
    publishableKey: EnvConfig.supabasePublishableKey,
  );
}
