import '../models/booking_model.dart';

final bookingDummy = <BookingModel>[
  BookingModel(
    id: '1',
    bookingCode: 'BK-20260001',
    customerName: 'Ahmad Fauzi',
    packageName: 'Umrah Plus Turki',
    departureDate: DateTime(2026, 9, 15),
    totalPrice: 35000000,
    paidAmount: 10000000,
    status: BookingStatus.dp,
  ),
  {
    "id": "2",
    "bookingCode": "BK-20260002",
    "customerName": "Siti Aminah",
    "packageName": "Umrah Ramah Lansia",
    "departureDate": "2026-09-20",
    "status": "visaApproved",
  },
];