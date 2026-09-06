import '../value_objects/jamaah_business_number.dart';
import '../value_objects/jamaah_customer_reference.dart';
import '../value_objects/jamaah_id.dart';
import '../value_objects/jamaah_tenant_context.dart';
import 'jamaah_audit.dart';
import 'jamaah_identity.dart';
import 'jamaah_lifecycle.dart';
import 'jamaah_status.dart';

class JamaahEntity {
  final JamaahId id;
  final JamaahTenantContext tenantContext;
  final JamaahBusinessNumber businessNumber;
  final JamaahCustomerReference customerReference;
  final JamaahIdentity identity;
  final JamaahStatus status;
  final JamaahLifecycle lifecycle;
  final JamaahAudit audit;

  const JamaahEntity({
    required this.id,
    required this.tenantContext,
    required this.businessNumber,
    required this.customerReference,
    required this.identity,
    required this.status,
    required this.lifecycle,
    required this.audit,
  });
}
