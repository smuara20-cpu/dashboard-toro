# AUTH IDENTITY & ACCESS RUNTIME CONTRACT

**Document ID:** AUTH-IDENTITY-ACCESS-RUNTIME-CONTRACT-001
**Version:** 1.0.0
**Status: APPROVED / LOCKED
**Authority:** SP-203 Identity & Access Platform

## 1. Purpose
Menetapkan runtime boundary antara Flutter application dan authoritative Identity & Access Platform untuk memperoleh TenantContext tanpa bypass, derivation, hardcode, atau fake tenant source.

## 2. Runtime Boundary
Authentication
    ↓
UserEntity
    ↓
Identity & Access Runtime Boundary
    ↓
Authoritative Identity & Access Service
    ↓
Effective Tenant Access
    ↓
TenantContextSource
    ↓
TenantContext
    ↓
SessionEstablishmentService
    ↓
SessionContext

## 3. Required Runtime Result
Authoritative runtime source wajib menyediakan authenticated user reference, effective tenant access, tenant identifier, dan company identifier.

Hasil diterjemahkan menjadi TenantContext yang valid.

## 4. Application Boundary
`dart
abstract interface class TenantContextSource {
  Future<TenantContext?> resolve({
    required UserEntity user,
  });
}
``r

TenantContextSource hanya menerjemahkan hasil authoritative source. TenantContextSource tidak boleh menebak atau menghitung tenant.

## 5. Tenant and Company Rule
Tenant adalah canonical enterprise tenancy boundary.
Company adalah canonical business/master/data-owner entity.
Tenant dan Company memiliki hubungan 1:1 berdasarkan approved reconciliation.
company_id tetap company_id dan tidak diubah menjadi tenant_id.
Tidak membuat physical organization table sebagai bagian dari slice ini.

## 6. Prohibited Sources
TenantContext tidak boleh berasal dari UserEntity.id, email, role, hardcoded value, application config, UI state, Jamaah, Customer, Booking, Finance, dummy data, atau direct Flutter database access.

## 7. Security Boundary
Client application context bukan security boundary.
Backend / Identity & Access Platform wajib menegakkan authentication, authorization, effective tenant access, dan tenant isolation.

## 8. Failure Rule
Jika authoritative tenant access tidak tersedia atau TenantContext tidak valid, SessionContext tidak boleh dibentuk dan application session tidak boleh menjadi authenticated.

## 9. Dependency Rule
Runtime source hanya bergantung pada authoritative Identity & Access runtime boundary.
Tidak bergantung pada Jamaah, Booking, Finance, Customer, atau UI.

## 10. Current Project State
TenantContext, SessionContext, TenantContextSource, SessionEstablishmentService, AuthSessionService, dan SessionController sudah tersedia.
Authoritative runtime adapter belum tersedia.
Fake adapter tidak diperbolehkan.

## 11. Implementation Readiness
Adapter hanya boleh diimplementasikan setelah authoritative runtime endpoint/service contract tersedia dan terbukti menyediakan effective tenant access, tenant identifier, dan company identifier.

## 12. Acceptance
- Tidak ada tenant derivation.
- Tidak ada hardcoded tenant.
- Tidak ada fake tenant source.
- Tidak ada direct database access dari Flutter.
- Invalid tenant access tidak dapat meng-authenticate session.
- Tidak mengubah Jamaah, Booking, Finance, Router, atau UI.
- Dart format, targeted test, flutter analyze, flutter test, dan git diff --check wajib GREEN.

## 13. Governance
Dokumen ini APPROVED / LOCKED dan menjadi prerequisite runtime boundary untuk implementasi authoritative TenantContext adapter.
