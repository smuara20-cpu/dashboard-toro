import '../../domain/enums/lead_status.dart';
import '../../domain/repository/lead_repository.dart';

class UpdateLeadStatusUseCase {
  final LeadRepository repository;

  const UpdateLeadStatusUseCase({required this.repository});

  Future<void> call({
    required String id,
    required String tenantId,
    required String companyId,
    required LeadStatus targetStatus,
    required DateTime updatedAt,
  }) async {
    final lead = await repository.getLeadById(
      id: id,
      tenantId: tenantId,
      companyId: companyId,
    );

    if (lead == null) {
      throw StateError('Lead not found in the requested scope');
    }

    final updatedLead = lead.transitionTo(targetStatus, at: updatedAt);

    await repository.updateLead(updatedLead);
  }
}
