import 'package:get_it/get_it.dart';

import '../../features/booking/data/datasource/customer_local_datasource.dart';
import '../../features/booking/data/mapper/customer_mapper.dart';
import '../../features/booking/data/repository/customer_repository_impl.dart';
import '../../features/booking/domain/repository/customer_repository.dart';

final getIt = GetIt.instance;

void registerRepository() {
  getIt.registerLazySingleton<CustomerRepository>(
        () => CustomerRepositoryImpl(
      dataSource: getIt<CustomerLocalDataSource>(),
      mapper: getIt<CustomerMapper>(),
    ),
  );
}