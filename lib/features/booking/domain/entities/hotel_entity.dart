import '../../../../core/base/base_entity.dart';

/// VENTRA Development Constitution
/// Enterprise Edition v2.0
/// Version: 2.0.0
///
/// Domain Entity: Hotel
///
/// 12/12 VENTRA Development Constitution ALIGNED
/// Kesepakatan No. 1–11
///
/// Final Acceptance   → DEFERRED TO PART 7
/// Final Governance   → DEFERRED TO PART 7
/// Enterprise Baseline → DEFERRED TO PART 7

class HotelEntity extends BaseEntity {
  final String hotelName;
  final String city;
  final int star;

  const HotelEntity({
    required super.id,
    required this.hotelName,
    required this.city,
    required this.star,
  });
}