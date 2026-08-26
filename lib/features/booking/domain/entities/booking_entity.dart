import '../enums/booking_status.dart';
import '../enums/lead_source.dart';

import 'customer_entity.dart';
import 'package_entity.dart';
import 'payment_entity.dart';

/// VENTRA Development Constitution
/// Enterprise Edition v2.0
/// Version: 2.0.0
///
/// Domain Entity: Booking
///
/// 12/12 VENTRA Development Constitution ALIGNED
/// Kesepakatan No. 1–11
///
/// Final Acceptance   → DEFERRED TO PART 7
/// Final Governance   → DEFERRED TO PART 7
/// Enterprise Baseline → DEFERRED TO PART 7
///
/// BookingEntity represents the business-level booking aggregate data.
/// Infrastructure, persistence, API, and UI concerns MUST NOT exist here.

class BookingEntity {
  /// Primary key.
  final String id;

  /// Human-readable booking reference.
  final String bookingCode;

  /// Customer associated with this booking.
  final CustomerEntity customer;

  /// Package selected for this booking.
  final PackageEntity package;

  /// Payment information associated with this booking.
  final PaymentEntity payment;

  /// Date when the booking was created.
  final DateTime bookingDate;

  /// Planned departure date.
  final DateTime departureDate;

  /// Current booking lifecycle status.
  final BookingStatus status;

  /// Source from which the lead/customer entered the booking funnel.
  final LeadSource leadSource;

  /// Optional operational notes.
  final String? notes;

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
  });
}