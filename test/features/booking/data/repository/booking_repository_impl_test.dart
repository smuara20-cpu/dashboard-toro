import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/data/datasource/booking_datasource.dart';
import 'package:dashboard_kpi/features/booking/data/datasource/booking_local_datasource.dart';
import 'package:dashboard_kpi/features/booking/data/mapper/booking_mapper.dart';
import 'package:dashboard_kpi/features/booking/data/repository/booking_repository_impl.dart';
import 'package:dashboard_kpi/features/booking/domain/entities/booking_entity.dart';
import 'package:dashboard_kpi/features/booking/domain/repository/booking_repository.dart';

void main() {
  late BookingDataSource dataSource;
  late BookingMapper mapper;
  late BookingRepository repository;

  setUp(() {
    dataSource = BookingLocalDataSource();
    mapper = BookingMapper();
    repository = BookingRepositoryImpl(dataSource: dataSource, mapper: mapper);
  });

  group('BookingRepositoryImpl', () {
    test('getBookings returns mapped booking entities', () async {
      final bookings = await repository.getBookings();

      expect(bookings, isNotEmpty);
      expect(bookings.first, isA<BookingEntity>());
      expect(bookings.first.bookingCode, 'BK-2026-0001');
    });

    test('getBookingById returns booking when id exists', () async {
      final booking = await repository.getBookingById('booking-001');

      expect(booking, isNotNull);
      expect(booking!.id, 'booking-001');
      expect(booking.bookingCode, 'BK-2026-0001');
    });

    test('getBookingById returns null when id does not exist', () async {
      final booking = await repository.getBookingById('booking-not-found');

      expect(booking, isNull);
    });

    test('createBooking adds booking and returns mapped entity', () async {
      final existing = await repository.getBookingById('booking-001');

      expect(existing, isNotNull);

      final created = BookingEntity(
        id: 'booking-002',
        bookingCode: 'BK-2026-0002',
        bookingDate: DateTime(2026, 8, 21),
        departureDate: DateTime(2026, 10, 1),
        customer: existing!.customer,
        package: existing.package,
        payment: existing.payment,
        leadSource: existing.leadSource,
        status: existing.status,
        createdAt: DateTime(2026, 8, 21),
        updatedAt: DateTime(2026, 8, 21),
      );

      final result = await repository.createBooking(created);

      expect(result.id, 'booking-002');
      expect(result.bookingCode, 'BK-2026-0002');

      final stored = await repository.getBookingById('booking-002');

      expect(stored, isNotNull);
      expect(stored!.bookingCode, 'BK-2026-0002');
    });

    test('updateBooking updates existing booking', () async {
      final booking = await repository.getBookingById('booking-001');

      expect(booking, isNotNull);

      final updated = BookingEntity(
        id: booking!.id,
        bookingCode: 'BK-2026-UPDATED',
        bookingDate: booking.bookingDate,
        departureDate: booking.departureDate,
        customer: booking.customer,
        package: booking.package,
        payment: booking.payment,
        leadSource: booking.leadSource,
        status: booking.status,
        createdAt: booking.createdAt,
        updatedAt: DateTime(2026, 8, 22),
      );

      final result = await repository.updateBooking(updated);

      expect(result.bookingCode, 'BK-2026-UPDATED');
      expect(result.updatedAt, DateTime(2026, 8, 22));

      final stored = await repository.getBookingById('booking-001');

      expect(stored, isNotNull);
      expect(stored!.bookingCode, 'BK-2026-UPDATED');
    });

    test('deleteBooking removes booking', () async {
      final beforeDelete = await repository.getBookingById('booking-001');

      expect(beforeDelete, isNotNull);

      await repository.deleteBooking('booking-001');

      final afterDelete = await repository.getBookingById('booking-001');

      expect(afterDelete, isNull);
    });
  });
}
