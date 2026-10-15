import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:dashboard_kpi/features/auth/data/datasource/tenant_context_remote_datasource.dart';
import 'package:dashboard_kpi/features/auth/domain/entities/tenant_context.dart';
import 'package:dashboard_kpi/features/auth/domain/entities/user_entity.dart';

class _FakeHttpClient extends http.BaseClient {
  _FakeHttpClient(this.handler);

  final Future<http.Response> Function(http.BaseRequest request) handler;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final response = await handler(request);

    return http.StreamedResponse(
      Stream<List<int>>.value(response.bodyBytes),
      response.statusCode,
      request: request,
      headers: response.headers,
      reasonPhrase: response.reasonPhrase,
    );
  }
}

void main() {
  const user = UserEntity(
    id: 'user-001',
    name: 'Toro',
    email: 'toro@example.com',
    role: 'CEO',
  );

  Future<TenantContext?> resolveWithResponse(
    Object? body, {
    int statusCode = 200,
  }) async {
    final fakeHttpClient = _FakeHttpClient((request) async {
      expect(request.method, 'POST');
      expect(
        request.url.path,
        endsWith('/rpc/resolve_effective_tenant_access'),
      );

      return http.Response(
        jsonEncode(body),
        statusCode,
        headers: {'content-type': 'application/json'},
      );
    });

    final client = SupabaseClient(
      'https://example.supabase.co',
      'test-anon-key',
      httpClient: fakeHttpClient,
    );

    try {
      final source = SupabaseTenantContextSource(client: client);
      return await source.resolve(user: user);
    } finally {
      await client.dispose();
      fakeHttpClient.close();
    }
  }

  group('SupabaseTenantContextSource', () {
    test('returns context for one valid RPC row', () async {
      final result = await resolveWithResponse([
        {
          'user_id': 'user-001',
          'tenant_id': 'tenant-001',
          'company_id': 'company-001',
        },
      ]);

      expect(
        result,
        const TenantContext(
          tenantId: 'tenant-001',
          companyId: 'company-001',
        ),
      );
    });

    test('returns null for an empty RPC result', () async {
      expect(await resolveWithResponse([]), isNull);
    });

    test('returns null when RPC returns multiple rows', () async {
      final result = await resolveWithResponse([
        {
          'user_id': 'user-001',
          'tenant_id': 'tenant-001',
          'company_id': 'company-001',
        },
        {
          'user_id': 'user-001',
          'tenant_id': 'tenant-002',
          'company_id': 'company-002',
        },
      ]);

      expect(result, isNull);
    });

    test('returns null when the row is not a map', () async {
      expect(await resolveWithResponse(['invalid-row']), isNull);
    });

    test('returns null when user id does not match', () async {
      final result = await resolveWithResponse([
        {
          'user_id': 'another-user',
          'tenant_id': 'tenant-001',
          'company_id': 'company-001',
        },
      ]);

      expect(result, isNull);
    });

    test('returns null when a required field is missing', () async {
      final result = await resolveWithResponse([
        {
          'user_id': 'user-001',
          'tenant_id': 'tenant-001',
        },
      ]);

      expect(result, isNull);
    });

    test('returns null when tenant or company id is blank', () async {
      final blankTenant = await resolveWithResponse([
        {
          'user_id': 'user-001',
          'tenant_id': ' ',
          'company_id': 'company-001',
        },
      ]);

      final blankCompany = await resolveWithResponse([
        {
          'user_id': 'user-001',
          'tenant_id': 'tenant-001',
          'company_id': '',
        },
      ]);

      expect(blankTenant, isNull);
      expect(blankCompany, isNull);
    });

    test('propagates an HTTP error from the RPC', () async {
      await expectLater(
        resolveWithResponse(
          {'message': 'unauthorized'},
          statusCode: 401,
        ),
        throwsA(anything),
      );
    });
  });
}
