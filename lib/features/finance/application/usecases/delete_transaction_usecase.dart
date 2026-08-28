import '../../domain/repository/finance_repository.dart';

class DeleteTransactionUseCase {
  final FinanceRepository repository;

  const DeleteTransactionUseCase({
    required this.repository,
  });

  Future<void> call(String id) {
    return repository.deleteTransaction(id);
  }
}