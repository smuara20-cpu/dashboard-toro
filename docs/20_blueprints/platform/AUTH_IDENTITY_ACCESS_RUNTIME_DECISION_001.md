# AUTH IDENTITY & ACCESS RUNTIME DECISION 001

**Decision ID:** AUTH-IDENTITY-ACCESS-RUNTIME-DECISION-001
**Version:** 1.0.0
**Status: APPROVED / LOCKED
**Authority:** SP-203 Identity & Access Platform

## 1. Decision
Runtime TenantContext wajib diperoleh melalui authoritative Identity & Access runtime boundary.

## 2. Accepted Architecture
`	ext
Flutter Authentication
      ↓
UserEntity
      ↓
TenantContextSource
      ↓
Authoritative Identity & Access Runtime
      ↓
Effective Tenant Access
      ↓
TenantContext
      ↓
SessionContext
` 

## 3. Accepted Source
SP-203 adalah authority untuk identity, authentication, session, tenant access, organization context, role/permission context, dan identity lifecycle.
Runtime implementation hanya boleh menggunakan official authoritative API/service yang menyediakan effective tenant access.

## 4. Rejected Sources
Ditolak: UserEntity.id, email, role, hardcoded tenant, application configuration, UI state, Jamaah, Booking, Finance, direct database access dari Flutter, dan fake TenantContextSource.

## 5. Session Rule
`	ext
UserEntity + Valid TenantContext = Valid SessionContext
` 
Jika TenantContext null atau invalid, session tetap unauthenticated.

## 6. Security Rule
Backend / Identity & Access Platform adalah security boundary.
Client-side TenantContext hanya application context dan tidak boleh dianggap sebagai mekanisme tenant isolation.

## 7. Scope
Decision ini hanya mencakup Authentication → Identity & Access Runtime → TenantContext → Session.
Tidak mencakup perubahan Jamaah, Booking, Finance, Router, UI, atau business domain lain.

## 8. Implementation Gate
Authoritative adapter ditahan sampai runtime source contract tersedia dan terbukti menyediakan effective tenant access, tenant identifier, dan company identifier.

## 9. Current Status
ARCHITECTURE READY

RUNTIME SOURCE CONTRACT REQUIRED

ADAPTER NOT YET IMPLEMENTED

## 10. Governance
Decision ini APPROVED / LOCKED.
