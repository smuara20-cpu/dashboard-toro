import '../../domain/entities/jamaah_audit.dart';
import '../../domain/entities/jamaah_entity.dart';
import '../../domain/entities/jamaah_identity.dart';
import '../../domain/entities/jamaah_lifecycle.dart';
import '../../domain/entities/jamaah_status.dart';
import '../../domain/value_objects/jamaah_business_number.dart';
import '../../domain/value_objects/jamaah_customer_reference.dart';
import '../../domain/value_objects/jamaah_id.dart';
import '../../domain/value_objects/jamaah_tenant_context.dart';
import '../models/jamaah_model.dart';

class JamaahMapper {
  const JamaahMapper();

  JamaahEntity toEntity(JamaahModel model) {
    return JamaahEntity(
      id: JamaahId(model.id),
      tenantContext: JamaahTenantContext(model.tenantId),
      businessNumber: JamaahBusinessNumber(model.jamaahCode),
      customerReference: JamaahCustomerReference(model.customerId),
      identity: _JamaahIdentity(model.identityData),
      status: _JamaahStatus(model.status),
      lifecycle: _JamaahLifecycle(model.lifecycle),
      audit: JamaahAudit(
        createdAt: model.createdAt,
        updatedAt: model.updatedAt,
        createdBy: 'persistence',
        updatedBy: null,
      ),
    );
  }

  JamaahModel toModel(JamaahEntity entity) {
    return JamaahModel(
      id: entity.id.value,
      tenantId: entity.tenantContext.value,
      customerId: entity.customerReference.value,
      jamaahCode: entity.businessNumber.value,
      identityData: entity.identity.toData(),
      status: entity.status.value,
      lifecycle: entity.lifecycle.value,
      createdAt: entity.audit.createdAt,
      updatedAt: entity.audit.updatedAt,
      deletedAt: null,
    );
  }
}

final class _JamaahIdentity implements JamaahIdentity {
  final Map<String, dynamic> data;

  const _JamaahIdentity(this.data);

  @override
  Map<String, dynamic> toData() {
    return Map<String, dynamic>.from(data);
  }
}

final class _JamaahStatus implements JamaahStatus {
  @override
  final String value;

  const _JamaahStatus(this.value);
}

final class _JamaahLifecycle implements JamaahLifecycle {
  @override
  final String value;

  const _JamaahLifecycle(this.value);
}
