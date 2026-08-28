import '../models/transaction_model.dart';

abstract interface class FinanceDataSource {
  Future<List<TransactionModel>> getTransactions();

  Future<TransactionModel?> getTransactionById(String id);

  Future<void> saveTransaction(TransactionModel transaction);

  Future<void> updateTransaction(TransactionModel transaction);

  Future<void> deleteTransaction(String id);
}