import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/tenant_context.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/tenant_context_source.dart';

class SupabaseTenantContextSource implements TenantContextSource {
  final SupabaseClient client;

  SupabaseTenantContextSource({SupabaseClient? client})
    : client = client ?? Supabase.instance.client;

  @override
  Future<TenantContext?> resolve({required UserEntity user}) async {
    final response = await client.rpc('resolve_effective_tenant_access');

    if (response == null) {
      return null;
    }

    if (response is! List || response.length != 1) {
      return null;
    }

    final row = response.first;

    if (row is! Map) {
      return null;
    }

    final userId = row['user_id']?.toString().trim() ?? '';
    final tenantId = row['tenant_id']?.toString().trim() ?? '';
    final companyId = row['company_id']?.toString().trim() ?? '';

    if (userId.isEmpty || tenantId.isEmpty || companyId.isEmpty) {
      return null;
    }

    if (userId != user.id.trim()) {
      return null;
    }

    return TenantContext(tenantId: tenantId, companyId: companyId);
  }
}
