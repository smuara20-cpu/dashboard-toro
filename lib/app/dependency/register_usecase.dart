import '../../features/finance/application/usecases/delete_transaction_usecase.dart';
import '../../features/finance/application/usecases/get_transaction_by_id_usecase.dart';
import '../../features/finance/application/usecases/get_transactions_usecase.dart';
import '../../features/finance/application/usecases/save_transaction_usecase.dart';
import '../../features/finance/application/usecases/update_transaction_usecase.dart';
import '../../features/finance/domain/repository/finance_repository.dart';
import 'service_locator.dart';

void registerUsecase() {
  sl.registerLazySingleton<GetTransactionsUseCase>(
    () => GetTransactionsUseCase(repository: sl<FinanceRepository>()),
  );

  sl.registerLazySingleton<GetTransactionByIdUseCase>(
    () => GetTransactionByIdUseCase(repository: sl<FinanceRepository>()),
  );

  sl.registerLazySingleton<SaveTransactionUseCase>(
    () => SaveTransactionUseCase(repository: sl<FinanceRepository>()),
  );

  sl.registerLazySingleton<UpdateTransactionUseCase>(
    () => UpdateTransactionUseCase(repository: sl<FinanceRepository>()),
  );

  sl.registerLazySingleton<DeleteTransactionUseCase>(
    () => DeleteTransactionUseCase(repository: sl<FinanceRepository>()),
  );
}
