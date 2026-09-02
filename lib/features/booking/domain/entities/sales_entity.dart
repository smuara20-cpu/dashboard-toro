import 'package:dashboard_kpi/core/common/base/base_entity.dart';

class SalesEntity extends BaseEntity {
  final String employeeCode;
  final String fullName;
  final String phoneNumber;

  const SalesEntity({
    required super.id,
    required this.employeeCode,
    required this.fullName,
    required this.phoneNumber,
  });
}
