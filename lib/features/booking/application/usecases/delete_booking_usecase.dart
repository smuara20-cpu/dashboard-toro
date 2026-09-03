import '../../domain/repository/booking_repository.dart';

class DeleteBookingUseCase {
  final BookingRepository repository;

  const DeleteBookingUseCase({required this.repository});

  Future<void> call(String id) {
    return repository.deleteBooking(id);
  }
}
