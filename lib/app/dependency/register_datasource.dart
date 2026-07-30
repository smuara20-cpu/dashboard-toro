import 'package:get_it/get_it.dart';

import '../../features/booking/data/datasource/customer_local_datasource.dart';

final getIt = GetIt.instance;

void registerDatasource() {
  getIt.registerLazySingleton<CustomerLocalDataSource>(
        () => CustomerLocalDataSource(),
  );
}