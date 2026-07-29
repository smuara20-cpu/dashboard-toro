import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/booking_entity.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

@freezed
class BookingModel with _$BookingModel {
  const factory BookingModel({
    required String id,
    required String bookingCode,

    required String customerName,
    required String phoneNumber,
    required String email,

    required String packageName,
    required DateTime departureDate,

    required int totalPrice,
    required int paidAmount,

    required BookingStatus status,
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);
}