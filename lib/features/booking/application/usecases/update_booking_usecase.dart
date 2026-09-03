import '../../domain/entities/booking_entity.dart';
import '../../domain/repository/booking_repository.dart';

class UpdateBookingUseCase {
  final BookingRepository repository;

  const UpdateBookingUseCase({required this.repository});

  Future<BookingEntity> call(BookingEntity booking) {
    return repository.updateBooking(booking);
  }
}
