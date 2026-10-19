class EnvConfig {
  EnvConfig._();

  static const String supabaseUrl = String.fromEnvironment('SUPABASE_URL');

  static const String supabasePublishableKey = String.fromEnvironment(
    'SUPABASE_PUBLISHABLE_KEY',
  );

  static bool get hasSupabaseUrl => _isValidSupabaseUrl(supabaseUrl);

  static bool get hasSupabasePublishableKey =>
      supabasePublishableKey.trim().isNotEmpty;

  static bool get hasSupabaseConfig =>
      hasSupabaseUrl && hasSupabasePublishableKey;

  static bool _isValidSupabaseUrl(String value) {
    final input = value.trim();
    if (input.isEmpty) return false;

    final uri = Uri.tryParse(input);
    if (uri == null ||
        uri.scheme != 'https' ||
        uri.host.isEmpty ||
        uri.userInfo.isNotEmpty) {
      return false;
    }

    return true;
  }

  static String? get configurationError {
    if (!hasSupabaseUrl) {
      return 'SUPABASE_URL belum diisi atau format URL tidak valid.';
    }

    if (!hasSupabasePublishableKey) {
      return 'SUPABASE_PUBLISHABLE_KEY belum diisi.';
    }

    return null;
  }

  static void validateSupabaseConfig() {
    final error = configurationError;
    if (error != null) {
      throw StateError(error);
    }
  }
}
