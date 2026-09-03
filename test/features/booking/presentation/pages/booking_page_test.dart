import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/presentation/pages/booking_page.dart';

void main() {
  Widget buildSubject() {
    return const ProviderScope(child: MaterialApp(home: BookingPage()));
  }

  group('BookingPage', () {
    testWidgets('menampilkan loading state saat pertama kali dibuka', (
      tester,
    ) async {
      await tester.pumpWidget(buildSubject());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('menampilkan daftar booking setelah initialization selesai', (
      tester,
    ) async {
      await tester.pumpWidget(buildSubject());

      await tester.pumpAndSettle();

      expect(find.text('Booking'), findsOneWidget);

      expect(find.byIcon(Icons.refresh), findsOneWidget);

      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('menampilkan booking list item dari datasource', (
      tester,
    ) async {
      await tester.pumpWidget(buildSubject());

      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);

      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('tombol refresh tersedia setelah loading selesai', (
      tester,
    ) async {
      await tester.pumpWidget(buildSubject());

      await tester.pumpAndSettle();

      final refreshButton = find.byIcon(Icons.refresh);

      expect(refreshButton, findsOneWidget);

      await tester.tap(refreshButton);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.refresh), findsOneWidget);
    });
  });
}
