import 'package:dashboard_kpi/core/common/base/base_entity.dart';

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