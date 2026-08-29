import '../../features/customer/data/mapper/customer_mapper.dart';
import 'service_locator.dart';
import '../../features/finance/data/mapper/transaction_mapper.dart';

void registerMappers() {
  sl.registerLazySingleton<CustomerMapper>(() => const CustomerMapper());

  sl.registerLazySingleton<TransactionMapper>(() => TransactionMapper());
}
