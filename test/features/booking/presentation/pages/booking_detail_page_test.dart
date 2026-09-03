import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/presentation/pages/booking_detail_page.dart';

void main() {
  Widget buildSubject({String bookingId = 'booking-001'}) {
    return ProviderScope(
      child: MaterialApp(home: BookingDetailPage(bookingId: bookingId)),
    );
  }

  group('BookingDetailPage', () {
    testWidgets('menampilkan loading state saat pertama kali dibuka', (
      tester,
    ) async {
      await tester.pumpWidget(buildSubject());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('menampilkan booking detail setelah loading selesai', (
      tester,
    ) async {
      await tester.pumpWidget(buildSubject());

      await tester.pumpAndSettle();

      expect(find.text('Booking Detail'), findsOneWidget);
      expect(find.text('BK-2026-0001'), findsWidgets);
      expect(find.text('Ahmad Fauzan'), findsOneWidget);
    });

    testWidgets('menampilkan informasi customer', (tester) async {
      await tester.pumpWidget(buildSubject());

      await tester.pumpAndSettle();

      expect(find.text('CUS-0001'), findsOneWidget);
      expect(find.text('Ahmad'), findsOneWidget);
      expect(find.text('male'), findsOneWidget);
      expect(find.text('081234567890'), findsOneWidget);
      expect(find.text('ahmad@example.com'), findsOneWidget);
      expect(find.text('Pengusaha'), findsOneWidget);
    });

    testWidgets('menampilkan informasi package dan payment', (tester) async {
      await tester.pumpWidget(buildSubject());

      await tester.pumpAndSettle();

      await tester.scrollUntilVisible(
        find.text('Package'),
        500,
        scrollable: find.byType(Scrollable),
      );

      expect(find.text('Umroh Reguler September'), findsOneWidget);
      expect(find.text('Saudi Arabia'), findsOneWidget);
      expect(find.text('Makkah, Madinah'), findsOneWidget);
      expect(find.text('9 days'), findsOneWidget);

      await tester.scrollUntilVisible(
        find.text('Payment'),
        500,
        scrollable: find.byType(Scrollable),
      );

      expect(find.text('PAY-0001'), findsOneWidget);

      expect(find.text('IDR 35000000.00'), findsWidgets);
      expect(find.text('IDR 10000000.00'), findsOneWidget);
      expect(find.text('IDR 25000000.00'), findsOneWidget);
      expect(find.text('partial'), findsOneWidget);
    });

    testWidgets('menampilkan not found state untuk booking id yang tidak ada', (
      tester,
    ) async {
      await tester.pumpWidget(buildSubject(bookingId: 'booking-not-found'));

      await tester.pumpAndSettle();

      expect(find.text('Booking tidak ditemukan.'), findsOneWidget);
    });
  });
}
