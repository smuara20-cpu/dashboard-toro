import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/auth/application/services/session_establishment_service.dart';
import 'package:dashboard_kpi/features/auth/domain/entities/tenant_context.dart';
import 'package:dashboard_kpi/features/auth/domain/entities/user_entity.dart';
import 'package:dashboard_kpi/features/auth/domain/repository/tenant_context_source.dart';

class _FakeTenantContextSource implements TenantContextSource {
  final TenantContext? context;

  const _FakeTenantContextSource(this.context);

  @override
  Future<TenantContext?> resolve({required UserEntity user}) async {
    return context;
  }
}

void main() {
  const user = UserEntity(
    id: 'user-001',
    name: 'Toro',
    email: 'toro@example.com',
    role: 'CEO',
  );

  group('SessionEstablishmentService', () {
    test('creates session from authoritative tenant context', () async {
      const tenantContext = TenantContext(
        tenantId: 'tenant-001',
        companyId: 'company-001',
      );

      final service = SessionEstablishmentService(
        tenantContextSource: const _FakeTenantContextSource(tenantContext),
      );

      final session = await service.establish(user: user);

      expect(session, isNotNull);
      expect(session!.user.id, 'user-001');
      expect(session.tenantId, 'tenant-001');
      expect(session.companyId, 'company-001');
    });

    test('does not establish session without tenant context', () async {
      final service = SessionEstablishmentService(
        tenantContextSource: const _FakeTenantContextSource(null),
      );

      final session = await service.establish(user: user);

      expect(session, isNull);
    });

    test('does not establish session with invalid tenant context', () async {
      const invalidContext = TenantContext(
        tenantId: '',
        companyId: 'company-001',
      );

      final service = SessionEstablishmentService(
        tenantContextSource: const _FakeTenantContextSource(invalidContext),
      );

      final session = await service.establish(user: user);

      expect(session, isNull);
    });
  });
}
