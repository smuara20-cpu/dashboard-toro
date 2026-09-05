import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/booking_local_datasource.dart';
import '../../data/mapper/booking_mapper.dart';
import '../../data/repository/booking_repository_impl.dart';
import '../../domain/repository/booking_repository.dart';
import '../controllers/booking_controller.dart';
import '../services/booking_creation_factory.dart';
import '../usecases/create_booking_usecase.dart';
import '../usecases/delete_booking_usecase.dart';
import '../usecases/get_booking_by_id_usecase.dart';
import '../usecases/get_bookings_usecase.dart';
import '../usecases/update_booking_usecase.dart';

final bookingDataSourceProvider = Provider<BookingLocalDataSource>((ref) {
  return BookingLocalDataSource();
});

final bookingMapperProvider = Provider<BookingMapper>((ref) {
  return const BookingMapper();
});

final bookingRepositoryProvider = Provider<BookingRepository>((ref) {
  return BookingRepositoryImpl(
    dataSource: ref.read(bookingDataSourceProvider),
    mapper: ref.read(bookingMapperProvider),
  );
});

final getBookingsUseCaseProvider = Provider<GetBookingsUseCase>((ref) {
  return GetBookingsUseCase(repository: ref.read(bookingRepositoryProvider));
});

final getBookingByIdUseCaseProvider = Provider<GetBookingByIdUseCase>((ref) {
  return GetBookingByIdUseCase(repository: ref.read(bookingRepositoryProvider));
});

final createBookingUseCaseProvider = Provider<CreateBookingUseCase>((ref) {
  return CreateBookingUseCase(repository: ref.read(bookingRepositoryProvider));
});

final updateBookingUseCaseProvider = Provider<UpdateBookingUseCase>((ref) {
  return UpdateBookingUseCase(repository: ref.read(bookingRepositoryProvider));
});

final deleteBookingUseCaseProvider = Provider<DeleteBookingUseCase>((ref) {
  return DeleteBookingUseCase(repository: ref.read(bookingRepositoryProvider));
});

final bookingCreationFactoryProvider = Provider<BookingCreationFactory>((ref) {
  return const BookingCreationFactory();
});

final bookingControllerProvider = Provider<BookingController>((ref) {
  return BookingController(
    getBookingsUseCase: ref.read(getBookingsUseCaseProvider),
    getBookingByIdUseCase: ref.read(getBookingByIdUseCaseProvider),
    createBookingUseCase: ref.read(createBookingUseCaseProvider),
    updateBookingUseCase: ref.read(updateBookingUseCaseProvider),
    deleteBookingUseCase: ref.read(deleteBookingUseCaseProvider),
  );
});
