import '../../../../core/base/base_entity.dart';

class AirlineEntity extends BaseEntity {
  @override
  final String id;

  final String airlineCode;
  final String airlineName;

  const AirlineEntity({
    required this.id,
    required this.airlineCode,
    required this.airlineName,
  });
}