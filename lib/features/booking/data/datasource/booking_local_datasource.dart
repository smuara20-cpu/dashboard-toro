import 'booking_datasource.dart';
import '../dummy/booking_dummy.dart';
import '../models/booking_model.dart';

class BookingLocalDataSource implements BookingDataSource {
  final List<BookingModel> _bookings = List<BookingModel>.from(bookingDummy);

  @override
  Future<List<BookingModel>> getBookings() async {
    return List<BookingModel>.unmodifiable(_bookings);
  }

  @override
  Future<BookingModel?> getBookingById(String id) async {
    for (final booking in _bookings) {
      if (booking.id == id) {
        return booking;
      }
    }

    return null;
  }

  @override
  Future<BookingModel> createBooking(BookingModel booking) async {
    _bookings.add(booking);
    return booking;
  }

  @override
  Future<BookingModel> updateBooking(BookingModel booking) async {
    final index = _bookings.indexWhere((item) => item.id == booking.id);

    if (index == -1) {
      throw StateError('Booking dengan id ${booking.id} tidak ditemukan.');
    }

    _bookings[index] = booking;
    return booking;
  }

  @override
  Future<void> deleteBooking(String id) async {
    _bookings.removeWhere((booking) => booking.id == id);
  }
}
