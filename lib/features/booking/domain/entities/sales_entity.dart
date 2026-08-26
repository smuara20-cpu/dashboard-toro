import '../../../../core/base/base_entity.dart';

/// VENTRA Development Constitution
/// Enterprise Edition v2.0
/// Version: 2.0.0
///
/// Domain Entity: Sales
///
/// 12/12 VENTRA Development Constitution ALIGNED
/// Kesepakatan No. 1–11
///
/// Final Acceptance   → DEFERRED TO PART 7
/// Final Governance   → DEFERRED TO PART 7
/// Enterprise Baseline → DEFERRED TO PART 7

class SalesEntity extends BaseEntity {
  final String employeeCode;
  final String fullName;
  final String phoneNumber;

  const SalesEntity({
    required super.id,
    required this.employeeCode,
    required this.fullName,
    required this.phoneNumber,
  });
}