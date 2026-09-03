import '../../domain/entities/booking_entity.dart';

enum BookingStatus { initial, loading, success, empty, failure }

class BookingState {
  final BookingStatus status;
  final List<BookingEntity> bookings;
  final BookingEntity? selectedBooking;
  final String? errorMessage;

  const BookingState({
    this.status = BookingStatus.initial,
    this.bookings = const [],
    this.selectedBooking,
    this.errorMessage,
  });

  BookingState copyWith({
    BookingStatus? status,
    List<BookingEntity>? bookings,
    BookingEntity? selectedBooking,
    String? errorMessage,
    bool clearSelectedBooking = false,
    bool clearErrorMessage = false,
  }) {
    return BookingState(
      status: status ?? this.status,
      bookings: bookings ?? this.bookings,
      selectedBooking: clearSelectedBooking
          ? null
          : selectedBooking ?? this.selectedBooking,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }

  bool get isLoading => status == BookingStatus.loading;

  bool get isSuccess => status == BookingStatus.success;

  bool get isEmpty => status == BookingStatus.empty;

  bool get hasError => status == BookingStatus.failure;
}
