import 'finance_datasource.dart';
import '../models/transaction_model.dart';

class FinanceLocalDataSource implements FinanceDataSource {
  final List<TransactionModel> _transactions = [];

  @override
  Future<List<TransactionModel>> getTransactions() async {
    return List.unmodifiable(_transactions);
  }

  @override
  Future<TransactionModel?> getTransactionById(String id) async {
    for (final transaction in _transactions) {
      if (transaction.id == id) {
        return transaction;
      }
    }

    return null;
  }

  @override
  Future<void> saveTransaction(TransactionModel transaction) async {
    _transactions.add(transaction);
  }

  @override
  Future<void> updateTransaction(TransactionModel transaction) async {
    final index = _transactions.indexWhere(
          (item) => item.id == transaction.id,
    );

    if (index == -1) {
      throw StateError(
        'Transaction not found: ${transaction.id}',
      );
    }

    _transactions[index] = transaction;
  }

  @override
  Future<void> deleteTransaction(String id) async {
    _transactions.removeWhere(
          (transaction) => transaction.id == id,
    );
  }
}