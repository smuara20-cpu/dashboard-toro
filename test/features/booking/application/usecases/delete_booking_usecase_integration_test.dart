import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/application/usecases/delete_booking_usecase.dart';
import 'package:dashboard_kpi/features/booking/data/datasource/booking_local_datasource.dart';
import 'package:dashboard_kpi/features/booking/data/mapper/booking_mapper.dart';
import 'package:dashboard_kpi/features/booking/data/repository/booking_repository_impl.dart';
import 'package:dashboard_kpi/features/booking/domain/repository/booking_repository.dart';

void main() {
  late BookingRepository repository;
  late DeleteBookingUseCase useCase;

  setUp(() {
    final dataSource = BookingLocalDataSource();
    final mapper = BookingMapper();

    repository = BookingRepositoryImpl(dataSource: dataSource, mapper: mapper);

    useCase = DeleteBookingUseCase(repository: repository);
  });

  group('DeleteBookingUseCase integration', () {
    test('deletes an existing booking', () async {
      final existing = await repository.getBookingById('booking-001');

      expect(existing, isNotNull);

      await useCase('booking-001');

      final deleted = await repository.getBookingById('booking-001');

      expect(deleted, isNull);
    });

    test('removes booking from the repository result', () async {
      final beforeDelete = await repository.getBookings();

      expect(
        beforeDelete.any((booking) => booking.id == 'booking-001'),
        isTrue,
      );

      await useCase('booking-001');

      final afterDelete = await repository.getBookings();

      expect(
        afterDelete.any((booking) => booking.id == 'booking-001'),
        isFalse,
      );
      expect(afterDelete.length, beforeDelete.length - 1);
    });

    test('deleting a non-existing booking does not throw', () async {
      await expectLater(useCase('booking-not-found'), completes);
    });
  });
}
