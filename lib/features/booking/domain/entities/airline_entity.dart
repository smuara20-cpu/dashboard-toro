import 'package:dashboard_kpi/core/common/base/base_entity.dart';

class AirlineEntity extends BaseEntity {
  final String airlineCode;
  final String airlineName;

  const AirlineEntity({
    required super.id,
    required this.airlineCode,
    required this.airlineName,
  });
}