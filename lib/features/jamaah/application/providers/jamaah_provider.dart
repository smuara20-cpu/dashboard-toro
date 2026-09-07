import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/jamaah_local_datasource.dart';
import '../../data/mapper/jamaah_mapper.dart';
import '../../data/repository/jamaah_repository_impl.dart';
import '../../domain/repository/jamaah_repository.dart';
import '../controllers/jamaah_controller.dart';
import '../usecases/create_jamaah_usecase.dart';
import '../usecases/get_jamaah_by_customer_reference_usecase.dart';
import '../usecases/get_jamaah_by_id_usecase.dart';
import '../usecases/get_jamaahs_usecase.dart';
import '../usecases/update_jamaah_usecase.dart';

final jamaahDataSourceProvider = Provider<JamaahLocalDataSource>((ref) {
  return JamaahLocalDataSource();
});

final jamaahMapperProvider = Provider<JamaahMapper>((ref) {
  return const JamaahMapper();
});

final jamaahRepositoryProvider = Provider<JamaahRepository>((ref) {
  return JamaahRepositoryImpl(
    dataSource: ref.read(jamaahDataSourceProvider),
    mapper: ref.read(jamaahMapperProvider),
  );
});

final createJamaahUseCaseProvider = Provider<CreateJamaahUseCase>((ref) {
  return CreateJamaahUseCase(repository: ref.read(jamaahRepositoryProvider));
});

final getJamaahByIdUseCaseProvider = Provider<GetJamaahByIdUseCase>((ref) {
  return GetJamaahByIdUseCase(repository: ref.read(jamaahRepositoryProvider));
});

final getJamaahsUseCaseProvider = Provider<GetJamaahsUseCase>((ref) {
  return GetJamaahsUseCase(repository: ref.read(jamaahRepositoryProvider));
});

final getJamaahByCustomerReferenceUseCaseProvider =
    Provider<GetJamaahByCustomerReferenceUseCase>((ref) {
      return GetJamaahByCustomerReferenceUseCase(
        repository: ref.read(jamaahRepositoryProvider),
      );
    });

final updateJamaahUseCaseProvider = Provider<UpdateJamaahUseCase>((ref) {
  return UpdateJamaahUseCase(repository: ref.read(jamaahRepositoryProvider));
});

final jamaahControllerProvider = Provider<JamaahController>((ref) {
  return JamaahController(
    createJamaahUseCase: ref.read(createJamaahUseCaseProvider),
    getJamaahByIdUseCase: ref.read(getJamaahByIdUseCaseProvider),
    getJamaahsUseCase: ref.read(getJamaahsUseCaseProvider),
    getJamaahByCustomerReferenceUseCase: ref.read(
      getJamaahByCustomerReferenceUseCaseProvider,
    ),
    updateJamaahUseCase: ref.read(updateJamaahUseCaseProvider),
  );
});
