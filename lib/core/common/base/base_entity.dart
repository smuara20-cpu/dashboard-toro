/// VENTRA Development Constitution
/// Enterprise Edition v2.0
/// Version: 2.0.0
/// Status: LOCKED
///
/// 12/12 VENTRA Development Constitution ALIGNED
/// Kesepakatan No. 1–11
///
/// Final Acceptance   → DEFERRED TO PART 7
/// Final Governance   → DEFERRED TO PART 7
/// Enterprise Baseline → DEFERRED TO PART 7
///
/// This file is part of the Domain Core.
/// UI, infrastructure, persistence, networking, and framework
/// concerns MUST NOT be introduced here.

abstract class BaseEntity {
  final String id;

  const BaseEntity({
    required this.id,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is BaseEntity && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}