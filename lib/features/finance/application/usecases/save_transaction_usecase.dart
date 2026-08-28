import '../../domain/entities/transaction_entity.dart';
import '../../domain/repository/finance_repository.dart';

class SaveTransactionUseCase {
  final FinanceRepository repository;

  const SaveTransactionUseCase({
    required this.repository,
  });

  Future<void> call(TransactionEntity transaction) {
    return repository.saveTransaction(transaction);
  }
}