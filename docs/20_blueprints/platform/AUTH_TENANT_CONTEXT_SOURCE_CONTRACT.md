# AUTHORITATIVE TENANT CONTEXT SOURCE CONTRACT

**Document ID:** AUTH-TENANT-CONTEXT-SOURCE-CONTRACT-001
**Version:** 1.0.0
**Status:** APPROVED / LOCKED
**Authority:** SP-203 Identity & Access Platform

## 1. Purpose

Menetapkan boundary authoritative source untuk memperoleh `TenantContext`
setelah authentication berhasil.

```text
Authentication
    ↓
UserEntity
    ↓
Authoritative Identity & Access Source
    ↓
TenantContextSource
    ↓
TenantContext
    ↓
SessionEstablishmentService
    ↓
SessionContext
```

Contract ini belum mengimplementasikan adapter, API client, database
access, atau infrastructure integration.

## 2. Application Boundary

Contract yang digunakan:

```dart
abstract interface class TenantContextSource {
  Future<TenantContext?> resolve({
    required UserEntity user,
  });
}
```

Signature tetap dan tidak diubah oleh decision ini.

## 3. Authority

SP-203 Identity & Access Platform adalah authority untuk:

- Identity
- Authentication
- Session Management
- Tenant Access Context
- Organization Access Context
- Role / Permission Context
- Identity Lifecycle

Business domain tidak boleh menjadi authoritative identity/access source.

## 4. Tenant / Company

Approved relationship:

```text
Tenant
  │ 1:1
  ▼
Company
```

Rules:

- Tenant = canonical enterprise tenancy boundary.
- Company = canonical business/master/data-owner entity.
- Tenant dan Company bukan entity yang sama.
- `company_id` tetap `company_id`.
- `company_id` tidak diganti menjadi `tenant_id`.
- Tidak membuat physical Organization table baru hanya untuk session.

## 5. Authoritative Resolution

`TenantContextSource` wajib memperoleh effective tenant/company access
dari authoritative Identity & Access source.

Tidak boleh berasal dari:

- hardcoded tenant/company
- `UserEntity.id`
- email
- role
- application configuration
- Jamaah
- Booking
- Customer
- Finance
- UI state
- local dummy data

## 6. Resolution Semantics

Success:

```text
UserEntity
    ↓
TenantContextSource.resolve()
    ↓
Valid TenantContext
```

Unavailable:

```text
resolve() → null
```

Invalid:

```text
TenantContext.isValid == false
```

Context null/invalid tidak boleh digunakan untuk authenticated session.

## 7. Session Rule

Authentication success tidak sama dengan Tenant Session Established.

```text
AUTH LOGIN
    ↓
UserEntity
    ↓
Tenant Context Resolution
    ↓
Valid TenantContext
    ↓
SessionContext
    ↓
Authenticated Application State
```

Jika tenant context unavailable/invalid:

```text
SessionController → Unauthenticated
```

## 8. Security

Client `TenantContext` adalah application access context, bukan security
boundary.

Backend / authoritative data access layer wajib menegakkan:

- tenant isolation
- authorization
- access control
- cross-tenant protection

## 9. Dependency Direction

```text
Identity & Access Authority
          ↓
TenantContextSource Adapter
          ↓
TenantContextSource Contract
          ↓
SessionEstablishmentService
          ↓
SessionController
          ↓
Application State
```

Jamaah, Booking, Finance, dan Customer bukan source dependency.

## 10. Current State

Sudah tersedia:

```text
TenantContext
SessionContext
TenantContextSource
SessionEstablishmentService
AuthSessionService
SessionController
```

Authoritative adapter belum tersedia.

Fake adapter tidak diperbolehkan.

## 11. Adapter Readiness

Adapter hanya boleh dibuat apabila authoritative source menyediakan
minimum:

```text
Authenticated User
        ↓
Effective Tenant Access
        ↓
Tenant ID
        ↓
Company ID
        ↓
Valid Access Context
```

Adapter tidak boleh mengubah domain contract untuk menyesuaikan source.

## 12. Acceptance

- TenantContextSource tetap menjadi application boundary.
- Tenant berasal dari authoritative Identity & Access source.
- Company tetap canonical Company.
- `company_id` tetap `company_id`.
- Tidak ada tenant derivation.
- Tidak ada hardcoded tenant/company.
- Tidak ada fake tenant adapter.
- Session hanya authenticated dengan valid TenantContext.
- Backend tetap security boundary.
- Jamaah, Booking, Finance, Router, dan UI tidak disentuh.

## 13. Governance

**APPROVED / LOCKED**

Perubahan membutuhkan explicit architecture decision baru.
