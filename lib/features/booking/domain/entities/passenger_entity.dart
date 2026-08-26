import '../../../../core/base/base_entity.dart';

/// VENTRA Development Constitution
/// Enterprise Edition v2.0
/// Version: 2.0.0
///
/// Domain Entity: Passenger
///
/// 12/12 VENTRA Development Constitution ALIGNED
/// Kesepakatan No. 1–11
///
/// Final Acceptance   → DEFERRED TO PART 7
/// Final Governance   → DEFERRED TO PART 7
/// Enterprise Baseline → DEFERRED TO PART 7

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