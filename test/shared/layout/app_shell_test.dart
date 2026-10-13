import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:dashboard_kpi/shared/layout/app_shell.dart';

void main() {
  late GoRouter router;

  Future<void> pumpShell(WidgetTester tester, {required Size size}) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;

    router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => AppShell(
            child: const Scaffold(
              body: Column(
                children: [AppShellMenuButton(), Text('Shell content')],
              ),
            ),
          ),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();
  }

  tearDown(() {
    router.dispose();
  });

  testWidgets('desktop menampilkan sidebar permanen', (tester) async {
    await pumpShell(tester, size: const Size(1280, 800));

    expect(find.text('VENTRA'), findsOneWidget);
    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Shell content'), findsOneWidget);
    expect(find.byTooltip('Buka navigasi'), findsNothing);

    expect(tester.takeException(), isNull);
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });

  testWidgets('mobile menyembunyikan sidebar sebelum drawer dibuka', (
    tester,
  ) async {
    await pumpShell(tester, size: const Size(390, 844));

    expect(find.byTooltip('Buka navigasi'), findsOneWidget);
    expect(find.text('Shell content'), findsOneWidget);
    expect(find.text('VENTRA'), findsNothing);

    expect(tester.takeException(), isNull);
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });

  testWidgets('tombol menu mobile membuka drawer', (tester) async {
    await pumpShell(tester, size: const Size(390, 844));

    await tester.tap(find.byTooltip('Buka navigasi'));
    await tester.pumpAndSettle();

    expect(find.text('VENTRA'), findsOneWidget);
    expect(find.text('TRAVEL INTELLIGENCE'), findsOneWidget);
    expect(find.text('OPERASIONAL'), findsOneWidget);

    expect(tester.takeException(), isNull);
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });

  testWidgets('menu yang belum memiliki route tetap nonaktif', (tester) async {
    await pumpShell(tester, size: const Size(1280, 800));

    expect(find.text('Paket Wisata'), findsOneWidget);
    await tester.tap(find.text('Paket Wisata'));
    await tester.pumpAndSettle();

    expect(router.routeInformationProvider.value.uri.path, '/');
    expect(tester.takeException(), isNull);

    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });
}
