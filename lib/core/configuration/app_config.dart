enum AppEnvironment {
  development,
  staging,
  production,
}

class AppConfig {
  final AppEnvironment environment;
  final String appName;
  final String appVersion;
  final String supabaseUrl;
  final String supabaseAnonKey;
  final String apiBaseUrl;
  final bool analyticsEnabled;
  final bool debugLoggingEnabled;

  const AppConfig({
    required this.environment,
    required this.appName,
    required this.appVersion,
    required this.supabaseUrl,
    required this.supabaseAnonKey,
    required this.apiBaseUrl,
    required this.analyticsEnabled,
    required this.debugLoggingEnabled,
  });
}