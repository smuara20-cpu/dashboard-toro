# AUTH IDENTITY ACCESS TRANSPORT BINDING BLOCKER

**Document ID:** AUTH-IDENTITY-ACCESS-TRANSPORT-BLOCKER-001
**Version:** 1.0.0
**Status:** APPROVED / LOCKED
**Authority:** SP-203 Identity & Access Platform
**Scope:** Authentication → Identity & Access → Tenant Context → Session Context

## 1. Purpose

Architecture dan logical API contract telah disetujui, tetapi concrete runtime transport binding belum tersedia secara authoritative. Dokumen ini mencatat blocker implementasi dan mencegah adapter dibuat berdasarkan asumsi.

## 2. Confirmed Contracts

- SP-203 Identity & Access Platform
- AUTH Tenant Context Source Contract
- AUTH Tenant Context Source Decision
- AUTH Identity Access Runtime Contract
- AUTH Identity Access Runtime Decision
- AUTH Identity Access API Contract
- AUTH Identity Access API Decision

Logical operation: **Resolve Effective Tenant Access**

Minimum authoritative response:

`json
{
  "user_id": "<authoritative-user-reference>",
  "tenant_id": "<authoritative-tenant-id>",
  "company_id": "<authoritative-company-id>"
}
``r

## 3. Transport Binding Status

| Requirement | Status |
|---|---|
| Identity & Access Authority | AVAILABLE |
| Logical API Operation | AVAILABLE |
| Request Context | DEFINED |
| Response Schema | DEFINED |
| HTTP Method | TBD |
| Endpoint / URL Path | TBD |
| Gateway Binding | TBD |
| Authentication Transport | TBD |
| HTTP Status Mapping | TBD |
| Error Payload Contract | TBD |
| Timeout | TBD |
| Retry Policy | TBD |
| Runtime Provider | NOT AVAILABLE |
| Environment / Base URL Contract | TBD |

## 4. Blocker

Concrete transport binding belum dipublikasikan oleh authoritative Identity & Access Provider. Karena itu TenantContextSource belum memiliki dasar yang cukup untuk runtime integration production-safe.

## 5. Implementation Rule

Adapter implementation MUST NOT begin until HTTP method, endpoint/path, gateway binding, authentication mechanism, request/response contract, HTTP status mapping, error contract, timeout, retry policy, environment configuration, dan runtime provider tersedia secara authoritative.

## 6. Explicitly Prohibited

- Menebak endpoint atau HTTP method.
- Menebak authentication mechanism.
- Membuat fake tenant context.
- Hardcode tenant ID atau company ID.
- Menggunakan UserEntity.id, email, role, UI state, Jamaah, Customer, Booking, atau Finance sebagai tenant selector.
- Direct Flutter access ke tabel users atau companies.
- Membuat mock adapter seolah-olah production adapter.

## 7. Security Rule

Backend / Identity & Access Platform tetap menjadi security boundary. Client-side TenantContext bukan security boundary dan tidak boleh digunakan untuk bypass authorization atau tenant isolation.

## 8. Session Rule

Authenticated User + Valid Authoritative TenantContext = Valid SessionContext.

Jika tenant access tidak tersedia, invalid, unauthorized, atau gagal diperoleh, session tetap unauthenticated. Tidak boleh fallback ke tenant default.

## 9. Scope Boundary

Dokumen ini hanya mencakup Authentication, Identity & Access, Tenant Context, Session Context, dan Transport Binding.

Tidak mencakup Jamaah, Booking, Finance, Customer, Payment, Router, atau UI.

## 10. Implementation Status

- Architecture: GREEN
- Governance Contracts: GREEN
- Logical API Contract: GREEN
- Transport Binding: BLOCKED
- Runtime Provider: NOT AVAILABLE
- TenantContext Adapter: HOLD

## 11. Exit Criteria

Blocker selesai apabila authoritative Identity & Access Provider menyediakan concrete transport contract yang memenuhi seluruh requirement transport.

Setelah itu proses:

Transport Binding → Contract → Decision → GREEN Gate → TenantContext Adapter → Tests → Analyze → Full Regression → Diff Check → Commit / Push.

## 12. Governance Decision

**APPROVED / LOCKED**

Keputusan: Jangan implementasikan adapter sebelum concrete Identity & Access transport binding tersedia secara authoritative.

Tidak ada fallback, guessing, hardcoding, atau fake production integration.

## 13. References

- SP-203 Identity & Access Platform
- AUTH-TENANT-CONTEXT-SOURCE-CONTRACT-001
- AUTH-TENANT-CONTEXT-SOURCE-DECISION-001
- AUTH-IDENTITY-ACCESS-RUNTIME-CONTRACT-001
- AUTH-IDENTITY-ACCESS-RUNTIME-DECISION-001
- AUTH-IDENTITY-ACCESS-API-CONTRACT-001
- AUTH-IDENTITY-ACCESS-API-DECISION-001
