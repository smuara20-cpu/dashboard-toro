import '../../application/usecases/delete_transaction_usecase.dart';
import '../../application/usecases/get_transaction_by_id_usecase.dart';
import '../../application/usecases/get_transactions_usecase.dart';
import '../../application/usecases/save_transaction_usecase.dart';
import '../../application/usecases/update_transaction_usecase.dart';
import '../../domain/entities/transaction_entity.dart';
import '../state/finance_state.dart';

class FinanceController {
  final GetTransactionsUseCase getTransactionsUseCase;
  final GetTransactionByIdUseCase getTransactionByIdUseCase;
  final SaveTransactionUseCase saveTransactionUseCase;
  final UpdateTransactionUseCase updateTransactionUseCase;
  final DeleteTransactionUseCase deleteTransactionUseCase;

  FinanceState _state = const FinanceState();

  FinanceState get state => _state;

  FinanceController({
    required this.getTransactionsUseCase,
    required this.getTransactionByIdUseCase,
    required this.saveTransactionUseCase,
    required this.updateTransactionUseCase,
    required this.deleteTransactionUseCase,
  });

  Future<void> loadTransactions() async {
    _state = _state.copyWith(
      status: FinanceStatus.loading,
      clearErrorMessage: true,
    );

    try {
      final transactions = await getTransactionsUseCase();

      _state = _state.copyWith(
        status: transactions.isEmpty
            ? FinanceStatus.empty
            : FinanceStatus.success,
        transactions: transactions,
        clearErrorMessage: true,
      );
    } catch (error) {
      _state = _state.copyWith(
        status: FinanceStatus.failure,
        errorMessage: error.toString(),
      );
    }
  }

  Future<TransactionEntity?> getTransactionById(String id) async {
    try {
      return await getTransactionByIdUseCase(id);
    } catch (error) {
      _state = _state.copyWith(
        status: FinanceStatus.failure,
        errorMessage: error.toString(),
      );

      return null;
    }
  }

  Future<void> saveTransaction(TransactionEntity transaction) async {
    try {
      await saveTransactionUseCase(transaction);
      await loadTransactions();
    } catch (error) {
      _state = _state.copyWith(
        status: FinanceStatus.failure,
        errorMessage: error.toString(),
      );
    }
  }

  Future<void> updateTransaction(TransactionEntity transaction) async {
    try {
      await updateTransactionUseCase(transaction);
      await loadTransactions();
    } catch (error) {
      _state = _state.copyWith(
        status: FinanceStatus.failure,
        errorMessage: error.toString(),
      );
    }
  }

  Future<void> deleteTransaction(String id) async {
    try {
      await deleteTransactionUseCase(id);
      await loadTransactions();
    } catch (error) {
      _state = _state.copyWith(
        status: FinanceStatus.failure,
        errorMessage: error.toString(),
      );
    }
  }
}
