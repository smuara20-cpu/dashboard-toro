import '../../domain/entities/booking_entity.dart';
import '../../domain/repository/booking_repository.dart';

class GetBookingsUseCase {
  final BookingRepository repository;

  const GetBookingsUseCase({required this.repository});

  Future<List<BookingEntity>> call() {
    return repository.getBookings();
  }
}
