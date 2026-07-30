import 'package:get_it/get_it.dart';

import '../../features/booking/data/mapper/customer_mapper.dart';

final getIt = GetIt.instance;

void registerMapper() {
  getIt.registerLazySingleton<CustomerMapper>(
        () => const CustomerMapper(),
  );
}