import '../../../../core/base/base_entity.dart';

class HotelEntity extends BaseEntity {
  @override
  final String id;

  final String hotelName;
  final String city;
  final int star;

  const HotelEntity({
    required this.id,
    required this.hotelName,
    required this.city,
    required this.star,
  });
}