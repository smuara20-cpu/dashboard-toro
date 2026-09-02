import 'package:dashboard_kpi/core/common/base/base_mapper.dart';

import '../../domain/entities/booking_entity.dart';
import '../models/booking_model.dart';

import '../../../customer/data/models/customer_model.dart';
import '../../../customer/data/mapper/customer_mapper.dart';

import '../../domain/entities/package_entity.dart';
import '../../domain/entities/payment_entity.dart';

import '../../domain/enums/booking_status.dart';
import '../../../crm/domain/enums/lead_source.dart';

class BookingMapper implements BaseMapper<BookingEntity, BookingModel> {
  const BookingMapper();

  static const CustomerMapper _customerMapper = CustomerMapper();

  @override
  BookingEntity toEntity(BookingModel model) {
    return BookingEntity(
      id: model.id,
      bookingCode: model.bookingCode,
      bookingDate: model.bookingDate,
      departureDate: model.departureDate,

      // CUSTOMER
      customer: _customerMapper.toEntity(
        CustomerModel.fromJson(model.customer),
      ),

      // PACKAGE
      package: _packageFromJson(model.package),

      // PAYMENT
      payment: _paymentFromJson(model.payment),

      // LEAD SOURCE
      leadSource: LeadSource.values.byName(model.leadSource),

      // BOOKING STATUS
      status: BookingStatus.values.byName(model.status),

      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  @override
  BookingModel toModel(BookingEntity entity) {
    return BookingModel(
      id: entity.id,
      bookingCode: entity.bookingCode,
      bookingDate: entity.bookingDate,
      departureDate: entity.departureDate,

      // CUSTOMER
      customer: _customerMapper.toModel(entity.customer).toJson(),

      // PACKAGE
      package: _packageToJson(entity.package),

      // PAYMENT
      payment: _paymentToJson(entity.payment),

      // LEAD SOURCE
      leadSource: entity.leadSource.name,

      // BOOKING STATUS
      status: entity.status.name,

      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  // ============================================================
  // PACKAGE
  // ============================================================

  static PackageEntity _packageFromJson(Map<String, dynamic> json) {
    return PackageEntity(
      id: json['id'] as String,
      packageCode: json['packageCode'] as String,
      packageName: json['packageName'] as String,
      packageType: json['packageType'] as String,
      destinationCountry: json['destinationCountry'] as String,

      destinations: List<String>.from(json['destinations'] as List),

      duration: json['duration'] as int,

      departureDate: DateTime.parse(json['departureDate'] as String),

      returnDate: DateTime.parse(json['returnDate'] as String),

      price: (json['price'] as num).toDouble(),

      currency: json['currency'] as String,

      quota: json['quota'] as int,

      availableSeat: json['availableSeat'] as int,

      isActive: json['isActive'] as bool,

      notes: json['notes'] as String?,

      createdAt: DateTime.parse(json['createdAt'] as String),

      updatedAt: DateTime.parse(json['updatedAt'] as String),

      createdBy: json['createdBy'] as String,

      updatedBy: json['updatedBy'] as String?,
    );
  }

  static Map<String, dynamic> _packageToJson(PackageEntity entity) {
    return {
      'id': entity.id,
      'packageCode': entity.packageCode,
      'packageName': entity.packageName,
      'packageType': entity.packageType,
      'destinationCountry': entity.destinationCountry,

      'destinations': entity.destinations,

      'duration': entity.duration,

      'departureDate': entity.departureDate.toIso8601String(),

      'returnDate': entity.returnDate.toIso8601String(),

      'price': entity.price,

      'currency': entity.currency,

      'quota': entity.quota,

      'availableSeat': entity.availableSeat,

      'isActive': entity.isActive,

      'notes': entity.notes,

      'createdAt': entity.createdAt.toIso8601String(),

      'updatedAt': entity.updatedAt.toIso8601String(),

      'createdBy': entity.createdBy,

      'updatedBy': entity.updatedBy,
    };
  }

  // ============================================================
  // PAYMENT
  // ============================================================

  static PaymentEntity _paymentFromJson(Map<String, dynamic> json) {
    return PaymentEntity(
      id: json['id'] as String,

      paymentCode: json['paymentCode'] as String,

      totalAmount: (json['totalAmount'] as num).toDouble(),

      paidAmount: (json['paidAmount'] as num).toDouble(),

      remainingAmount: (json['remainingAmount'] as num).toDouble(),

      currency: json['currency'] as String,

      paymentStatus: json['paymentStatus'] as String,

      dueDate: json['dueDate'] != null
          ? DateTime.parse(json['dueDate'] as String)
          : null,

      paidAt: json['paidAt'] != null
          ? DateTime.parse(json['paidAt'] as String)
          : null,

      notes: json['notes'] as String?,

      isActive: json['isActive'] as bool,

      createdAt: DateTime.parse(json['createdAt'] as String),

      updatedAt: DateTime.parse(json['updatedAt'] as String),

      createdBy: json['createdBy'] as String,

      updatedBy: json['updatedBy'] as String?,
    );
  }

  static Map<String, dynamic> _paymentToJson(PaymentEntity entity) {
    return {
      'id': entity.id,

      'paymentCode': entity.paymentCode,

      'totalAmount': entity.totalAmount,

      'paidAmount': entity.paidAmount,

      'remainingAmount': entity.remainingAmount,

      'currency': entity.currency,

      'paymentStatus': entity.paymentStatus,

      'dueDate': entity.dueDate?.toIso8601String(),

      'paidAt': entity.paidAt?.toIso8601String(),

      'notes': entity.notes,

      'isActive': entity.isActive,

      'createdAt': entity.createdAt.toIso8601String(),

      'updatedAt': entity.updatedAt.toIso8601String(),

      'createdBy': entity.createdBy,

      'updatedBy': entity.updatedBy,
    };
  }
}
