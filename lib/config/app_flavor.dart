import 'app_environment.dart';

class AppFlavor {
  final String appName;
  final AppEnvironment environment;
  final bool enableLogger;

  const AppFlavor({
    required this.appName,
    required this.environment,
    required this.enableLogger,
  });

  bool get isDevelopment => environment == AppEnvironment.development;

  bool get isProduction => environment == AppEnvironment.production;

  bool get isStaging => environment == AppEnvironment.staging;
}
