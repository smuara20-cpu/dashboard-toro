import '../models/lead_model.dart';

abstract interface class LeadDataSource {
  Future<LeadModel> createLead(LeadModel lead);

  Future<LeadModel?> getLeadById({
    required String id,
    required String tenantId,
    required String companyId,
  });

  Future<List<LeadModel>> getLeads({
    required String tenantId,
    required String companyId,
  });

  Future<LeadModel> updateLead(LeadModel lead);
}
