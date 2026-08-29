import '../../features/customer/data/datasource/customer_datasource.dart';
import 'service_locator.dart';
import '../../features/customer/data/datasource/customer_local_datasource.dart';
import '../../features/finance/data/datasource/finance_datasource.dart';
import '../../features/finance/data/datasource/finance_local_datasource.dart';

void registerDatasource() {
  sl.registerLazySingleton<CustomerDataSource>(() => CustomerLocalDataSource());

  sl.registerLazySingleton<FinanceDataSource>(() => FinanceLocalDataSource());
}
