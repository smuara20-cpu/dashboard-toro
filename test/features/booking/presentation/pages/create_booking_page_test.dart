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
        final createButton = find.byType(FilledButton);

        await tester.scrollUntilVisible(
          createButton,
          100,
          scrollable: scrollable,
        );

        await tester.pumpAndSettle();

        expect(createButton, findsOneWidget);

        final buttonCenter = tester.getCenter(createButton);

        expect(buttonCenter.dy, greaterThan(0));
        expect(buttonCenter.dy, lessThan(600));

        await tester.tap(createButton);
        await tester.pump();

        expect(find.text('Customer wajib dipilih.'), findsOneWidget);

        expect(find.text('Package wajib dipilih.'), findsOneWidget);
      },
    );

    testWidgets('dapat memilih package yang tersedia', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: CreateBookingPage())),
      );

      final scrollable = find.byType(Scrollable).first;
      final packageButton = find.text('Pilih Package').first;

      await tester.scrollUntilVisible(
        packageButton,
        100,
        scrollable: scrollable,
      );

      await tester.pumpAndSettle();

      expect(packageButton, findsOneWidget);

      await tester.tap(packageButton);
      await tester.pumpAndSettle();

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

        final scrollable = find.byType(Scrollable).first;

        final customerButton = find.text('Pilih Customer');

        await tester.scrollUntilVisible(
          customerButton,
          100,
          scrollable: scrollable,
        );

        await tester.pumpAndSettle();

        await tester.tap(customerButton);
        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsOneWidget);

        expect(find.text('Ahmad Fauzan'), findsOneWidget);

        await tester.tap(find.text('Ahmad Fauzan'));

        await tester.pumpAndSettle();

        expect(find.text('Ahmad Fauzan'), findsOneWidget);

        expect(find.textContaining('CUS-0001'), findsOneWidget);

        final packageButton = find.text('Pilih Package').first;

        await tester.scrollUntilVisible(
          packageButton,
          100,
          scrollable: scrollable,
        );

        await tester.pumpAndSettle();

        await tester.tap(packageButton);
        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsOneWidget);

        expect(find.byType(ListTile), findsNWidgets(2));

        await tester.tap(find.text('Umroh Reguler Desember 2026'));

        await tester.pumpAndSettle();

        expect(find.text('Umroh Reguler Desember 2026'), findsOneWidget);

        final bookingInformation = find.text('Booking Information');

        await tester.scrollUntilVisible(
          bookingInformation,
          100,
          scrollable: scrollable,
        );

        await tester.pumpAndSettle();

        expect(bookingInformation, findsOneWidget);

        expect(find.text('Tanggal Booking'), findsOneWidget);

        expect(find.text('Lead Source'), findsOneWidget);

        expect(find.text('Departure Date'), findsOneWidget);

        expect(find.text('10/12/2026'), findsOneWidget);
        final createButton = find.byType(FilledButton);

        await tester.scrollUntilVisible(
          createButton,
          100,
          scrollable: scrollable,
        );

        await tester.pumpAndSettle();

        expect(tester.getCenter(createButton).dy, lessThan(600));

        await tester.tap(createButton);
        await tester.pump();

        expect(find.text('Lead Source wajib dipilih.'), findsOneWidget);
      },
    );

    testWidgets('dapat memilih lead source pada booking information', (
      tester,
    ) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: CreateBookingPage())),
      );

      final scrollable = find.byType(Scrollable).first;

      final customerButton = find.text('Pilih Customer');

      await tester.scrollUntilVisible(
        customerButton,
        100,
        scrollable: scrollable,
      );

      await tester.pumpAndSettle();

      await tester.tap(customerButton);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Ahmad Fauzan'));

      await tester.pumpAndSettle();

      final packageButton = find.text('Pilih Package').first;

      await tester.scrollUntilVisible(
        packageButton,
        100,
        scrollable: scrollable,
      );

      await tester.pumpAndSettle();

      await tester.tap(packageButton);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Umroh Reguler Desember 2026'));

      await tester.pumpAndSettle();

      final bookingInformation = find.text('Booking Information');

      await tester.scrollUntilVisible(
        bookingInformation,
        100,
        scrollable: scrollable,
      );

      await tester.pumpAndSettle();

      expect(bookingInformation, findsOneWidget);

      final leadSourceField = find.byType(DropdownButtonFormField<LeadSource>);

      expect(leadSourceField, findsOneWidget);

      await tester.tap(leadSourceField);
      await tester.pumpAndSettle();

      expect(find.text('WhatsApp'), findsOneWidget);

      expect(find.text('Instagram'), findsOneWidget);

      expect(find.text('Facebook'), findsOneWidget);

      await tester.tap(find.text('WhatsApp'));

      await tester.pumpAndSettle();

      expect(find.text('Lead Source wajib dipilih.'), findsNothing);
    });
  });
}
