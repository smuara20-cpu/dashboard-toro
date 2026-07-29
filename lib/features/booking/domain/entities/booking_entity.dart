class BookingEntity {
  final String id;
  final String bookingCode;

  final String customerName;
  final String phoneNumber;
  final String email;

  final String packageName;
  final DateTime departureDate;

  final int totalPrice;
  final int paidAmount;

  final BookingStatus status;

  const BookingEntity({
    required this.id,
    required this.bookingCode,
    required this.customerName,
    required this.phoneNumber,
    required this.email,
    required this.packageName,
    required this.departureDate,
    required this.totalPrice,
    required this.paidAmount,
    required this.status,
  });

  int get remainingPayment => totalPrice - paidAmount;

  bool get isPaidOff => paidAmount >= totalPrice;
}

enum BookingStatus {
  booking,
  dp,
  paid,
  visa,
  ticket,
  manifest,
  departed,
  cancelled,
}