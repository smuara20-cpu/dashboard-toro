import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/domain/entities/booking_entity.dart';
import 'package:dashboard_kpi/features/booking/domain/entities/package_entity.dart';
import 'package:dashboard_kpi/features/booking/domain/entities/payment_entity.dart';
import 'package:dashboard_kpi/features/booking/domain/enums/booking_status.dart';
import 'package:dashboard_kpi/features/booking/presentation/widgets/booking_list_item.dart';
import 'package:dashboard_kpi/features/customer/domain/entities/customer_entity.dart';
import 'package:dashboard_kpi/features/crm/domain/enums/lead_source.dart';

void main() {
  final createdAt = DateTime(2026, 1, 1);
  final updatedAt = DateTime(2026, 1, 2);

  BookingEntity createBooking({
    BookingStatus status = BookingStatus.confirmed,
  }) {
    return BookingEntity(
      id: 'booking-001',
      bookingCode: 'BK-2026-001',
      bookingDate: DateTime(2026, 1, 10),
      departureDate: DateTime(2026, 3, 15),
      customer: CustomerEntity(
        id: 'customer-001',
        customerCode: 'CUS-2026-001',
        fullName: 'Ahmad Fauzan',
        gender: 'Male',
        phoneNumber: '081234567890',
        country: 'Indonesia',
        leadSource: LeadSource.instagram,
        isActive: true,
        createdAt: createdAt,
        updatedAt: updatedAt,
        createdBy: 'system',
      ),
      package: PackageEntity(
        id: 'package-001',
        packageCode: 'UMR-2026-001',
        packageName: 'Umroh Ramadhan Premium',
        packageType: 'Umroh',
        destinationCountry: 'Saudi Arabia',
        destinations: const ['Makkah', 'Madinah'],
        duration: 12,
        departureDate: DateTime(2026, 3, 15),
        returnDate: DateTime(2026, 3, 26),
        price: 35000000,
        currency: 'IDR',
        quota: 45,
        availableSeat: 12,
        isActive: true,
        createdAt: createdAt,
        updatedAt: updatedAt,
        createdBy: 'system',
      ),
      payment: PaymentEntity(
        id: 'payment-001',
        paymentCode: 'PAY-2026-001',
        totalAmount: 35000000,
        paidAmount: 15000000,
        remainingAmount: 20000000,
        currency: 'IDR',
        paymentStatus: 'Partial',
        isActive: true,
        createdAt: createdAt,
        updatedAt: updatedAt,
        createdBy: 'system',
      ),
      leadSource: LeadSource.instagram,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  Widget buildSubject(BookingEntity booking) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BookingListItem(booking: booking),
        ),
      ),
    );
  }

  group('BookingListItem', () {
    testWidgets('menampilkan informasi utama booking', (tester) async {
      await tester.pumpWidget(buildSubject(createBooking()));

      expect(find.text('BK-2026-001'), findsOneWidget);
      expect(find.text('Ahmad Fauzan'), findsOneWidget);
      expect(find.text('Umroh Ramadhan Premium'), findsOneWidget);
      expect(find.text('15/03/2026'), findsOneWidget);
      expect(find.text('15000000 IDR'), findsOneWidget);
    });

    testWidgets('menampilkan status confirmed', (tester) async {
      await tester.pumpWidget(
        buildSubject(createBooking(status: BookingStatus.confirmed)),
      );

      expect(find.text('CONFIRMED'), findsOneWidget);
    });

    testWidgets('menampilkan status pending', (tester) async {
      await tester.pumpWidget(
        buildSubject(createBooking(status: BookingStatus.pending)),
      );

      expect(find.text('PENDING'), findsOneWidget);
    });

    testWidgets('menampilkan status cancelled', (tester) async {
      await tester.pumpWidget(
        buildSubject(createBooking(status: BookingStatus.cancelled)),
      );

      expect(find.text('CANCELLED'), findsOneWidget);
    });
  });
}
