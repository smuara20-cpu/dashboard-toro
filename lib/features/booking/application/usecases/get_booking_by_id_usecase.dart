import '../../domain/entities/booking_entity.dart';
import '../../domain/repository/booking_repository.dart';

class GetBookingByIdUseCase {
  final BookingRepository repository;

  const GetBookingByIdUseCase({required this.repository});

  Future<BookingEntity?> call(String id) {
    return repository.getBookingById(id);
  }
}
