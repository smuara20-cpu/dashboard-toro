// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingModel _$BookingModelFromJson(Map<String, dynamic> json) =>
    _BookingModel(
      id: json['id'] as String,
      bookingCode: json['bookingCode'] as String,
      customerName: json['customerName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      packageName: json['packageName'] as String,
      departureDate: DateTime.parse(json['departureDate'] as String),
      totalPrice: (json['totalPrice'] as num).toInt(),
      paidAmount: (json['paidAmount'] as num).toInt(),
      status: $enumDecode(_$BookingStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$BookingModelToJson(_BookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookingCode': instance.bookingCode,
      'customerName': instance.customerName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'packageName': instance.packageName,
      'departureDate': instance.departureDate.toIso8601String(),
      'totalPrice': instance.totalPrice,
      'paidAmount': instance.paidAmount,
      'status': _$BookingStatusEnumMap[instance.status]!,
    };

const _$BookingStatusEnumMap = {
  BookingStatus.booking: 'booking',
  BookingStatus.dp: 'dp',
  BookingStatus.paid: 'paid',
  BookingStatus.visa: 'visa',
  BookingStatus.ticket: 'ticket',
  BookingStatus.manifest: 'manifest',
  BookingStatus.departed: 'departed',
  BookingStatus.cancelled: 'cancelled',
};
