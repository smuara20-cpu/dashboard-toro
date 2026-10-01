# SP-203 Runtime Provider Validation 001

## Project
VENTRA

## Program
VENTRAL 10 DAYS

## Specification
SP-203 — Identity & Access Platform Enterprise Edition v2.0

## Validation Artifact
SP203_RUNTIME_PROVIDER_VALIDATION_001

## Status
VALIDATED — GREEN

## Validation Environment
Supabase VENTRA-DEV

---

## 1. Purpose

Dokumen ini merekam evidence validation untuk concrete runtime provider
SP-203 pada operation:

Resolve Effective Tenant Access

Validation dilakukan setelah:

- Tenant Physical Design APPROVED / LOCKED
- Tenant Physical Migration EXECUTED
- Tenant Physical Validation GREEN
- SP-203 Runtime Provider Decision APPROVED / LOCKED
- Runtime Provider Implementation EXECUTED
- Flutter TenantContext adapter IMPLEMENTED

---

## 2. Runtime Provider

Implementation target:

Supabase VENTRA-DEV

Provider boundary:

Supabase PostgreSQL RPC / Database Function

Function:

public.resolve_effective_tenant_access()

Runtime resolution chain:

auth.uid()
    ->
auth.users
    ->
tenant_memberships
    ->
tenants
    ->
companies

Provider result:

{
  user_id,
  tenant_id,
  company_id
}

---

## 3. Runtime Provider Contract

The provider resolves effective tenant access exclusively from the
authenticated Supabase identity context.

The provider MUST NOT derive tenant access from:

- UserEntity.id as tenant_id
- email
- role
- UI selection
- local configuration
- hardcoded tenant
- Jamaah
- Customer
- Booking
- Finance
- dummy data

The authenticated subject is resolved through auth.uid().

The resulting tenant_id and company_id are authoritative database
relationship results.

---

## 4. Provider Security Execution

Function:

public.resolve_effective_tenant_access()

Security mode:

SECURITY INVOKER

Arguments:

none

Return contract:

TABLE(
    user_id UUID,
    tenant_id UUID,
    company_id UUID
)

Runtime configuration:

search_path=public, auth

EXECUTE privilege:

authenticated = granted

PUBLIC = revoked

Security definer:

false

---

## 5. Authenticated Runtime Test

Test user:

smuara20@gmail.com

Authenticated user reference:

938d41be-65a6-4d9a-b925-b62267d3837c

### Result

AUTHENTICATED: PASS

USER_ID:

938d41be-65a6-4d9a-b925-b62267d3837c

RPC:

PASS

Provider returned:

tenant_id:

877ba574-94a7-4835-af59-a1601e14d8c1

company_id:

ca72f5f3-15de-4e12-ab93-d6c7383e1223

Provider user_id matched authenticated user_id.

SP203_EFFECTIVE_TENANT_ACCESS:

PASS

SIGNED_OUT:

PASS

---

## 6. Zero Membership Validation

Scenario:

Authenticated user has no valid tenant membership.

Expected behavior:

TENANT_ACCESS_NOT_FOUND

Session must not establish an effective tenant context.

### Runtime Evidence

RPC result:

FAIL / expected provider rejection

RPC code:

P0001

RPC message:

TENANT_ACCESS_NOT_FOUND

Conclusion:

PASS

The provider fails closed when no tenant access exists.

---

## 7. Single Membership Validation

Scenario:

Authenticated user has exactly one valid tenant membership.

Test user:

938d41be-65a6-4d9a-b925-b62267d3837c

Resolved tenant:

877ba574-94a7-4835-af59-a1601e14d8c1

Resolved company:

ca72f5f3-15de-4e12-ab93-d6c7383e1223

Expected behavior:

Return exactly one effective tenant access record.

Observed behavior:

RPC PASS

Provider returned exactly one record.

Provider user_id matched authenticated user_id.

Provider returned non-empty tenant_id.

Provider returned non-empty company_id.

Conclusion:

PASS

---

## 8. Multiple Membership Validation

Scenario:

The same authenticated user was temporarily assigned to two valid
tenant memberships.

Membership 1:

