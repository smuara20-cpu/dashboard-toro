import '../../domain/entities/lead.dart';
import '../../domain/enums/lead_source.dart';
import '../../domain/enums/lead_status.dart';
import '../models/lead_model.dart';

class LeadMapper {
  const LeadMapper();

  Lead toEntity(LeadModel model) {
    return Lead(
      id: model.id,
      tenantId: model.tenantId,
      companyId: model.companyId,
      ownerId: model.ownerId,
      source: _parseSource(model.leadSource),
      status: _parseStatus(model.status),
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      deletedAt: model.deletedAt,
    );
  }

  LeadModel toModel(Lead entity) {
    return LeadModel(
      id: entity.id,
      tenantId: entity.tenantId,
      companyId: entity.companyId,
      ownerId: entity.ownerId,
      leadSource: entity.source.name,
      status: entity.status.value,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
    );
  }

  LeadSource _parseSource(String value) {
    for (final source in LeadSource.values) {
      if (source.name == value) {
        return source;
      }
    }

    throw FormatException('Unknown LeadSource value: $value');
  }

  LeadStatus _parseStatus(String value) {
    for (final status in LeadStatus.values) {
      if (status.value == value) {
        return status;
      }
    }

    throw FormatException('Unknown LeadStatus value: $value');
  }
}
