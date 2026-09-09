# AUTHORITATIVE TENANT CONTEXT SOURCE DECISION 001

**Decision ID:** AUTH-TENANT-CONTEXT-SOURCE-DECISION-001
**Version:** 1.0.0
**Status:** APPROVED / LOCKED
**Authority:** SP-203 Identity & Access Platform

## 1. Decision

VENTRA menetapkan bahwa `TenantContext` untuk authenticated application
session harus berasal dari authoritative Identity & Access source.

```text
Authentication
      ↓
UserEntity
      ↓
TenantContextSource
      ↓
Authoritative Tenant Access Context
      ↓
TenantContext
      ↓
SessionEstablishmentService
      ↓
SessionContext
      ↓
SessionController
```

Application tidak boleh membuat, menebak, atau meng-hardcode tenant.

## 2. Tenant / Company Reconciliation

```text
Tenant
  │ 1:1
  ▼
Company
```

- Tenant = enterprise tenancy boundary.
- Company = canonical business/master/data-owner entity.
- Company tetap dipertahankan.
- `company_id` tetap dipertahankan.
- `company_id` bukan pengganti `tenant_id`.
- Tidak membuat duplicate Company untuk session.
- Tidak membuat physical Organization table baru.

## 3. Rejected Alternatives

**REJECTED:**

- User ID → Tenant
- Email → Tenant
- Role → Tenant
- Hardcoded Tenant
- app configuration → Tenant
- Jamaah → Tenant
- Booking → Tenant
- Fake TenantContextSource

Alasannya: semua bukan authoritative tenant access resolution.

## 4. Approved Contract

```dart
abstract interface class TenantContextSource {
  Future<TenantContext?> resolve({
    required UserEntity user,
  });
}
```

Signature tidak berubah.

## 5. Session Decision

Authentication success ≠ Tenant Session Established.

```text
UserEntity + Valid TenantContext = Valid SessionContext
```

Jika context null/invalid:

```text
SessionController → Unauthenticated
```

## 6. Security Decision

Client-side TenantContext bukan security boundary.

Backend / authoritative data access layer tetap wajib menegakkan
tenant isolation dan authorization.

## 7. Scope

Decision hanya mencakup:

```text
Authentication → Tenant Context → Session
```

Tidak mencakup:

- Tenant CRUD
- Company CRUD
- Organization CRUD
- Branch CRUD
- Role / Permission CRUD
- Tenant/Organization/Branch switching UI
- Jamaah
- Booking
- Finance
- Router
- UI redesign

## 8. Implementation Consequence

Allowed:

```text
TenantContextSource adapter
```

hanya apabila authoritative source tersedia.

Forbidden:

```text
FakeTenantContextSource
HardcodedTenantContextSource
UserIdTenantResolver
EmailTenantResolver
RoleTenantResolver
```

## 9. Current State

```text
TenantContextSource
        ↓
CONTRACT READY
        ↓
Authoritative Adapter
        ↓
NOT YET IMPLEMENTED
```

Status ini intentional. Jangan mengisi kekosongan dengan dummy data.

## 10. Next Slice

**STEP 3B-2B-2B — AUTHORITATIVE TENANT CONTEXT ADAPTER**

Prerequisite:

```text
AUTH-TENANT-CONTEXT-SOURCE-CONTRACT-001
+
AUTH-TENANT-CONTEXT-SOURCE-DECISION-001
+
Authoritative source availability
```

## 11. Governance

**APPROVED / LOCKED**

Perubahan terhadap decision ini membutuhkan architecture decision record
baru.
