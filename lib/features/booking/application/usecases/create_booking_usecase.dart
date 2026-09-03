import '../../domain/entities/booking_entity.dart';
import '../../domain/repository/booking_repository.dart';

class CreateBookingUseCase {
  final BookingRepository repository;

  const CreateBookingUseCase({required this.repository});

  Future<BookingEntity> call(BookingEntity booking) {
    return repository.createBooking(booking);
  }
}
