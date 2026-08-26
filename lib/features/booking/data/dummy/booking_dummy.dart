import '../models/booking_model.dart';
import '../../domain/enums/booking_status.dart';

final List<BookingModel> bookingDummy = [
  BookingModel(
    id: '1',
    bookingCode: 'BK-20260001',
    customerCode: 'CUS-0001',
    status: BookingStatus.confirmed,
    createdAt: DateTime(2026, 8, 1),
    updatedAt: DateTime(2026, 8, 1),
  ),
  BookingModel(
    id: '2',
    bookingCode: 'BK-20260002',
    customerCode: 'CUS-0002',
    status: BookingStatus.pending,
    createdAt: DateTime(2026, 8, 2),
    updatedAt: DateTime(2026, 8, 2),
  ),
];