import '../entities/booking_entity.dart';

abstract interface class BookingRepository {
  Future<List<BookingEntity>> getBookings();

  Future<BookingEntity?> getBookingById(String id);

  Future<BookingEntity> createBooking(BookingEntity booking);

  Future<BookingEntity> updateBooking(BookingEntity booking);

  Future<void> deleteBooking(String id);
}
