/// VENTRA Development Constitution
/// Enterprise Edition v2.0
/// Version 2.0.0
///
/// Domain foundation entity.
///
/// This abstraction provides the common identity contract
/// shared by domain entities.
///
/// Blueprint yang sudah APPROVED tidak diulang.
/// Final Acceptance      → DEFERRED TO PART 7
/// Final Governance      → DEFERRED TO PART 7
/// Enterprise Baseline   → DEFERRED TO PART 7

abstract class BaseEntity {
  final String id;

  const BaseEntity({
    required this.id,
  });
}