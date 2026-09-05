import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/presentation/pages/create_booking_page.dart';

void main() {
  group('CreateBookingPage', () {
    testWidgets(
      'menampilkan validasi customer dan package ketika belum dipilih',
      (tester) async {
        await tester.pumpWidget(
          const ProviderScope(child: MaterialApp(home: CreateBookingPage())),
        );

        final scrollable = find.byType(Scrollable).first;
        final continueButton = find.byType(FilledButton);

        await tester.scrollUntilVisible(
          continueButton,
          100,
          scrollable: scrollable,
        );

        await tester.pumpAndSettle();

        expect(continueButton, findsOneWidget);

        final buttonCenter = tester.getCenter(continueButton);

        expect(buttonCenter.dy, greaterThan(0));

        expect(buttonCenter.dy, lessThan(600));

        await tester.tap(continueButton);
        await tester.pump();

        expect(find.text('Customer wajib dipilih.'), findsOneWidget);

        expect(find.text('Package wajib dipilih.'), findsOneWidget);
      },
    );

    testWidgets('dapat memilih package yang tersedia', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: CreateBookingPage())),
      );

      final packageButton = find.text('Pilih Package').first;

      await tester.tap(packageButton);

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(AlertDialog), findsOneWidget);

      expect(find.byType(ListTile), findsNWidgets(2));

      expect(find.text('Umroh Reguler Desember 2026'), findsOneWidget);

      expect(find.text('Umroh Ramadhan 2027'), findsOneWidget);

      expect(find.text('UMR-2026-003'), findsNothing);

      expect(find.text('UMR-2026-004'), findsNothing);

      await tester.tap(find.text('Umroh Reguler Desember 2026'));

      await tester.pumpAndSettle();

      expect(find.text('Umroh Reguler Desember 2026'), findsOneWidget);

      expect(find.textContaining('UMR-2026-001'), findsOneWidget);

      expect(find.text('Ubah'), findsWidgets);
    });
  });
}
