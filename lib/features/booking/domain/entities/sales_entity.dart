import '../../../../core/base/base_entity.dart';

class SalesEntity extends BaseEntity {
  @override
  final String id;

  final String employeeCode;
  final String fullName;
  final String phoneNumber;

  const SalesEntity({
    required this.id,
    required this.employeeCode,
    required this.fullName,
    required this.phoneNumber,
  });
}