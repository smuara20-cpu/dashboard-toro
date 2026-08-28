import '../../domain/entities/transaction_entity.dart';
import '../../domain/repository/finance_repository.dart';

class GetTransactionsUseCase {
  final FinanceRepository repository;

  const GetTransactionsUseCase({
    required this.repository,
  });

  Future<List<TransactionEntity>> call() {
    return repository.getTransactions();
  }
}