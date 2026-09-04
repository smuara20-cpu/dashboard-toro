import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/presentation/pages/create_booking_page.dart';

void main() {
  group('CreateBookingPage', () {
    testWidgets('menampilkan halaman booking baru dan customer selector', (
      tester,
    ) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: CreateBookingPage())),
      );

      expect(find.text('Booking Baru'), findsOneWidget);
      expect(find.text('Buat Booking'), findsOneWidget);
      expect(find.text('Customer'), findsOneWidget);
      expect(find.text('Customer belum dipilih.'), findsOneWidget);
      expect(find.text('Pilih Customer'), findsOneWidget);
      expect(find.text('Lanjut'), findsOneWidget);
    });

    testWidgets('menampilkan validasi ketika customer belum dipilih', (
      tester,
    ) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: CreateBookingPage())),
      );

      await tester.tap(find.text('Lanjut'));
      await tester.pump();

      expect(find.text('Customer wajib dipilih.'), findsOneWidget);
    });

    testWidgets('dapat memilih customer aktif', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: CreateBookingPage())),
      );

      await tester.tap(find.text('Pilih Customer'));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(AlertDialog),
          matching: find.text('Pilih Customer'),
        ),
        findsOneWidget,
      );
      expect(find.text('Ahmad Fauzan'), findsOneWidget);
      expect(find.textContaining('CUS-0001'), findsOneWidget);

      await tester.tap(find.text('Ahmad Fauzan'));
      await tester.pumpAndSettle();

      expect(find.text('Ahmad Fauzan'), findsOneWidget);
      expect(find.textContaining('CUS-0001'), findsOneWidget);
      expect(find.text('Ubah'), findsOneWidget);
    });
  });
}