tenant_id:
877ba574-94a7-4835-af59-a1601e14d8c1

company_id:
ca72f5f3-15de-4e12-ab93-d6c7383e1223

company_code:

SP203-TEST-SMUARA20

Membership 2:

tenant_id:
e7d05eae-45b2-483a-9f85-b2bfb0b33836

company_id:
6b866c25-de83-4217-bff4-b61a196fce7f

company_code:

SP203-TEST-SMUARA20-02

Both memberships belonged to the same authenticated user:

938d41be-65a6-4d9a-b925-b62267d3837c

Expected behavior:

INVALID_ACCESS_CONTEXT

The provider MUST NOT arbitrarily select one tenant.

### Runtime Evidence

AUTHENTICATED:

PASS

RPC:

FAIL / expected provider rejection

RPC code:

P0001

RPC message:

INVALID_ACCESS_CONTEXT

MULTIPLE_MEMBERSHIP_POLICY:

PASS

SIGNED_OUT:

PASS

Conclusion:

PASS

The provider correctly fails closed when effective tenant context is
ambiguous.

No arbitrary tenant selection was observed.

---

## 9. Flutter Runtime Integration

Flutter adapter:

SupabaseTenantContextSource

RPC operation:

resolve_effective_tenant_access

The adapter:

1. Calls the governed RPC.
2. Expects exactly one provider result.
3. Reads user_id, tenant_id, and company_id.
4. Validates that all values are non-empty.
5. Verifies provider user_id equals the authenticated UserEntity.id.
6. Produces TenantContext only after successful validation.

The authenticated runtime test proved the Flutter-to-Supabase RPC
transport successfully reaches the SP-203 runtime provider.

Status:

PASS

---

## 10. Regression Validation

Full Flutter test suite:

218 tests passed

Result:

PASS

Flutter analyze:

No issues found

Result:

PASS

Git diff check:

PASS

Git working tree:

CLEAN

Local branch:

master

Remote synchronization:

master = origin/master

---

## 11. Evidence Summary

| Validation | Result |
|---|---|
| Provider function exists | PASS |
| SECURITY INVOKER | PASS |
| Provider return contract | PASS |
| Authenticated execution | PASS |
| User identity resolution | PASS |
| Zero membership | PASS |
| Single membership | PASS |
| Multiple membership | PASS |
| Arbitrary tenant selection | NOT OBSERVED |
| Flutter RPC integration | PASS |
| Full regression | PASS |
| Flutter analyze | PASS |
| Git diff check | PASS |

---

## 12. Security Boundary

The runtime provider currently operates as SECURITY INVOKER.

Authenticated database access required SELECT privileges on:

- public.tenant_memberships
- public.tenants
- public.companies

RLS hardening has NOT yet been completed.

Therefore this validation proves runtime functionality and
fail-closed membership behavior, but does not constitute final
production authorization approval.

Production Authorization remains:

NOT AUTHORIZED

until the separate RLS / security hardening gate is completed and
validated.

---

## 13. Test Fixture Boundary

The multiple-membership validation used temporary test fixtures:

- SP203-TEST-SMUARA20
- SP203-TEST-SMUARA20-02
- corresponding tenants
- corresponding tenant memberships

These fixtures are validation-only and are scheduled for cleanup
after evidence capture.

No production business data is intended to depend on these fixtures.

---

## 14. Architectural Conclusion

SP-203 Runtime Provider implementation has passed the functional
runtime validation required for the current scope.

The following authoritative chain has been demonstrated:

Authenticated Identity
    ->
auth.uid()
    ->
tenant_memberships
    ->
tenants
    ->
companies
    ->
Effective Tenant Access
    ->
TenantContext

The provider:

- resolves identity from authenticated context;
- resolves tenant through validated membership;
- resolves company through the tenant relationship;
- rejects missing tenant access;
- rejects ambiguous multiple membership;
- does not arbitrarily select a tenant;
- returns the governed user_id / tenant_id / company_id contract.

Functional Runtime Provider Validation:

GREEN

Production Authorization:

NOT AUTHORIZED

Next controlled gate:

RLS / Security Hardening Validation