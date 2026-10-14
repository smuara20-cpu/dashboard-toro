import '../../domain/entities/lead.dart';
import '../../domain/repository/lead_repository.dart';

class CreateLeadUseCase {
  final LeadRepository repository;

  const CreateLeadUseCase({required this.repository});

  Future<Lead> call(Lead lead) {
    if (lead.isDeleted) {
      throw ArgumentError('A deleted lead cannot be created');
    }

    return repository.createLead(lead);
  }
}
