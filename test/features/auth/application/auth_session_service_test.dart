import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/auth/application/controllers/session_controller.dart';
import 'package:dashboard_kpi/features/auth/application/services/auth_session_service.dart';
import 'package:dashboard_kpi/features/auth/application/services/session_establishment_service.dart';
import 'package:dashboard_kpi/features/auth/domain/entities/tenant_context.dart';
import 'package:dashboard_kpi/features/auth/domain/entities/user_entity.dart';
import 'package:dashboard_kpi/features/auth/domain/repository/auth_repository.dart';
import 'package:dashboard_kpi/features/auth/domain/repository/tenant_context_source.dart';
import 'package:dashboard_kpi/features/auth/domain/usecases/login_usecase.dart';

class _FakeAuthRepository implements AuthRepository {
  UserEntity? user;
  bool logoutCalled = false;

  @override
  Future<UserEntity?> login({
    required String email,
    required String password,
  }) async {
    return user;
  }

  @override
  Future<void> logout() async {
    logoutCalled = true;
  }
}

class _FakeTenantContextSource implements TenantContextSource {
  TenantContext? context;

  @override
  Future<TenantContext?> resolve({required UserEntity user}) async {
    return context;
  }
}

UserEntity _buildUser() {
  return const UserEntity(
    id: 'user-001',
    name: 'Toro',
    email: 'toro@example.com',
    role: 'CEO',
  );
}

void main() {
  test(
    'login establishes authenticated session when tenant context is valid',
    () async {
      final authRepository = _FakeAuthRepository()..user = _buildUser();

      final tenantSource = _FakeTenantContextSource()
        ..context = const TenantContext(
          tenantId: 'tenant-001',
          companyId: 'company-001',
        );

      final controller = SessionController();

      final service = AuthSessionService(
        loginUseCase: LoginUseCase(authRepository),
        sessionEstablishmentService: SessionEstablishmentService(
          tenantContextSource: tenantSource,
        ),
        sessionController: controller,
      );

      final result = await service.login(
        email: 'toro@example.com',
        password: 'password',
      );

      expect(result, isTrue);
      expect(controller.state.isAuthenticated, isTrue);
      expect(controller.state.sessionContext?.userId, 'user-001');
      expect(controller.state.sessionContext?.tenantId, 'tenant-001');
      expect(controller.state.sessionContext?.companyId, 'company-001');
    },
  );

  test(
    'login fails and clears session when tenant context is unavailable',
    () async {
      final authRepository = _FakeAuthRepository()..user = _buildUser();

      final tenantSource = _FakeTenantContextSource();

      final controller = SessionController();

      final service = AuthSessionService(
        loginUseCase: LoginUseCase(authRepository),
        sessionEstablishmentService: SessionEstablishmentService(
          tenantContextSource: tenantSource,
        ),
        sessionController: controller,
      );

      final result = await service.login(
        email: 'toro@example.com',
        password: 'password',
      );

      expect(result, isFalse);
      expect(controller.state.isAuthenticated, isFalse);
      expect(controller.state.sessionContext, isNull);
    },
  );

  test(
    'login fails and clears session when authentication returns no user',
    () async {
      final authRepository = _FakeAuthRepository();

      final tenantSource = _FakeTenantContextSource()
        ..context = const TenantContext(
          tenantId: 'tenant-001',
          companyId: 'company-001',
        );

      final controller = SessionController();

      final service = AuthSessionService(
        loginUseCase: LoginUseCase(authRepository),
        sessionEstablishmentService: SessionEstablishmentService(
          tenantContextSource: tenantSource,
        ),
        sessionController: controller,
      );

      final result = await service.login(
        email: 'toro@example.com',
        password: 'password',
      );

      expect(result, isFalse);
      expect(controller.state.isAuthenticated, isFalse);
      expect(controller.state.sessionContext, isNull);
    },
  );
}
