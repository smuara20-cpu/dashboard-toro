import '../../../../core/base/base_entity.dart';

class PassengerEntity extends BaseEntity {
  @override
  final String id;

  final String fullName;
  final DateTime? birthDate;
  final String? passportNumber;
  final bool isMainPassenger;

  const PassengerEntity({
    required this.id,
    required this.fullName,
    this.birthDate,
    this.passportNumber,
    this.isMainPassenger = false,
  });
}