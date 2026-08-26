import '../models/booking_model.dart';

abstract interface class BookingDataSource {
  /// Get all bookings.
  Future<List<BookingModel>> getBookings();

  /// Get booking by primary key.
  Future<BookingModel> getBookingById(
      String id,
      );

  /// Create new booking.
  Future<BookingModel> createBooking(
      BookingModel booking,
      );

  /// Update existing booking.
  Future<BookingModel> updateBooking(
      BookingModel booking,
      );

  /// Delete booking.
  Future<void> deleteBooking(
      String id,
      );
}