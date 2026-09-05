import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/presentation/pages/create_booking_page.dart';
import 'package:dashboard_kpi/features/crm/domain/enums/lead_source.dart';

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

    testWidgets(
      'menampilkan booking information setelah customer dan package dipilih',
      (tester) async {
        await tester.pumpWidget(
          const ProviderScope(child: MaterialApp(home: CreateBookingPage())),
        );

        await tester.tap(find.text('Pilih Customer'));

        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsOneWidget);

        expect(find.text('Ahmad Fauzan'), findsOneWidget);

        await tester.tap(find.text('Ahmad Fauzan'));

        await tester.pumpAndSettle();

        expect(find.text('Ahmad Fauzan'), findsOneWidget);

        expect(find.textContaining('CUS-0001'), findsOneWidget);

        await tester.tap(find.text('Pilih Package'));

        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsOneWidget);

        expect(find.byType(ListTile), findsNWidgets(2));

        await tester.tap(find.text('Umroh Reguler Desember 2026'));

        await tester.pumpAndSettle();

        final scrollable = find.byType(Scrollable).first;

        await tester.drag(scrollable, const Offset(0, -500));

        await tester.pumpAndSettle();

        expect(find.text('Booking Information'), findsOneWidget);

        expect(find.text('Tanggal Booking'), findsOneWidget);

        expect(find.text('Sumber Lead'), findsOneWidget);

        expect(find.text('Departure Date'), findsOneWidget);

        expect(find.text('10/12/2026'), findsOneWidget);

        expect(
          find.text('Otomatis mengikuti tanggal keberangkatan package.'),
          findsOneWidget,
        );

        final continueButton = find.byType(FilledButton);

        await tester.scrollUntilVisible(
          continueButton,
          100,
          scrollable: scrollable,
        );

        await tester.pumpAndSettle();

        expect(tester.getCenter(continueButton).dy, lessThan(600));

        await tester.tap(continueButton);
        await tester.pump();

        expect(find.text('Sumber lead wajib dipilih.'), findsOneWidget);
      },
    );

    testWidgets('dapat memilih lead source pada booking information', (
      tester,
    ) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: CreateBookingPage())),
      );

      await tester.tap(find.text('Pilih Customer'));

      await tester.pumpAndSettle();

      await tester.tap(find.text('Ahmad Fauzan'));

      await tester.pumpAndSettle();

      await tester.tap(find.text('Pilih Package'));

      await tester.pumpAndSettle();

      await tester.tap(find.text('Umroh Reguler Desember 2026'));

      await tester.pumpAndSettle();

      final scrollable = find.byType(Scrollable).first;

      await tester.drag(scrollable, const Offset(0, -500));

      await tester.pumpAndSettle();

      expect(find.text('Booking Information'), findsOneWidget);

      final leadSourceField = find.byType(DropdownButtonFormField<LeadSource>);

      expect(leadSourceField, findsOneWidget);

      await tester.tap(leadSourceField);

      await tester.pumpAndSettle();

      expect(find.text('WhatsApp'), findsOneWidget);

      expect(find.text('Instagram'), findsOneWidget);

      expect(find.text('Facebook'), findsOneWidget);

      await tester.tap(find.text('WhatsApp'));

      await tester.pumpAndSettle();

      expect(find.text('Sumber lead wajib dipilih.'), findsNothing);
    });
  });
}
