import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/booking/application/usecases/get_booking_by_id_usecase.dart';
import 'package:dashboard_kpi/features/booking/data/datasource/booking_local_datasource.dart';
import 'package:dashboard_kpi/features/booking/data/mapper/booking_mapper.dart';
import 'package:dashboard_kpi/features/booking/data/repository/booking_repository_impl.dart';
import 'package:dashboard_kpi/features/booking/domain/entities/booking_entity.dart';
import 'package:dashboard_kpi/features/booking/domain/repository/booking_repository.dart';

void main() {
  late BookingRepository repository;
  late GetBookingByIdUseCase useCase;

  setUp(() {
    final dataSource = BookingLocalDataSource();
    final mapper = BookingMapper();

    repository = BookingRepositoryImpl(dataSource: dataSource, mapper: mapper);

    useCase = GetBookingByIdUseCase(repository: repository);
  });

  group('GetBookingByIdUseCase integration', () {
    test('returns BookingEntity when booking id exists', () async {
      final booking = await useCase('booking-001');

      expect(booking, isNotNull);
      expect(booking, isA<BookingEntity>());
      expect(booking!.id, 'booking-001');
      expect(booking.bookingCode, 'BK-2026-0001');
    });

    test('returns null when booking id does not exist', () async {
      final booking = await useCase('booking-not-found');

      expect(booking, isNull);
    });

    test('returns the correct booking data', () async {
      final booking = await useCase('booking-001');

      expect(booking, isNotNull);
      expect(booking!.bookingCode, 'BK-2026-0001');
      expect(booking.status.name, 'pending');
    });
  });
}
