import '../enums/lead_source.dart';
import '../enums/lead_status.dart';

/// Immutable CRM Lead domain entity.
///
/// Physical persistence and tenant authorization remain outside this entity.
class Lead {
  final String id;
  final String tenantId;
  final String companyId;
  final String ownerId;
  final LeadSource source;
  final LeadStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  Lead({
    required this.id,
    required this.tenantId,
    required this.companyId,
    required this.ownerId,
    required this.source,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  }) {
    if (id.trim().isEmpty) {
      throw ArgumentError.value(id, 'id', 'Must not be empty');
    }
    if (tenantId.trim().isEmpty) {
      throw ArgumentError.value(tenantId, 'tenantId', 'Must not be empty');
    }
    if (companyId.trim().isEmpty) {
      throw ArgumentError.value(companyId, 'companyId', 'Must not be empty');
    }
    if (ownerId.trim().isEmpty) {
      throw ArgumentError.value(ownerId, 'ownerId', 'Must not be empty');
    }
    if (updatedAt.isBefore(createdAt)) {
      throw ArgumentError('updatedAt must not be earlier than createdAt');
    }
    final deletionTime = deletedAt;
    if (deletionTime != null && deletionTime.isBefore(updatedAt)) {
      throw ArgumentError('deletedAt must not be earlier than updatedAt');
    }
  }

  bool get isDeleted => deletedAt != null;

  bool get isActive => !isDeleted;

  Lead transitionTo(LeadStatus nextStatus, {required DateTime at}) {
    if (isDeleted) {
      throw StateError('A deleted lead cannot change status');
    }
    if (!status.canTransitionTo(nextStatus)) {
      throw StateError(
        'Invalid lead status transition: '
        '${status.value} -> ${nextStatus.value}',
      );
    }
    if (at.isBefore(updatedAt)) {
      throw ArgumentError.value(at, 'at', 'Must not be earlier than updatedAt');
    }

    return Lead(
      id: id,
      tenantId: tenantId,
      companyId: companyId,
      ownerId: ownerId,
      source: source,
      status: nextStatus,
      createdAt: createdAt,
      updatedAt: at,
      deletedAt: deletedAt,
    );
  }

  Lead softDelete({required DateTime at}) {
    if (isDeleted) {
      throw StateError('Lead is already deleted');
    }
    if (at.isBefore(updatedAt)) {
      throw ArgumentError.value(at, 'at', 'Must not be earlier than updatedAt');
    }

    return Lead(
      id: id,
      tenantId: tenantId,
      companyId: companyId,
      ownerId: ownerId,
      source: source,
      status: status,
      createdAt: createdAt,
      updatedAt: at,
      deletedAt: at,
    );
  }
}
