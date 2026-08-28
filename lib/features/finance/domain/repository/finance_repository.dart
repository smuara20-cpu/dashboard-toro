import '../entities/transaction_entity.dart';

abstract interface class FinanceRepository {
  /// Returns all financial transactions.
  Future<List<TransactionEntity>> getTransactions();

  /// Returns a transaction by its unique identifier.
  ///
  /// Returns null when the transaction does not exist.
  Future<TransactionEntity?> getTransactionById(String id);

  /// Persists a new financial transaction.
  Future<void> saveTransaction(TransactionEntity transaction);

  /// Updates an existing financial transaction.
  Future<void> updateTransaction(TransactionEntity transaction);

  /// Deletes a financial transaction by its unique identifier.
  Future<void> deleteTransaction(String id);
}