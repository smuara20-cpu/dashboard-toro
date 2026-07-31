import '../enums/booking_status.dart';
import '../enums/lead_source.dart';

import 'customer_entity.dart';
import 'package_entity.dart';
import 'payment_entity.dart';

class BookingEntity {
  /// Primary Key
  final String id;

  /// Nomor Booking
  final String bookingCode;

  /// Customer
  final CustomerEntity customer;

  /// Paket yang dipilih
  final PackageEntity package;

  /// Informasi pembayaran
  final PaymentEntity payment;

  /// Tanggal booking
  final DateTime bookingDate;

  /// Tanggal keberangkatan
  final DateTime departureDate;

  /// Status booking
  final BookingStatus status;

  /// Sumber lead
  final LeadSource leadSource;

  /// Catatan
  final String? notes;

  /// Status aktif
  final bool isActive;

  /// Audit
  final DateTime createdAt;
  final DateTime updatedAt;

  final String createdBy;
  final String? updatedBy;

  const BookingEntity({
    required this.id,
    required this.bookingCode,
    required this.customer,
    required this.package,
    required this.payment,
    required this.bookingDate,
    required this.departureDate,
    required this.status,
    required this.leadSource,
    this.notes,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    this.updatedBy,
  });
}