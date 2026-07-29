import 'package:go_router/go_router.dart';

import 'route_names.dart';
import 'route_paths.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/testimoni/presentation/pages/testimonial_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.splash,
  routes: [
    GoRoute(
      name: RouteNames.splash,
      path: RoutePaths.splash,
      builder: (context, state) => const SplashPage(),
    ),

    GoRoute(
      name: RouteNames.onboarding,
      path: RoutePaths.onboarding,
      builder: (context, state) => const OnboardingPage(),
    ),

    GoRoute(
      name: RouteNames.login,
      path: RoutePaths.login,
      builder: (context, state) => const LoginPage(),
    ),

    GoRoute(
      name: RouteNames.dashboard,
      path: RoutePaths.dashboard,
      builder: (context, state) => const DashboardPage(),
    ),

    GoRoute(
      name: RouteNames.testimonial,
      path: RoutePaths.testimonial,
      builder: (context, state) => const TestimonialPage(),
    ),
  ],
);
