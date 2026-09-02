import 'package:dashboard_kpi/core/common/base/base_controller.dart';

import '../../domain/entities/booking_entity.dart';
import '../state/booking_state.dart';
import '../usecases/create_booking_usecase.dart';
import '../usecases/delete_booking_usecase.dart';
import '../usecases/get_booking_by_id_usecase.dart';
import '../usecases/get_bookings_usecase.dart';
import '../usecases/update_booking_usecase.dart';

class BookingController extends BaseController {
  final GetBookingsUseCase getBookingsUseCase;
  final GetBookingByIdUseCase getBookingByIdUseCase;
  final CreateBookingUseCase createBookingUseCase;
  final UpdateBookingUseCase updateBookingUseCase;
  final DeleteBookingUseCase deleteBookingUseCase;

  BookingState _state = const BookingState();

  BookingState get state => _state;

  BookingController({
    required this.getBookingsUseCase,
    required this.getBookingByIdUseCase,
    required this.createBookingUseCase,
    required this.updateBookingUseCase,
    required this.deleteBookingUseCase,
  });

  @override
  Future<void> initialize() {
    return loadBookings();
  }

  @override
  Future<void> refresh() {
    return loadBookings();
  }

  Future<void> loadBookings() async {
    _state = _state.copyWith(
      status: BookingStatus.loading,
      clearErrorMessage: true,
    );

    try {
      final bookings = await getBookingsUseCase();

      _state = _state.copyWith(
        status: bookings.isEmpty ? BookingStatus.empty : BookingStatus.success,
        bookings: bookings,
        clearErrorMessage: true,
      );
    } catch (error) {
      _state = _state.copyWith(
        status: BookingStatus.failure,
        errorMessage: error.toString(),
      );
    }
  }

  Future<BookingEntity?> getBookingById(String id) async {
    try {
      final booking = await getBookingByIdUseCase(id);

      _state = _state.copyWith(
        selectedBooking: booking,
        clearErrorMessage: true,
      );

      return booking;
    } catch (error) {
      _state = _state.copyWith(
        status: BookingStatus.failure,
        errorMessage: error.toString(),
      );

      return null;
    }
  }

  Future<void> createBooking(BookingEntity booking) async {
    try {
      await createBookingUseCase(booking);
      await loadBookings();
    } catch (error) {
      _state = _state.copyWith(
        status: BookingStatus.failure,
        errorMessage: error.toString(),
      );
    }
  }

  Future<void> updateBooking(BookingEntity booking) async {
    try {
      await updateBookingUseCase(booking);
      await loadBookings();
    } catch (error) {
      _state = _state.copyWith(
        status: BookingStatus.failure,
        errorMessage: error.toString(),
      );
    }
  }

  Future<void> deleteBooking(String id) async {
    try {
      await deleteBookingUseCase(id);
      await loadBookings();
    } catch (error) {
      _state = _state.copyWith(
        status: BookingStatus.failure,
        errorMessage: error.toString(),
      );
    }
  }
}
