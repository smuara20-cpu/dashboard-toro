import '../../domain/repository/lead_repository.dart';

class SoftDeleteLeadUseCase {
  final LeadRepository repository;

  const SoftDeleteLeadUseCase({required this.repository});

  Future<void> call({
    required String id,
    required String tenantId,
    required String companyId,
    required DateTime deletedAt,
  }) async {
    final lead = await repository.getLeadById(
      id: id,
      tenantId: tenantId,
      companyId: companyId,
    );

    if (lead == null) {
      throw StateError('Lead not found in the requested scope');
    }

    final deletedLead = lead.softDelete(at: deletedAt);

    await repository.updateLead(deletedLead);
  }
}
