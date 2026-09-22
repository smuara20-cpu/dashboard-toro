import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:dashboard_kpi/features/auth/presentation/pages/login_page.dart';
import 'package:dashboard_kpi/features/booking/presentation/pages/booking_detail_page.dart';
import 'package:dashboard_kpi/features/booking/presentation/pages/booking_page.dart';
import 'package:dashboard_kpi/features/booking/presentation/pages/create_booking_page.dart';
import 'package:dashboard_kpi/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:dashboard_kpi/features/finance/presentation/pages/finance_page.dart';
import 'package:dashboard_kpi/features/jamaah/domain/value_objects/jamaah_tenant_context.dart';
import 'package:dashboard_kpi/features/jamaah/presentation/pages/jamaah_detail_page.dart';
import 'package:dashboard_kpi/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:dashboard_kpi/features/splash/presentation/pages/splash_page.dart';
import 'package:dashboard_kpi/features/testimoni/presentation/pages/testimonial_page.dart';

import 'route_names.dart';
import 'route_paths.dart';

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
      name: RouteNames.booking,
      path: RoutePaths.booking,
      builder: (context, state) => const BookingPage(),
    ),
    GoRoute(
      name: RouteNames.bookingCreate,
      path: RoutePaths.bookingCreate,
      builder: (context, state) => const CreateBookingPage(),
    ),
    GoRoute(
      name: RouteNames.bookingDetail,
      path: RoutePaths.bookingDetail,
      builder: (context, state) {
        final bookingId = state.pathParameters['id']!;

        return BookingDetailPage(bookingId: bookingId);
      },
    ),
    GoRoute(
      name: RouteNames.jamaahDetail,
      path: RoutePaths.jamaahDetail,
      builder: (context, state) {
        final jamaahId = state.pathParameters['id'];
        final tenantContext = state.extra;

        if (jamaahId == null || tenantContext is! JamaahTenantContext) {
          return const _JamaahRouteContextErrorPage();
        }

        return JamaahDetailPage(
          jamaahId: jamaahId,
          tenantContext: tenantContext,
        );
      },
    ),
    GoRoute(
      name: RouteNames.finance,
      path: RoutePaths.finance,
      builder: (context, state) => const FinancePage(),
    ),
    GoRoute(
      name: RouteNames.testimonial,
      path: RoutePaths.testimonial,
      builder: (context, state) => const TestimonialPage(),
    ),
  ],
);

class _JamaahRouteContextErrorPage extends StatelessWidget {
  const _JamaahRouteContextErrorPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jamaah')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.lock_outline, size: 48),
              const SizedBox(height: 16),
              Text(
                'Konteks tenant tidak tersedia.',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Detail Jamaah hanya dapat dibuka melalui konteks sesi yang valid.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
