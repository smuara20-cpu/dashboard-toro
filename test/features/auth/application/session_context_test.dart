import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/auth/application/controllers/session_controller.dart';
import 'package:dashboard_kpi/features/auth/application/state/session_state.dart';
import 'package:dashboard_kpi/features/auth/domain/entities/tenant_context.dart';
import 'package:dashboard_kpi/features/auth/domain/entities/user_entity.dart';

void main() {
  group('TenantContext', () {
    test('validates tenant and company identifiers', () {
      const context = TenantContext(
        tenantId: 'tenant-001',
        companyId: 'company-001',
      );

      expect(context.isValid, isTrue);
      expect(context.tenantId, 'tenant-001');
      expect(context.companyId, 'company-001');
    });

    test('rejects empty tenant identifier', () {
      const context = TenantContext(tenantId: '', companyId: 'company-001');

      expect(context.isValid, isFalse);
    });

    test('rejects empty company identifier', () {
      const context = TenantContext(tenantId: 'tenant-001', companyId: '');

      expect(context.isValid, isFalse);
    });
  });

  group('SessionController', () {
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

    test('starts unauthenticated', () {
      final controller = SessionController();

      expect(controller.state.status, SessionStateStatus.unauthenticated);
      expect(controller.state.isAuthenticated, isFalse);
      expect(controller.state.sessionContext, isNull);
    });

    test('establishes authenticated session', () {
      final controller = SessionController();

      final result = controller.establishSession(
        user: user,
        tenantContext: tenantContext,
      );

      expect(result, isTrue);
      expect(controller.state.status, SessionStateStatus.authenticated);
      expect(controller.state.isAuthenticated, isTrue);

      final session = controller.state.sessionContext;

      expect(session, isNotNull);
      expect(session!.user.id, 'user-001');
      expect(session.tenantId, 'tenant-001');
      expect(session.companyId, 'company-001');
    });

    test('rejects invalid tenant context', () {
      final controller = SessionController();

      final result = controller.establishSession(
        user: user,
        tenantContext: const TenantContext(
          tenantId: '',
          companyId: 'company-001',
        ),
      );

      expect(result, isFalse);
      expect(controller.state.status, SessionStateStatus.unauthenticated);
      expect(controller.state.sessionContext, isNull);
    });

    test('clears authenticated session', () {
      final controller = SessionController();

      controller.establishSession(user: user, tenantContext: tenantContext);

      controller.clearSession();

      expect(controller.state.status, SessionStateStatus.unauthenticated);
      expect(controller.state.isAuthenticated, isFalse);
      expect(controller.state.sessionContext, isNull);
    });
  });
}
