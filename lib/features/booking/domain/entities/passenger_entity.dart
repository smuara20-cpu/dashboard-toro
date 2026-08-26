import 'package:dashboard_kpi/core/common/base/base_entity.dart';

class PassengerEntity extends BaseEntity {
  final String fullName;
  final DateTime? birthDate;
  final String? passportNumber;
  final bool isMainPassenger;

  const PassengerEntity({
    required super.id,
    required this.fullName,
    this.birthDate,
    this.passportNumber,
    this.isMainPassenger = false,
  });
}