import '../enums/booking_status.dart';

import '../../../customer/domain/entities/customer_entity.dart';

import 'package_entity.dart';
import 'payment_entity.dart';

import '../../../crm/domain/enums/lead_source.dart';

class BookingEntity {
  /// Primary Key
  final String id;

  /// Nomor Booking / Reference Number
  final String bookingCode;

  /// Tanggal Booking
  final DateTime bookingDate;

  /// Tanggal Keberangkatan
  final DateTime departureDate;

  /// Customer yang melakukan booking
  final CustomerEntity customer;

  /// Paket perjalanan
  final PackageEntity package;

  /// Informasi pembayaran
  final PaymentEntity payment;

  /// Sumber lead / channel acquisition
  final LeadSource leadSource;

  /// Status booking
  final BookingStatus status;

  /// Audit
  final DateTime createdAt;

  final DateTime updatedAt;

  const BookingEntity({
    required this.id,
    required this.bookingCode,
    required this.bookingDate,
    required this.departureDate,
    required this.customer,
    required this.package,
    required this.payment,
    required this.leadSource,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
}
