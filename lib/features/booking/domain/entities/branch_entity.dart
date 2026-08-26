import 'package:dashboard_kpi/core/common/base/base_entity.dart';

class BranchEntity extends BaseEntity {
  final String branchCode;
  final String branchName;
  final String city;

  const BranchEntity({
    required super.id,
    required this.branchCode,
    required this.branchName,
    required this.city,
  });
}