import '../enums/booking_status.dart';
import '../enums/lead_source.dart';

import 'customer_entity.dart';
import 'package_entity.dart';
import 'payment_entity.dart';

class BookingEntity {
  final String id;
  final String bookingCode;

  final CustomerEntity customer;
  final PackageEntity package;

  final DateTime bookingDate;
  final DateTime departureDate;

  final BookingStatus status;
  final LeadSource leadSource;

  final PaymentEntity payment;

  final String? notes;

  const BookingEntity({
    required this.id,
    required this.bookingCode,
    required this.customer,
    required this.package,
    required this.bookingDate,
    required this.departureDate,
    required this.status,
    required this.leadSource,
    required this.payment,
    this.notes,
  });
}