import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:dashboard_kpi/app/dependency/injector.dart';
import 'package:dashboard_kpi/app/router/app_router.dart';
import 'package:dashboard_kpi/app/router/route_names.dart';
import 'package:dashboard_kpi/app/router/route_paths.dart';
import 'package:dashboard_kpi/features/auth/presentation/pages/login_page.dart';
import 'package:dashboard_kpi/features/booking/presentation/pages/booking_page.dart';
import 'package:dashboard_kpi/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:dashboard_kpi/features/finance/presentation/pages/finance_page.dart';
import 'package:dashboard_kpi/features/finance/presentation/providers/finance_provider.dart';
import 'package:dashboard_kpi/features/finance/presentation/state/finance_state.dart';
import 'package:dashboard_kpi/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:dashboard_kpi/features/splash/presentation/pages/splash_page.dart';
import 'package:dashboard_kpi/features/testimoni/presentation/pages/testimonial_page.dart';

void main() {
  setUpAll(() async {
    await initializeInjector();
  });

  GoRouter buildFinanceRouter() {
    return GoRouter(
      initialLocation: RoutePaths.finance,
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
  }

  group('Finance Route', () {
    testWidgets('finance path resolves directly to FinancePage', (
      tester,
    ) async {
      const financeState = FinanceState(status: FinanceStatus.empty);

      final router = buildFinanceRouter();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [financeStateProvider.overrideWithValue(financeState)],
          child: MaterialApp.router(routerConfig: router),
        ),
      );

      await tester.pump();

      expect(find.byType(FinancePage), findsOneWidget);

      expect(find.text('Finance'), findsOneWidget);

      expect(find.text('No financial transactions found.'), findsOneWidget);

      router.dispose();
    });

    testWidgets('finance route can be reached by route name', (tester) async {
      const financeState = FinanceState(status: FinanceStatus.empty);

      final router = buildFinanceRouter();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [financeStateProvider.overrideWithValue(financeState)],
          child: MaterialApp.router(routerConfig: router),
        ),
      );

      await tester.pump();

      router.goNamed(RouteNames.finance);

      await tester.pump();

      expect(find.byType(FinancePage), findsOneWidget);

      expect(find.text('Finance'), findsOneWidget);

      router.dispose();
    });
  });

  group('Booking Route', () {
    testWidgets('booking path resolves to BookingPage', (tester) async {
      final router = appRouter;

      router.go(RoutePaths.booking);

      await tester.pumpWidget(
        ProviderScope(child: MaterialApp.router(routerConfig: appRouter)),
      );

      await tester.pump();

      expect(find.byType(BookingPage), findsOneWidget);

      expect(find.text('Booking'), findsOneWidget);
    });

    testWidgets('booking route can be reached by route name', (tester) async {
      final router = appRouter;

      await tester.pumpWidget(
        ProviderScope(child: MaterialApp.router(routerConfig: appRouter)),
      );

      await tester.pump();

      router.goNamed(RouteNames.booking);

      await tester.pump();

      expect(find.byType(BookingPage), findsOneWidget);

      expect(find.text('Booking'), findsOneWidget);
    });
  });
}
