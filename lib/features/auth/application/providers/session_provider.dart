import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/auth_remote_datasource.dart';
import '../../data/repository/auth_repository_impl.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/repository/tenant_context_source.dart';
import '../../domain/usecases/login_usecase.dart';
import '../controllers/session_controller.dart';
import '../services/auth_session_service.dart';
import '../services/session_establishment_service.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSource();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.watch(authRemoteDataSourceProvider));
});

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
});

final tenantContextSourceProvider = Provider<TenantContextSource>((ref) {
  throw UnimplementedError(
    'TenantContextSource must be provided by the authoritative '
    'Identity & Access implementation.',
  );
});

final sessionEstablishmentServiceProvider =
    Provider<SessionEstablishmentService>((ref) {
      return SessionEstablishmentService(
        tenantContextSource: ref.watch(tenantContextSourceProvider),
      );
    });

final sessionControllerProvider = Provider<SessionController>((ref) {
  return SessionController();
});

final authSessionServiceProvider = Provider<AuthSessionService>((ref) {
  return AuthSessionService(
    loginUseCase: ref.watch(loginUseCaseProvider),
    sessionEstablishmentService: ref.watch(sessionEstablishmentServiceProvider),
    sessionController: ref.watch(sessionControllerProvider),
  );
});

final sessionStateProvider = Provider((ref) {
  return ref.watch(sessionControllerProvider).state;
});
