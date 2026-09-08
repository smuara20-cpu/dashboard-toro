import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/auth/application/controllers/session_controller.dart';
import 'package:dashboard_kpi/features/auth/domain/entities/session_context.dart';
import 'package:dashboard_kpi/features/auth/domain/entities/tenant_context.dart';
import 'package:dashboard_kpi/features/auth/domain/entities/user_entity.dart';

const _user = UserEntity(
  id: 'user-001',
  name: 'Toro',
  email: 'toro@example.com',
  role: 'CEO',
);

const _tenantContext = TenantContext(
  tenantId: 'tenant-001',
  companyId: 'company-001',
);

const _sessionContext = SessionContext(
  user: _user,
  tenantContext: _tenantContext,
);

void main() {
  test('establishSession accepts valid SessionContext', () {
    final controller = SessionController();

    final result = controller.establishSession(sessionContext: _sessionContext);

    expect(result, isTrue);
    expect(controller.state.isAuthenticated, isTrue);
    expect(controller.state.sessionContext, _sessionContext);
  });

  test('establishSession rejects invalid SessionContext', () {
    final controller = SessionController();

    const invalidSessionContext = SessionContext(
      user: _user,
      tenantContext: TenantContext(tenantId: '', companyId: ''),
    );

    final result = controller.establishSession(
      sessionContext: invalidSessionContext,
    );

    expect(result, isFalse);
    expect(controller.state.isAuthenticated, isFalse);
    expect(controller.state.sessionContext, isNull);
  });

  test('clearSession returns controller to unauthenticated state', () {
    final controller = SessionController();

    controller.establishSession(sessionContext: _sessionContext);

    controller.clearSession();

    expect(controller.state.isUnauthenticated, isTrue);
    expect(controller.state.sessionContext, isNull);
  });
}
