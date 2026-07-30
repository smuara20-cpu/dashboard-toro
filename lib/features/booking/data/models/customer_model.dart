import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

@freezed
abstract class CustomerModel with _$CustomerModel {
  const factory CustomerModel({
    /// ID Customer
    required String id,

    /// Nama Lengkap
    required String fullName,

    /// Nomor Telepon
    required String phoneNumber,

    /// Email
    required String email,

    /// Tanggal Lahir
    DateTime? birthDate,

    /// Kota
    String? city,

    /// Provinsi
    String? province,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$CustomerModelFromJson(json);
}