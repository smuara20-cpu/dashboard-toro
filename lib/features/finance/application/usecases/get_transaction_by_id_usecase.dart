import '../../domain/entities/transaction_entity.dart';
import '../../domain/repository/finance_repository.dart';

class GetTransactionByIdUseCase {
  final FinanceRepository repository;

  const GetTransactionByIdUseCase({
    required this.repository,
  });

  Future<TransactionEntity?> call(String id) {
    return repository.getTransactionById(id);
  }
}