import '../models/booking_model.dart';

abstract interface class BookingDataSource {
  Future<List<BookingModel>> getBookings();

  Future<BookingModel?> getBookingById(String id);

  Future<BookingModel> createBooking(
      BookingModel booking,
      );

  Future<BookingModel> updateBooking(
      BookingModel booking,
      );

  Future<void> deleteBooking(String id);
}