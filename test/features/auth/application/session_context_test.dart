import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/auth/application/controllers/session_controller.dart';
import 'package:dashboard_kpi/features/auth/application/state/session_state.dart';
import 'package:dashboard_kpi/features/auth/domain/entities/session_context.dart';
import 'package:dashboard_kpi/features/auth/domain/entities/tenant_context.dart';
import 'package:dashboard_kpi/features/auth/domain/entities/user_entity.dart';

void main() {
  group('SessionContext', () {
    test('creates valid session context', () {
      const user = UserEntity(
        id: 'user-001',
        name: 'Toro',
        email: 'toro@example.com',
        role: 'CEO',
      );

      const tenantContext = TenantContext(
        tenantId: 'tenant-001',
        companyId: 'company-001',
      );

      const sessionContext = SessionContext(
        user: user,
        tenantContext: tenantContext,
      );

      expect(sessionContext.isValid, isTrue);
      expect(sessionContext.userId, 'user-001');
      expect(sessionContext.tenantId, 'tenant-001');
      expect(sessionContext.companyId, 'company-001');
    });

    test('invalid tenant context makes session context invalid', () {
      const user = UserEntity(
        id: 'user-001',
        name: 'Toro',
        email: 'toro@example.com',
        role: 'CEO',
      );

      const tenantContext = TenantContext(
        tenantId: '',
        companyId: 'company-001',
      );

      const sessionContext = SessionContext(
        user: user,
        tenantContext: tenantContext,
      );

      expect(sessionContext.isValid, isFalse);
    });

    test('copyWith preserves unchanged values', () {
      const user = UserEntity(
        id: 'user-001',
        name: 'Toro',
        email: 'toro@example.com',
        role: 'CEO',
      );

      const tenantContext = TenantContext(
        tenantId: 'tenant-001',
        companyId: 'company-001',
      );

      const sessionContext = SessionContext(
        user: user,
        tenantContext: tenantContext,
      );

      final copied = sessionContext.copyWith();

      expect(copied, equals(sessionContext));
    });
  });

  group('SessionController', () {
    test('establishSession accepts valid session context', () {
      const user = UserEntity(
        id: 'user-001',
        name: 'Toro',
        email: 'toro@example.com',
        role: 'CEO',
      );

      const tenantContext = TenantContext(
        tenantId: 'tenant-001',
        companyId: 'company-001',
      );

      const sessionContext = SessionContext(
        user: user,
        tenantContext: tenantContext,
      );

      final controller = SessionController();

      final result = controller.establishSession(
        sessionContext: sessionContext,
      );

      expect(result, isTrue);
      expect(controller.state.status, SessionStateStatus.authenticated);
      expect(controller.state.isAuthenticated, isTrue);
      expect(controller.state.sessionContext, equals(sessionContext));
    });

    test('establishSession rejects invalid session context', () {
      const user = UserEntity(
        id: 'user-001',
        name: 'Toro',
        email: 'toro@example.com',
        role: 'CEO',
      );

      const tenantContext = TenantContext(
        tenantId: '',
        companyId: 'company-001',
      );

      const sessionContext = SessionContext(
        user: user,
        tenantContext: tenantContext,
      );

      final controller = SessionController();

      final result = controller.establishSession(
        sessionContext: sessionContext,
      );

      expect(result, isFalse);
      expect(controller.state.status, SessionStateStatus.unauthenticated);
      expect(controller.state.isAuthenticated, isFalse);
      expect(controller.state.sessionContext, isNull);
    });

    test('clearSession returns controller to unauthenticated state', () {
      const user = UserEntity(
        id: 'user-001',
        name: 'Toro',
        email: 'toro@example.com',
        role: 'CEO',
      );

      const tenantContext = TenantContext(
        tenantId: 'tenant-001',
        companyId: 'company-001',
      );

      const sessionContext = SessionContext(
        user: user,
        tenantContext: tenantContext,
      );

      final controller = SessionController();

      controller.establishSession(sessionContext: sessionContext);

      controller.clearSession();

      expect(controller.state.status, SessionStateStatus.unauthenticated);
      expect(controller.state.isAuthenticated, isFalse);
      expect(controller.state.sessionContext, isNull);
    });
  });
}
