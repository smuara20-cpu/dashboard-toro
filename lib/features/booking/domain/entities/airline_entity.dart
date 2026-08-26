import '../../../../core/base/base_entity.dart';

/// VENTRA Development Constitution
/// Enterprise Edition v2.0
/// Version: 2.0.0
///
/// Domain Entity: Airline
///
/// 12/12 VENTRA Development Constitution ALIGNED
/// Kesepakatan No. 1–11
///
/// Final Acceptance   → DEFERRED TO PART 7
/// Final Governance   → DEFERRED TO PART 7
/// Enterprise Baseline → DEFERRED TO PART 7

class AirlineEntity extends BaseEntity {
  final String airlineCode;
  final String airlineName;

  const AirlineEntity({
    required super.id,
    required this.airlineCode,
    required this.airlineName,
  });
}