import '../../features/finance/application/usecases/delete_transaction_usecase.dart';
import '../../features/finance/application/usecases/get_transaction_by_id_usecase.dart';
import '../../features/finance/application/usecases/get_transactions_usecase.dart';
import '../../features/finance/application/usecases/save_transaction_usecase.dart';
import '../../features/finance/application/usecases/update_transaction_usecase.dart';
import '../../features/finance/presentation/controllers/finance_controller.dart';
import 'service_locator.dart';

void registerController() {
  sl.registerFactory<FinanceController>(
    () => FinanceController(
      getTransactionsUseCase: sl<GetTransactionsUseCase>(),
      getTransactionByIdUseCase: sl<GetTransactionByIdUseCase>(),
      saveTransactionUseCase: sl<SaveTransactionUseCase>(),
      updateTransactionUseCase: sl<UpdateTransactionUseCase>(),
      deleteTransactionUseCase: sl<DeleteTransactionUseCase>(),
    ),
  );
}
