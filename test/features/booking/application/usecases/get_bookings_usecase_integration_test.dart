import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/application/usecases/get_bookings_usecase.dart';
import 'package:dashboard_kpi/features/booking/data/datasource/booking_local_datasource.dart';
import 'package:dashboard_kpi/features/booking/data/mapper/booking_mapper.dart';
import 'package:dashboard_kpi/features/booking/data/repository/booking_repository_impl.dart';
import 'package:dashboard_kpi/features/booking/domain/entities/booking_entity.dart';
import 'package:dashboard_kpi/features/booking/domain/repository/booking_repository.dart';

void main() {
  late BookingRepository repository;
  late GetBookingsUseCase useCase;

  setUp(() {
    final dataSource = BookingLocalDataSource();
    final mapper = BookingMapper();

    repository = BookingRepositoryImpl(dataSource: dataSource, mapper: mapper);

    useCase = GetBookingsUseCase(repository: repository);
  });

  group('GetBookingsUseCase integration', () {
    test('returns booking entities from the real local data flow', () async {
      final bookings = await useCase();

      expect(bookings, isNotEmpty);
      expect(bookings.first.bookingCode, 'BK-2026-0001');
    });

    test('returns BookingEntity instances', () async {
      final bookings = await useCase();

      expect(bookings, everyElement(isA<BookingEntity>()));
    });

    test(
      'returns the same number of bookings as the local data source',
      () async {
        final dataSource = BookingLocalDataSource();

        final sourceBookings = await dataSource.getBookings();
        final resultBookings = await useCase();

        expect(resultBookings.length, sourceBookings.length);
      },
    );
  });
}
