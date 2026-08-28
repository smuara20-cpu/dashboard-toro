import '../../domain/entities/transaction_entity.dart';
import '../../domain/repository/finance_repository.dart';

class UpdateTransactionUseCase {
  final FinanceRepository repository;

  const UpdateTransactionUseCase({
    required this.repository,
  });

  Future<void> call(TransactionEntity transaction) {
    return repository.updateTransaction(transaction);
  }
}