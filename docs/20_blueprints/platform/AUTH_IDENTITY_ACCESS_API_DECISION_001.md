# AUTH IDENTITY ACCESS API DECISION 001

**Decision ID:** AUTH-IDENTITY-ACCESS-API-DECISION-001  
**Version:** 1.0.0  
**Status:** APPROVED / LOCKED  
**Authority:** SP-203 Identity & Access Platform  

## 1. Decision
TenantContext untuk application session harus diperoleh melalui governed Identity & Access API contract yang authoritative. Flutter tidak boleh menentukan atau memperoleh tenant melalui business domain, UI state atau direct database access.

## 2. Accepted Architecture
```text
Authenticated User
      ↓
SP-203 Identity & Access
      ↓
Resolve Effective Tenant Access
      ↓
Authoritative Tenant ID + Company ID
      ↓
TenantContextSource
      ↓
TenantContext
      ↓
SessionEstablishmentService
      ↓
SessionContext
```

## 3. Accepted API Contract
Consumer menggunakan logical operation `Resolve Effective Tenant Access`. Concrete HTTP method, endpoint/path dan gateway binding belum ditetapkan oleh source blueprint sehingga statusnya tetap TBD sampai Provider / Integration Architecture mempublikasikan transport contract.

## 4. Accepted Response
Minimum authoritative result:
- user_id
- tenant_id
- company_id

`tenant_id` dan `company_id` harus berasal dari effective access context SP-203, bukan dari client input.

## 5. Authentication Decision
Authentication credential/token tetap menjadi responsibility Identity & Access architecture. Contract ini tidak menciptakan authentication mechanism baru dan tidak boleh menebak token format.

## 6. Authorization Decision
SP-203 adalah authority yang menentukan effective tenant access. Client hanya mengonsumsi hasil keputusan tersebut.

## 7. Rejected Alternatives
- tenant dari `UserEntity.id`
- tenant dari email
- tenant dari role
- tenant hardcode
- tenant dari UI/config
- tenant dari Jamaah
- tenant dari Customer
- tenant dari Booking
- tenant dari Finance
- direct query tabel users
- direct query tabel companies
- fake TenantContextSource
- client-supplied tenant/company sebagai authorization authority

## 8. Security Decision
Backend / Identity & Access Platform tetap menjadi security enforcement boundary. TenantContext pada Flutter hanya application context.

## 9. Failure Decision
Jika authentication, authorization atau effective tenant access gagal, SessionContext tidak boleh menjadi authenticated.

## 10. Contract Governance
Breaking API change wajib melalui versioning dan formal approval. Concrete transport binding, HTTP status mapping, timeout dan retry policy wajib ditetapkan sebelum adapter production implementation.

## 11. Scope
Decision ini hanya mencakup Authentication, Identity & Access API, Effective Tenant Access, TenantContext dan SessionContext.

Tidak mengubah Jamaah, Booking, Finance, Router atau UI.

## 12. Implementation Gate
Adapter implementation ditahan sampai concrete authoritative runtime API contract tersedia dan dapat diverifikasi.

## 13. Current Status
API CONTRACT GOVERNANCE READY / TRANSPORT BINDING REQUIRED / ADAPTER NOT YET IMPLEMENTED

## 14. Governance
APPROVED / LOCKED