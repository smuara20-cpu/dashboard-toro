import '../../features/customer/data/datasource/customer_datasource.dart';
import 'service_locator.dart';
import '../../features/customer/data/mapper/customer_mapper.dart';
import '../../features/customer/data/repository/customer_repository_impl.dart';
import '../../features/customer/domain/repository/customer_repository.dart';
import '../../features/finance/data/datasource/finance_datasource.dart';
import '../../features/finance/data/mapper/transaction_mapper.dart';
import '../../features/finance/data/repository/finance_repository_impl.dart';
import '../../features/finance/domain/repository/finance_repository.dart';

void registerRepositories() {
  sl.registerLazySingleton<CustomerRepository>(
    () => CustomerRepositoryImpl(
      dataSource: sl<CustomerDataSource>(),
      mapper: sl<CustomerMapper>(),
    ),
  );

  sl.registerLazySingleton<FinanceRepository>(
    () => FinanceRepositoryImpl(
      dataSource: sl<FinanceDataSource>(),
      mapper: sl<TransactionMapper>(),
    ),
  );
}
