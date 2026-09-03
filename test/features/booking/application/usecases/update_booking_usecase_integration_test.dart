import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/application/usecases/update_booking_usecase.dart';
import 'package:dashboard_kpi/features/booking/data/datasource/booking_local_datasource.dart';
import 'package:dashboard_kpi/features/booking/data/mapper/booking_mapper.dart';
import 'package:dashboard_kpi/features/booking/data/repository/booking_repository_impl.dart';
import 'package:dashboard_kpi/features/booking/domain/entities/booking_entity.dart';
import 'package:dashboard_kpi/features/booking/domain/repository/booking_repository.dart';

void main() {
  late BookingRepository repository;
  late UpdateBookingUseCase useCase;

  setUp(() {
    final dataSource = BookingLocalDataSource();
    final mapper = BookingMapper();

    repository = BookingRepositoryImpl(dataSource: dataSource, mapper: mapper);

    useCase = UpdateBookingUseCase(repository: repository);
  });

  group('UpdateBookingUseCase integration', () {
    test('updates existing booking and returns BookingEntity', () async {
      final existing = await repository.getBookingById('booking-001');

      expect(existing, isNotNull);

      final updated = BookingEntity(
        id: existing!.id,
        bookingCode: 'BK-2026-UPDATED',
        bookingDate: existing.bookingDate,
        departureDate: existing.departureDate,
        customer: existing.customer,
        package: existing.package,
        payment: existing.payment,
        leadSource: existing.leadSource,
        status: existing.status,
        createdAt: existing.createdAt,
        updatedAt: DateTime(2026, 9, 3),
      );

      final result = await useCase(updated);

      expect(result, isA<BookingEntity>());
      expect(result.id, 'booking-001');
      expect(result.bookingCode, 'BK-2026-UPDATED');
    });

    test('updated booking can be retrieved with the new data', () async {
      final existing = await repository.getBookingById('booking-001');

      expect(existing, isNotNull);

      final updated = BookingEntity(
        id: existing!.id,
        bookingCode: 'BK-2026-UPDATE-CHECK',
        bookingDate: existing.bookingDate,
        departureDate: existing.departureDate,
        customer: existing.customer,
        package: existing.package,
        payment: existing.payment,
        leadSource: existing.leadSource,
        status: existing.status,
        createdAt: existing.createdAt,
        updatedAt: DateTime(2026, 9, 3),
      );

      await useCase(updated);

      final retrieved = await repository.getBookingById('booking-001');

      expect(retrieved, isNotNull);
      expect(retrieved!.bookingCode, 'BK-2026-UPDATE-CHECK');
      expect(retrieved.updatedAt, DateTime(2026, 9, 3));
    });

    test(
      'throws StateError when updating a booking that does not exist',
      () async {
        final existing = await repository.getBookingById('booking-001');

        expect(existing, isNotNull);

        final invalidBooking = BookingEntity(
          id: 'booking-not-found',
          bookingCode: 'BK-2026-NOT-FOUND',
          bookingDate: existing!.bookingDate,
          departureDate: existing.departureDate,
          customer: existing.customer,
          package: existing.package,
          payment: existing.payment,
          leadSource: existing.leadSource,
          status: existing.status,
          createdAt: existing.createdAt,
          updatedAt: DateTime(2026, 9, 3),
        );

        expect(() => useCase(invalidBooking), throwsA(isA<StateError>()));
      },
    );
  });
}
