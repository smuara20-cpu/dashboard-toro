import '../entities/lead.dart';

/// Contract for CRM Lead persistence.
///
/// Implementations must enforce tenant and company scoping at the
/// persistence/backend boundary. UI filtering is not a security boundary.
abstract interface class LeadRepository {
  Future<Lead> createLead(Lead lead);

  Future<Lead?> getLeadById({
    required String id,
    required String tenantId,
    required String companyId,
  });

  Future<List<Lead>> getLeads({
    required String tenantId,
    required String companyId,
  });

  Future<Lead> updateLead(Lead lead);
}
