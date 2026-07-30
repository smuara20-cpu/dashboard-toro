import '../../../../core/base/base_entity.dart';

class CustomerEntity extends BaseEntity {
  @override
  final String id;

  final String fullName;
  final String phoneNumber;
  final String email;

  final DateTime? birthDate;
  final String? city;
  final String? province;

  const CustomerEntity({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    this.birthDate,
    this.city,
    this.province,
  });
}