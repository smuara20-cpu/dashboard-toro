import '../../../../core/base/base_entity.dart';

class PackageEntity extends BaseEntity {
  @override
  final String id;

  final String packageCode;
  final String packageName;

  final int durationDays;
  final int price;

  const PackageEntity({
    required this.id,
    required this.packageCode,
    required this.packageName,
    required this.durationDays,
    required this.price,
  });
}