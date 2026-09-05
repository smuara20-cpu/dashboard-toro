import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/application/services/booking_creation_factory.dart';
import 'package:dashboard_kpi/features/booking/domain/enums/booking_status.dart';
import 'package:dashboard_kpi/features/booking/domain/entities/package_entity.dart';
import 'package:dashboard_kpi/features/customer/domain/entities/customer_entity.dart';
import 'package:dashboard_kpi/features/crm/domain/enums/lead_source.dart';

void main() {
  group('BookingCreationFactory', () {
    late BookingCreationFactory factory;
    late CustomerEntity customer;
    late PackageEntity package;

    setUp(() {
      factory = const BookingCreationFactory();

      customer = CustomerEntity(
        id: 'customer-test-001',
        customerCode: 'CUS-TEST-001',
        fullName: 'Ahmad Fauzan',
        nickName: 'Ahmad',
        gender: 'male',
        birthPlace: 'Jakarta',
        birthDate: DateTime(1975, 5, 10),
        phoneNumber: '081234567890',
        email: 'ahmad@example.com',
        address: 'Jakarta',
        city: 'Jakarta',
        province: 'DKI Jakarta',
        country: 'Indonesia',
        occupation: 'Pengusaha',
        maritalStatus: 'married',
        leadSource: LeadSource.whatsapp,
        notes: null,
        isActive: true,
        createdAt: DateTime(2026, 8, 20),
        updatedAt: DateTime(2026, 8, 20),
        createdBy: 'system',
        updatedBy: null,
      );

      package = PackageEntity(
        id: 'package-test-001',
        packageCode: 'UMR-TEST-001',
        packageName: 'Umroh Test Package',
        packageType: 'Umroh',
        destinationCountry: 'Saudi Arabia',
        destinations: const ['Makkah', 'Madinah'],
        duration: 9,
        departureDate: DateTime(2026, 12, 10),
        returnDate: DateTime(2026, 12, 18),
        price: 32500000,
        currency: 'IDR',
        quota: 45,
        availableSeat: 12,
        isActive: true,
        notes: 'Test package.',
        createdAt: DateTime(2026, 8, 20),
        updatedAt: DateTime(2026, 8, 20),
        createdBy: 'system',
        updatedBy: null,
      );
    });

    test('creates booking with derived business values', () {
      final now = DateTime(2026, 9, 5, 10, 30, 45);

      final booking = factory.create(
        customer: customer,
        package: package,
        bookingDate: now,
        leadSource: LeadSource.whatsapp,
        now: now,
      );

      expect(booking.customer.id, customer.id);
      expect(booking.package.id, package.id);
      expect(booking.bookingDate, now);
      expect(booking.departureDate, package.departureDate);
      expect(booking.status, BookingStatus.pending);

      expect(booking.payment.totalAmount, package.price);
      expect(booking.payment.paidAmount, 0);
      expect(booking.payment.remainingAmount, package.price);
      expect(booking.payment.currency, package.currency);
      expect(booking.payment.paymentStatus, 'unpaid');

      expect(booking.createdAt, now);
      expect(booking.updatedAt, now);
      expect(booking.payment.createdAt, now);
      expect(booking.payment.updatedAt, now);

      expect(booking.payment.isActive, isTrue);
      expect(booking.payment.createdBy, 'system');
      expect(booking.payment.updatedBy, isNull);

      expect(booking.id, isNotEmpty);
      expect(booking.bookingCode, isNotEmpty);
      expect(booking.payment.id, isNotEmpty);
      expect(booking.payment.paymentCode, isNotEmpty);
    });

    test('generates booking and payment codes from creation timestamp', () {
      final now = DateTime(2026, 9, 5, 10, 30, 45, 123);

      final booking = factory.create(
        customer: customer,
        package: package,
        bookingDate: now,
        leadSource: LeadSource.instagram,
        now: now,
      );

      expect(booking.bookingCode, startsWith('BK-20260905-103045'));

      expect(booking.payment.paymentCode, startsWith('PAY-20260905-103045'));

      expect(booking.id, startsWith('booking-'));
      expect(booking.payment.id, startsWith('payment-'));
    });

    test('uses supplied lead source', () {
      final now = DateTime(2026, 9, 5, 10, 30);

      final booking = factory.create(
        customer: customer,
        package: package,
        bookingDate: now,
        leadSource: LeadSource.facebook,
        now: now,
      );

      expect(booking.leadSource, LeadSource.facebook);
    });
  });
}
