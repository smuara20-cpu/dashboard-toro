import 'package:supabase_flutter/supabase_flutter.dart';

class MarketingPlatformConfigRemoteDataSource {
  MarketingPlatformConfigRemoteDataSource({SupabaseClient? client})
    : _client = client ?? Supabase.instance.client;

  final SupabaseClient _client;

  static const _table = 'marketing_platform_configs';

  Future<Map<String, dynamic>?> fetchConfig({
    required String tenantId,
    required String platform,
  }) async {
    final response = await _client
        .from(_table)
        .select(
          'id, tenant_id, platform, profile_url, '
          'external_account_id, created_at, updated_at',
        )
        .eq('tenant_id', tenantId)
        .eq('platform', platform)
        .maybeSingle();

    if (response == null) return null;
    return Map<String, dynamic>.from(response);
  }

  Future<Map<String, dynamic>> saveConfig({
    required String tenantId,
    required String platform,
    required String profileUrl,
    String? externalAccountId,
  }) async {
    final normalizedUrl = profileUrl.trim();
    final normalizedAccountId = externalAccountId?.trim();

    final response = await _client
        .from(_table)
        .upsert({
          'tenant_id': tenantId,
          'platform': platform,
          'profile_url': normalizedUrl,
          'external_account_id':
              normalizedAccountId == null || normalizedAccountId.isEmpty
              ? null
              : normalizedAccountId,
        }, onConflict: 'tenant_id,platform')
        .select(
          'id, tenant_id, platform, profile_url, '
          'external_account_id, created_at, updated_at',
        )
        .single();

    return Map<String, dynamic>.from(response);
  }
}
