# SP-203 Runtime Provider Decision 001

**Project:** VENTRA
**Program:** VENTRAL 10 DAYS
**Subsystem:** SP-203 Identity & Access Platform
**Artifact Type:** Runtime Provider Decision
**Status:** APPROVED / DECISION LOCKED
**Environment:** Supabase VENTRA-DEV
**Date:** 2026-09-30

---

## 1. PURPOSE

Dokumen ini menetapkan Runtime Provider untuk operation SP-203:

Resolve Effective Tenant Access

Decision ini merupakan kelanjutan dari:

- SP-203 Identity & Access Platform Enterprise Edition v2.0
- AUTH_IDENTITY_ACCESS_RUNTIME_CONTRACT
- AUTH_IDENTITY_ACCESS_API_CONTRACT_001
- AUTH_IDENTITY_ACCESS_RUNTIME_DECISION_001
- AUTH_IDENTITY_ACCESS_API_DECISION_001
- AUTH_IDENTITY_ACCESS_TRANSPORT_BLOCKER_001
- SP203_RUNTIME_PROVIDER_EVIDENCE_001
- SP203_TENANT_PHYSICAL_DECISION_001
- SP203_TENANT_PHYSICAL_VALIDATION_001

Tenant physical schema telah tervalidasi GREEN pada checkpoint 48d6217.

---

## 2. DECISION

Supabase VENTRA-DEV ditetapkan sebagai implementation target untuk SP-203 Runtime Provider pada operation:

Resolve Effective Tenant Access

Supabase menjadi provider implementation untuk runtime access resolution, bukan pengganti logical authority SP-203.

Logical contract SP-203 tetap menjadi authority.

---

## 3. AUTHORITATIVE RESOLUTION CHAIN

Effective Tenant Access wajib diperoleh melalui chain:

auth.uid()
    ->
auth.users
    ->
tenant_memberships
    ->
tenants
    ->
companies

Runtime provider tidak boleh memperoleh tenant dari:

- UserEntity.id sebagai tenant_id
- email
- role
- UI state
- local configuration
- hardcoded tenant
- Jamaah
- Customer
- Booking
- Finance
- dummy data

---

## 4. EFFECTIVE ACCESS RESULT

Successful resolution wajib menghasilkan:

- user_id
- tenant_id
- company_id

Ketiga identifier tersebut harus berasal dari authoritative database relationship.

Client tidak diperbolehkan menentukan tenant_id atau company_id sebagai authority.

---

## 5. MEMBERSHIP RESOLUTION POLICY

Current physical schema mengizinkan satu user memiliki satu atau lebih tenant memberships.

Current TenantContext runtime contract belum menyediakan explicit tenant selection input.

Karena itu runtime provider menggunakan policy berikut:

### Exactly One Valid Membership

Jika authenticated user memiliki tepat satu valid tenant membership:

- resolve tenant_id
- resolve company_id
- return successful Effective Tenant Access

### Zero Membership

Jika authenticated user tidak memiliki tenant membership:

return:

TENANT_ACCESS_NOT_FOUND

Session establishment tidak boleh berhasil.

### Multiple Memberships

Jika authenticated user memiliki lebih dari satu valid tenant membership:

runtime provider tidak boleh memilih tenant secara arbitrer.

Return:

INVALID_ACCESS_CONTEXT

Session establishment tidak boleh memilih tenant berdasarkan urutan database, email, role, UI state, atau configuration.

Explicit tenant selection membutuhkan contract decision tersendiri sebelum dapat digunakan.

---

## 6. PROVIDER BOUNDARY

Provider implementation akan ditempatkan pada Supabase VENTRA-DEV.

Runtime operation akan direalisasikan melalui database-side authoritative operation.

Initial implementation target:

Supabase PostgreSQL RPC / database function

Operation:

Resolve Effective Tenant Access

Provider harus menggunakan authenticated execution context.

Provider tidak boleh mempercayai user_id atau tenant_id yang dikirim sebagai arbitrary client authority.

---

## 7. TRANSPORT DECISION

Untuk Supabase RPC implementation:

Transport:

HTTP POST through Supabase Data API RPC interface

Logical operation:

Resolve Effective Tenant Access

Provider endpoint binding:

Supabase RPC operation

