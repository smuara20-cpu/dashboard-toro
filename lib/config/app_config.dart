import 'app_environment.dart';
import 'app_flavor.dart';
import 'app_urls.dart';

class AppConfig {
  const AppConfig._();

  static late AppFlavor flavor;

  static void initialize(AppFlavor value) {
    flavor = value;
  }

  static String get baseUrl {
    switch (flavor.environment) {
      case AppEnvironment.development:
        return AppUrls.development;

      case AppEnvironment.staging:
        return AppUrls.staging;

      case AppEnvironment.production:
        return AppUrls.production;
    }
  }

  static bool get isDevelopment => flavor.isDevelopment;

  static bool get isProduction => flavor.isProduction;

  static bool get isStaging => flavor.isStaging;
}
