import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/data/datasource/booking_local_datasource.dart';
import 'package:dashboard_kpi/features/booking/data/models/booking_model.dart';

void main() {
  late BookingLocalDataSource dataSource;

  setUp(() {
    dataSource = BookingLocalDataSource();
  });

  group('BookingLocalDataSource', () {
    test('getBookings returns dummy bookings', () async {
      final bookings = await dataSource.getBookings();

      expect(bookings, isNotEmpty);
      expect(bookings.first, isA<BookingModel>());
    });

    test('getBookingById returns booking when id exists', () async {
      final bookings = await dataSource.getBookings();
      final expectedId = bookings.first.id;

      final result = await dataSource.getBookingById(expectedId);

      expect(result, isNotNull);
      expect(result!.id, expectedId);
    });

    test('getBookingById returns null when id does not exist', () async {
      final result = await dataSource.getBookingById(
        'booking-id-that-does-not-exist',
      );

      expect(result, isNull);
    });

    test('createBooking adds a new booking', () async {
      final bookingsBefore = await dataSource.getBookings();

      final source = bookingsBefore.first;

      final newBooking = BookingModel(
        id: 'booking-test-create',
        bookingCode: 'BK-TEST-CREATE',
        bookingDate: source.bookingDate,
        departureDate: source.departureDate,
        customer: Map<String, dynamic>.from(source.customer),
        package: Map<String, dynamic>.from(source.package),
        payment: Map<String, dynamic>.from(source.payment),
        leadSource: source.leadSource,
        status: source.status,
        createdAt: source.createdAt,
        updatedAt: source.updatedAt,
      );

      final result = await dataSource.createBooking(newBooking);
      final bookingsAfter = await dataSource.getBookings();

      expect(result.id, newBooking.id);
      expect(bookingsAfter.length, bookingsBefore.length + 1);
      expect(
        bookingsAfter.any((booking) => booking.id == newBooking.id),
        isTrue,
      );
    });

    test('updateBooking updates an existing booking', () async {
      final bookings = await dataSource.getBookings();
      final source = bookings.first;

      final updatedBooking = BookingModel(
        id: source.id,
        bookingCode: 'BK-UPDATED-TEST',
        bookingDate: source.bookingDate,
        departureDate: source.departureDate,
        customer: Map<String, dynamic>.from(source.customer),
        package: Map<String, dynamic>.from(source.package),
        payment: Map<String, dynamic>.from(source.payment),
        leadSource: source.leadSource,
        status: source.status,
        createdAt: source.createdAt,
        updatedAt: DateTime.now(),
      );

      final result = await dataSource.updateBooking(updatedBooking);

      expect(result.bookingCode, 'BK-UPDATED-TEST');

      final stored = await dataSource.getBookingById(source.id);

      expect(stored, isNotNull);
      expect(stored!.bookingCode, 'BK-UPDATED-TEST');
    });

    test('updateBooking throws when booking does not exist', () async {
      final bookings = await dataSource.getBookings();
      final source = bookings.first;

      final missingBooking = BookingModel(
        id: 'booking-id-that-does-not-exist',
        bookingCode: 'BK-MISSING',
        bookingDate: source.bookingDate,
        departureDate: source.departureDate,
        customer: Map<String, dynamic>.from(source.customer),
        package: Map<String, dynamic>.from(source.package),
        payment: Map<String, dynamic>.from(source.payment),
        leadSource: source.leadSource,
        status: source.status,
        createdAt: source.createdAt,
        updatedAt: source.updatedAt,
      );

      expect(
        () => dataSource.updateBooking(missingBooking),
        throwsA(isA<StateError>()),
      );
    });

    test('deleteBooking removes an existing booking', () async {
      final bookingsBefore = await dataSource.getBookings();
      final targetId = bookingsBefore.first.id;

      await dataSource.deleteBooking(targetId);

      final bookingsAfter = await dataSource.getBookings();

      expect(bookingsAfter.any((booking) => booking.id == targetId), isFalse);
      expect(bookingsAfter.length, bookingsBefore.length - 1);
    });

    test('deleteBooking does nothing when id does not exist', () async {
      final bookingsBefore = await dataSource.getBookings();

      await dataSource.deleteBooking('booking-id-that-does-not-exist');

      final bookingsAfter = await dataSource.getBookings();

      expect(bookingsAfter.length, bookingsBefore.length);
    });
  });
}
