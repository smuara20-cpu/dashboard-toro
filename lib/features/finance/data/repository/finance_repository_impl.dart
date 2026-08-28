import '../../domain/entities/transaction_entity.dart';
import '../../domain/repository/finance_repository.dart';
import '../datasource/finance_datasource.dart';
import '../mapper/transaction_mapper.dart';

class FinanceRepositoryImpl implements FinanceRepository {
  final FinanceDataSource dataSource;
  final TransactionMapper mapper;

  const FinanceRepositoryImpl({
    required this.dataSource,
    required this.mapper,
  });

  @override
  Future<List<TransactionEntity>> getTransactions() async {
    final models = await dataSource.getTransactions();

    return models
        .map(mapper.toEntity)
        .toList(growable: false);
  }

  @override
  Future<TransactionEntity?> getTransactionById(String id) async {
    final model = await dataSource.getTransactionById(id);

    if (model == null) {
      return null;
    }

    return mapper.toEntity(model);
  }

  @override
  Future<void> saveTransaction(TransactionEntity transaction) async {
    final model = mapper.toModel(transaction);

    await dataSource.saveTransaction(model);
  }

  @override
  Future<void> updateTransaction(TransactionEntity transaction) async {
    final model = mapper.toModel(transaction);

    await dataSource.updateTransaction(model);
  }

  @override
  Future<void> deleteTransaction(String id) async {
    await dataSource.deleteTransaction(id);
  }
}