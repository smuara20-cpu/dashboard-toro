import 'booking_datasource.dart';
import '../dummy/booking_dummy.dart';
import '../models/booking_model.dart';

class BookingLocalDataSource implements BookingDataSource {
  @override
  Future<List<BookingModel>> getBookings() async {
    return bookingDummy;
  }
}