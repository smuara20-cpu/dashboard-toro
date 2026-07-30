import '../../models/booking_model.dart';

abstract interface class BookingDataSource {
  Future<List<BookingModel>> getBookings();
}