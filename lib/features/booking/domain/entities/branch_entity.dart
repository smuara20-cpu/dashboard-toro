import '../../../../core/base/base_entity.dart';

class BranchEntity extends BaseEntity {
  @override
  final String id;

  final String branchCode;
  final String branchName;
  final String city;

  const BranchEntity({
    required this.id,
    required this.branchCode,
    required this.branchName,
    required this.city,
  });
}