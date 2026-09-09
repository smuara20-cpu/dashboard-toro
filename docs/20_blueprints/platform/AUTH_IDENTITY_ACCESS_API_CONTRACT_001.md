# AUTH IDENTITY ACCESS API CONTRACT 001

**Contract ID:** AUTH-IDENTITY-ACCESS-API-CONTRACT-001  
**Version:** 1.0.0  
**Status:** APPROVED / LOCKED  
**Authority:** SP-203 Identity & Access Platform  
**Owner:** Identity & Access Platform  
**Consumer:** Flutter Application / Session Layer  
**Provider:** SP-203 Identity & Access Runtime  

## 1. Purpose
Menetapkan governed API contract untuk memperoleh effective tenant access dari authoritative Identity & Access Platform setelah authentication berhasil. Contract ini menjadi dasar implementasi TenantContextSource dan tidak mengizinkan tenant derivation di client.

## 2. Authority
SP-203 Identity & Access Platform adalah authority untuk Identity, Authentication, Authorization dan Access Context. Consumer tidak boleh mengakses internal implementation SP-203 secara langsung. Integration wajib menggunakan governed API, Event, Message atau Contract.

## 3. Operation
Logical operation: `Resolve Effective Tenant Access`

Tujuan operation: memperoleh access context tenant yang efektif untuk authenticated user.

## 4. Transport Binding
HTTP method, URL path, API gateway binding dan concrete transport endpoint **TBD — Provider / Integration Architecture**.
Client tidak boleh mengasumsikan endpoint yang belum dipublikasikan sebagai active contract.

## 5. Authentication Requirement
- Request harus berasal dari authenticated application session.
- Authentication credential/token dikelola oleh Identity & Access architecture.
- Anonymous request tidak boleh memperoleh tenant access.
- Credential/token format mengikuti authoritative authentication contract dan tidak didefinisikan ulang di contract ini.

## 6. Authorization Requirement
- SP-203 menentukan apakah authenticated identity memiliki effective tenant access.
- Authorization dilakukan oleh authoritative Identity & Access runtime.
- Client tidak boleh menentukan sendiri tenant atau company yang akan digunakan.

## 7. Request Contract
Request tidak boleh menerima `tenant_id` atau `company_id` sebagai authority selector dari UI/client.

Logical request context minimal:
```json
{
  \"authenticated_subject\": \"derived-from-authentication-context\"
}
```

`authenticated_subject` merupakan logical identity reference dari authenticated security context. Client tidak boleh menggunakannya untuk menebak tenant.

## 8. Response Contract
Successful response wajib menyediakan minimum information yang diperlukan untuk membentuk TenantContext:
```json
{
  \"user_id\": \"<authoritative-user-reference>\",
  \"tenant_id\": \"<authoritative-tenant-id>\",
  \"company_id\": \"<authoritative-company-id>\"
}
```

Semantics:
- `user_id` = authoritative identity reference.
- `tenant_id` = effective tenant boundary yang diberikan SP-203.
- `company_id` = canonical Company yang terkait dengan effective Tenant.
- `tenant_id` dan `company_id` tidak boleh berasal dari client input.

## 9. Tenant / Company Rule
Tenant adalah canonical enterprise tenancy boundary. Company adalah canonical business/master/data-owner entity. Hubungan Tenant ↔ Company mengikuti approved reconciliation. `company_id` tetap `company_id` dan tidak diganti menjadi `tenant_id`.

## 10. Client Mapping
Successful authoritative response diterjemahkan oleh TenantContextSource menjadi:
```dart
TenantContext(
  tenantId: response.tenantId,
  companyId: response.companyId,
),
```

Mapping hanya boleh dilakukan setelah response authoritative tervalidasi.

## 11. Validation Rules
Client/application layer wajib menolak response apabila:
- `tenant_id` kosong/null.
- `company_id` kosong/null.
- authenticated identity context tidak valid.
- response tidak berasal dari authoritative source.

Invalid response tidak boleh menghasilkan authenticated SessionContext.

## 12. Error Contract
Logical error categories minimal:
- `UNAUTHENTICATED` — authentication tidak tersedia/valid.
- `UNAUTHORIZED` — identity tidak memiliki effective tenant access.
- `TENANT_ACCESS_NOT_FOUND` — tidak ditemukan tenant access efektif.
- `INVALID_ACCESS_CONTEXT` — access context tidak valid.
- `SERVICE_UNAVAILABLE` — authoritative service tidak tersedia.
- `TIMEOUT` — authoritative service melewati timeout contract.

Concrete HTTP status mapping tetap **TBD — Provider / Integration Architecture** dan tidak boleh ditebak oleh client.

## 13. Timeout
Timeout value: **TBD — Provider / Integration Architecture**.
Client wajib memiliki bounded timeout dan tidak boleh menunggu service tanpa batas.

## 14. Retry Policy
Retry policy: **TBD — Provider / Integration Architecture**.
Retry tidak boleh mengubah authorization decision atau menyebabkan tenant switching.

## 15. Idempotency
Operation ini bersifat read/resolve dan tidak boleh menghasilkan mutation pada tenant access. Idempotency key tidak diwajibkan untuk logical read operation. Jika transport implementation menambahkan mutation, contract harus direview ulang.

## 16. Observability
Request harus dapat dikorelasikan dengan minimum:
- correlation/request reference
- authenticated identity reference
- tenant context setelah resolution
- result
- failure reason bila gagal

Sensitive credential/token tidak boleh ditulis ke log.

## 17. Security
- Tenant isolation enforced oleh backend/Identity & Access Platform.
- Client TenantContext bukan security boundary.
- Tidak ada direct Flutter access ke tabel `users` atau `companies`.
- Tidak ada tenant derivation dari user ID, email, role, UI, Jamaah, Customer, Booking atau Finance.
- Tidak ada hardcoded tenant/company.

## 18. Data Minimization
Response hanya menyediakan identity/access information yang diperlukan oleh consumer contract. Data identity tambahan tidak boleh ditambahkan tanpa contract review.

## 19. Deprecation Policy
Breaking change terhadap response/schema/semantics wajib melalui formal contract governance. Contract tidak boleh diubah secara breaking tanpa versioning dan approval.

## 20. Dependency Rule
Contract hanya mengatur boundary Authentication → Identity & Access → Effective Tenant Access → TenantContext. Business domains tidak menjadi source tenant resolution.

## 21. Implementation Gate
Adapter `TenantContextSource` baru boleh dibuat setelah:
1. Concrete transport binding tersedia.
2. Endpoint/service resmi dipublikasikan.
3. Authentication mechanism tersedia.
4. Response schema authoritative tersedia.
5. Error/status mapping tersedia.
6. Timeout dan retry policy tersedia.
7. Contract integration disetujui provider.

## 22. Acceptance Criteria
- Tidak ada tenant derivation di client.
- Tidak ada hardcoded tenant/company.
- Tidak ada direct database access untuk tenant resolution.
- TenantContext berasal dari authoritative SP-203 runtime.
- Request tidak menjadikan client-supplied tenant/company sebagai authority.
- Invalid/missing access context tidak menghasilkan authenticated session.
- Jamaah, Booking, Finance, Router dan UI tidak diubah.
- Targeted validation, `flutter analyze`, `flutter test`, dan `git diff --check` wajib GREEN sebelum adapter implementation approval.

## 23. Governance
Contract ini merupakan governed API contract prerequisite untuk authoritative TenantContext adapter. Concrete transport binding yang masih TBD harus diselesaikan oleh Provider / Integration Architecture sebelum coding adapter.

**APPROVED / LOCKED**