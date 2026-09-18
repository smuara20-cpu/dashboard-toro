class EnvConfig {
  static const String supabaseUrl = String.fromEnvironment('SUPABASE_URL');

  static const String supabasePublishableKey = String.fromEnvironment(
    'SUPABASE_PUBLISHABLE_KEY',
  );

  static bool get hasSupabaseConfig =>
      supabaseUrl.isNotEmpty && supabasePublishableKey.isNotEmpty;

  static void validateSupabaseConfig() {
    if (supabaseUrl.isEmpty) {
      throw StateError('SUPABASE_URL is not configured.');
    }

    if (supabasePublishableKey.isEmpty) {
      throw StateError('SUPABASE_PUBLISHABLE_KEY is not configured.');
    }
  }
}