Concrete RPC function name akan ditetapkan pada implementation artifact dan tidak boleh diganti secara ad-hoc oleh Flutter business logic.

Authentication:

Authenticated Supabase session

Authorization:

Database-side authenticated context and subsequent security policy.

Flutter tidak boleh melakukan direct tenant membership calculation sebagai pengganti provider.

---

## 8. ERROR CONTRACT

Provider harus mempertahankan logical SP-203 error semantics:

UNAUTHENTICATED

Authenticated context tidak tersedia atau tidak valid.

TENANT_ACCESS_NOT_FOUND

Authenticated user tidak memiliki valid tenant membership.

INVALID_ACCESS_CONTEXT

Authenticated user memiliki ambiguous/multiple effective tenant memberships tanpa selection context yang authoritative.

SERVICE_UNAVAILABLE

Provider tidak tersedia.

TIMEOUT

Provider tidak menyelesaikan operation dalam batas waktu yang ditentukan oleh runtime integration.

UNAUTHORIZED

Authenticated subject tidak memiliki akses yang diperlukan.

---

## 9. MULTI-TENANT SAFETY

Multiple membership tidak boleh menyebabkan implicit tenant switching.

Tidak diperbolehkan:

- SELECT pertama tanpa policy
- ORDER BY arbitrary lalu LIMIT 1
- memilih tenant berdasarkan company
- memilih tenant berdasarkan role
- memilih tenant berdasarkan email
- memilih tenant berdasarkan UI
- memilih tenant berdasarkan local storage
- memilih tenant berdasarkan environment configuration

Ambiguous tenant context harus gagal closed.

---

## 10. SECURITY BOUNDARY

Provider harus resolve authenticated identity dari execution context.

Client-supplied tenant_id tidak menjadi authority.

Client-supplied company_id tidak menjadi authority.

Provider tidak boleh menggunakan service-level bypass sebagai mekanisme normal untuk menghindari tenant security boundary.

RLS/security hardening tetap merupakan implementation gate tersendiri.

---

## 11. OUT OF SCOPE

Decision ini belum menyelesaikan:

- Complete RLS policy
- Role model
- Permission model
- Policy model
- Device trust
- Session risk scoring
- Production authorization enablement
- Explicit multi-tenant selection UX
- Flutter runtime adapter
- Production deployment authorization

---

## 12. IMPLEMENTATION GATE

Sebelum Flutter TenantContext adapter diimplementasikan, provider harus membuktikan:

1. Authenticated execution context tersedia.
2. User identity dapat diperoleh secara authoritative.
3. Membership relationship dapat ditemukan.
4. Tenant relationship dapat ditemukan.
5. Company relationship dapat ditemukan.
6. Zero membership menghasilkan TENANT_ACCESS_NOT_FOUND.
7. Exactly one membership menghasilkan user_id, tenant_id, company_id.
8. Multiple memberships menghasilkan INVALID_ACCESS_CONTEXT.
9. Client tidak dapat menentukan tenant authority secara arbitrary.
10. Provider error behavior sesuai logical SP-203 contract.

---

## 13. VALIDATION EVIDENCE REQUIRED

Implementation berikutnya wajib menghasilkan evidence untuk:

- Function existence
- Function signature
- Security execution context
- Authenticated user resolution
- Membership resolution
- Tenant resolution
- Company resolution
- Zero membership behavior
- Single membership behavior
- Multiple membership behavior
- Error mapping
- Unauthorized access behavior
- Security/RLS interaction
- Flutter provider integration readiness

---

## 14. GOVERNANCE STATUS

Current state:

Tenant Physical Design = LOCKED

Tenant Physical Migration = EXECUTED

Tenant Physical Validation = GREEN

Runtime Provider Decision = APPROVED / LOCKED

Runtime Provider Implementation = NEXT

Flutter TenantContext Adapter = NOT IMPLEMENTED

Production Authorization = NOT AUTHORIZED

---

## 15. NEXT APPROVED STAGE

Next stage:

SP-203 Runtime Provider Implementation 001

Implementation target:

Supabase VENTRA-DEV

Initial operation:

Resolve Effective Tenant Access

Implementation must follow this decision and must not introduce speculative tenant selection or client-side tenant authority.