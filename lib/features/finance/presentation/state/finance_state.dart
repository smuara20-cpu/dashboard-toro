import '../../domain/entities/transaction_entity.dart';

enum FinanceStatus { initial, loading, success, empty, failure }

class FinanceState {
  final FinanceStatus status;
  final List<TransactionEntity> transactions;
  final String? errorMessage;

  const FinanceState({
    this.status = FinanceStatus.initial,
    this.transactions = const [],
    this.errorMessage,
  });

  FinanceState copyWith({
    FinanceStatus? status,
    List<TransactionEntity>? transactions,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return FinanceState(
      status: status ?? this.status,
      transactions: transactions ?? this.transactions,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }

  bool get isLoading => status == FinanceStatus.loading;

  bool get isSuccess => status == FinanceStatus.success;

  bool get isEmpty => status == FinanceStatus.empty;

  bool get hasError => status == FinanceStatus.failure;
}
