# SP-203 TENANT PHYSICAL DESIGN DECISION 001

Document ID: SP203-TENANT-PHYSICAL-DECISION-001
Domain: Identity & Access / Tenant / Database
Authority: SP-203 Identity & Access Platform Enterprise Edition v2.0
Environment Target: VENTRA-DEV
Status: APPROVED / DECISION LOCKED
Decision Date: 2026-09-30

---

## 1. PURPOSE

Dokumen ini menetapkan physical design decision untuk Tenant Access implementation pada VENTRA-DEV sebagai implementation target dari SP-203 Identity & Access Platform Enterprise Edition v2.0.

Decision ini dibuat setelah:

1. SP-203 logical contract telah APPROVED / LOCKED.
2. AUTH_IDENTITY_ACCESS_RUNTIME_CONTRACT telah APPROVED / LOCKED.
3. AUTH_IDENTITY_ACCESS_API_CONTRACT_001 telah APPROVED / LOCKED.
4. AUTH_IDENTITY_ACCESS_RUNTIME_DECISION_001 telah APPROVED / LOCKED.
5. AUTH_IDENTITY_ACCESS_API_DECISION_001 telah APPROVED / LOCKED.
6. AUTH_IDENTITY_ACCESS_TRANSPORT_BLOCKER_001 telah APPROVED / LOCKED.
7. COMPANY_PHYSICAL_AUTHORITY_RECONCILIATION_001 telah APPROVED / LOCKED.
8. COMPANY FK reconciliation telah APPROVED / LOCKED.
9. Company physical migration telah executed pada VENTRA-DEV.
10. Company physical validation telah APPROVED / VALIDATED / LOCKED.
11. SP203_RUNTIME_PROVIDER_EVIDENCE_001 telah APPROVED / VALIDATED / LOCKED.
12. Existing runtime provider untuk Effective Tenant Access terbukti NOT AVAILABLE.

Decision ini mengunci physical boundary sebelum migration Tenant / Membership dibuat.

---

## 2. GOVERNANCE BASIS

SP-203 merupakan authority untuk:

- Identity
- Authentication
- Authorization
- Access Policy
- Session Security
- Credential Governance
- Role Governance
- Permission Governance
- Tenant Access Context
- Organization Access Context
- Identity Lifecycle
- Access Lifecycle
- Audit Correlation

Runtime boundary yang telah dikunci:

Flutter
    ->
Authentication
    ->
UserEntity
    ->
TenantContextSource
    ->
Authoritative Identity & Access Runtime
    ->
Effective Tenant Access
    ->
TenantContext
    ->
SessionContext

Physical implementation pada VENTRA-DEV harus menjadi implementation provider untuk boundary tersebut.

---

## 3. EVIDENCE BASIS

Physical evidence menunjukkan:

### Identity

Supabase Auth menyediakan:

auth.users.id UUID

Field tersebut merupakan authoritative authenticated user reference.

### Company

Canonical company physical authority:

public.companies

Primary key:

company_id UUID

Company physical schema:

APPROVED / VALIDATED / LOCKED

### Existing Tenant

Tidak tersedia.

### Existing Membership

Tidak tersedia.

### Existing Effective Tenant Access

Tidak tersedia.

### Existing Runtime Provider

Tidak tersedia.

### Existing Resolver Function

Tidak tersedia.

### Existing auth.users Custom Trigger

Tidak tersedia.

---

## 4. PRIMARY DESIGN DECISION

Decision:

Tenant merupakan physical access boundary yang berbeda dari Company.

Tenant tidak boleh disamakan secara physical identifier dengan Company.

Dengan demikian:

tenant_id != company_id

Secara relasional, baseline implementation menetapkan:

Tenant 1:1 Company

Artinya setiap Tenant implementation record memiliki satu canonical Company dan setiap Company yang menjadi tenant boundary memiliki paling banyak satu Tenant.

Relasi tersebut direpresentasikan melalui:

tenant.company_id
    ->
companies.company_id

company_id tetap menjadi business/master/data-owner authority.

tenant_id tetap menjadi tenant access boundary.

---

## 5. TENANT PHYSICAL AUTHORITY

Canonical Tenant table:

public.tenants

Canonical primary key:

tenant_id UUID

Tenant identifier tidak boleh berasal dari:

- auth.users.id
- email
- role
- raw_user_meta_data
- raw_app_meta_data
- UI state
- application configuration
- company_id value reuse

tenant_id harus merupakan independent tenant identifier.

---

## 6. TENANT TO COMPANY RELATIONSHIP

Canonical relationship:

public.tenants.company_id
    ->
public.companies.company_id

Relationship cardinality:

Tenant -> exactly one Company

Company -> zero or one Tenant

Physical uniqueness:

public.tenants.company_id MUST be UNIQUE.

Dengan decision ini, satu Company tidak dapat memiliki dua Tenant records.

Decision ini tidak mengubah canonical Company PK.

Tidak dibuat:

- duplicate company table
- tenant_company bridge table
- compatibility company table
- company_id alias sebagai tenant_id

---

## 7. TENANT LIFECYCLE BOUNDARY

Tenant lifecycle merupakan access-boundary lifecycle.

Tenant lifecycle tidak menggantikan Company lifecycle.

Company:

business/master/data-owner lifecycle

Tenant:

identity/access isolation lifecycle

Keduanya harus tetap dapat dibedakan secara governance.

Tenant record tidak boleh mengubah arti atau ownership public.companies.

---

## 8. TENANT MEMBERSHIP DESIGN

Canonical membership table:

public.tenant_memberships

Purpose:

Menghubungkan authenticated identity dengan Tenant Access.

Logical relationship:

auth.users.id
    ->
tenant_memberships.user_id

tenant_memberships.tenant_id
    ->
tenants.tenant_id

Membership menjadi physical source untuk menentukan apakah authenticated user memiliki access terhadap Tenant.

---

## 9. MEMBERSHIP CARDINALITY

Baseline cardinality:

One User -> One or More Tenant Memberships

One Tenant -> One or More User Memberships

Dengan demikian physical design tidak mengunci identity menjadi hanya satu Company sepanjang lifecycle.

Namun logical operation:

Resolve Effective Tenant Access

menghasilkan satu effective tenant context pada satu session resolution.

Selection of effective membership harus deterministic dan governed.

---

## 10. EFFECTIVE TENANT ACCESS

Effective Tenant Access bukan field yang ditambahkan ke auth.users.

Effective Tenant Access merupakan derived authoritative runtime result dari:

Authenticated Identity
    +
Validated Tenant Membership
    +
Tenant
    +
Company

Minimum runtime result:

user_id
tenant_id
company_id

Ketiga identifier tersebut harus berasal dari authoritative physical/runtime relationships.

Client tidak boleh mengirim tenant_id sebagai authoritative tenant identity pada login.

---

## 11. EFFECTIVE MEMBERSHIP BASELINE

Untuk baseline implementation, membership harus memiliki lifecycle state yang memungkinkan resolver membedakan membership yang dapat digunakan dan yang tidak dapat digunakan.

Approved baseline concept:

membership status

Active membership:

eligible for effective access resolution.

Non-active membership:

not eligible for effective access resolution.

Exact status vocabulary must be finalized in the migration/data dictionary before implementation if no existing authoritative vocabulary exists.

Tidak boleh membuat status vocabulary berbeda di application layer tanpa physical decision.

---

## 12. MULTI-TENANT RESOLUTION BOUNDARY

Physical model mengizinkan satu authenticated user memiliki lebih dari satu tenant membership.

Namun logical API contract saat ini hanya meminta:

authenticated_subject

dan success response menghasilkan:

user_id
tenant_id
company_id

Contract tersebut belum mendefinisikan explicit requested_tenant_id.

Karena itu implementation pertama tidak boleh memilih tenant secara arbitrary.

Effective tenant selection harus memiliki deterministic governed rule.

Sampai rule tersebut dikunci dalam runtime/provider decision, resolver tidak boleh:

- memilih tenant secara random
- memilih tenant berdasarkan insertion order
- memilih tenant berdasarkan company name
- memilih tenant berdasarkan email
- memilih tenant berdasarkan role
- memilih tenant berdasarkan UI state tanpa governed input

Jika effective tenant tidak dapat ditentukan secara authoritative dan unambiguous, resolution harus gagal daripada menghasilkan tenant yang salah.

---

## 13. ROLE AND PERMISSION BOUNDARY

Decision ini TIDAK membuat physical:

- roles table
- permissions table
- role_permissions table
- policy table

Reason:

SP-203 governance telah menetapkan Role Governance, Permission Governance, dan Policy Governance sebagai authority, tetapi source contract yang tersedia belum memberikan physical schema yang authoritative untuk entity tersebut.

Karena itu role/permission physical model tidak boleh diciptakan berdasarkan asumsi pada Tenant migration ini.

Tenant Membership hanya menjadi access relationship boundary.

---

## 14. AUTH.USERS BOUNDARY

Tidak ada perubahan pada auth.users.

Tidak menambahkan:

- tenant_id
- company_id
- membership_id
- effective_tenant_id

ke auth.users.

Identity remains owned by Supabase Auth.

Tenant Access remains owned by SP-203 implementation boundary.

---

## 15. COMPANY BOUNDARY

public.companies remains canonical Company authority.

Company primary key:

company_id UUID

Tenant relationship:

tenants.company_id
    ->
companies.company_id

Tidak boleh menggunakan:

tenant_id = company_id

Tidak boleh mengganti company_id menjadi tenant_id.

Tidak boleh membuat duplicate Company identity di Tenant layer.

---

## 16. PHYSICAL RELATIONSHIP MODEL

Approved logical physical relationship:

auth.users
    |
    | id
    v
tenant_memberships
    |
    | tenant_id
    v
tenants
    |
    | company_id
    v
companies

Canonical boundaries:

Identity:
auth.users

Tenant Access:
tenant_memberships + tenants

Business / Master:
companies

---

## 17. REFERENTIAL INTEGRITY

Required relationship decisions:

tenant.company_id
    ->
companies.company_id

tenant_memberships.user_id
    ->
auth.users.id

tenant_memberships.tenant_id
    ->
tenants.tenant_id

Foreign key implementation must use the actual physical PKs established by the target schemas.

No duplicate compatibility FK columns are permitted.

No inferred FK target is permitted.

---

## 18. DELETE / LIFECYCLE SAFETY

Tenant deletion must not silently delete Company business/master data.

Company deletion must not silently bypass Tenant Access governance.

Membership deletion/deactivation must not modify Identity ownership.

Physical FK delete behavior must therefore be selected conservatively during migration and validated against lifecycle requirements.

No CASCADE behavior may be introduced merely for implementation convenience without explicit physical decision.

---

## 19. SECURITY BOUNDARY

Tenant isolation is a security boundary.

Physical existence of tenant_id alone does not establish authorization.

The implementation must later establish:

- tenant isolation
- membership authorization
- authenticated identity binding
- RLS/security policy
- runtime access decision
- audit traceability

These are implementation stages following this decision.

No application code may treat a tenant_id from client state as authoritative.

---

## 20. RLS BOUNDARY

RLS is required for production tenant isolation.

However RLS policy implementation is NOT included in this Decision document.

RLS implementation must be derived from:

- actual physical tables
- actual membership relationship
- authenticated identity
- tenant boundary
- SP-203 security contract

RLS must be validated separately after migration.

---

## 21. PROHIBITED IMPLEMENTATION

The following are explicitly prohibited:

1. tenant_id = auth.users.id

2. tenant_id = company_id

3. tenant derived from email

4. tenant derived from role

5. tenant derived from UI

6. tenant derived from application configuration

7. tenant derived from Jamaah

8. tenant derived from Customer

9. tenant derived from Booking

10. direct Flutter database lookup replacing SP-203 runtime authority

11. fake tenant records

12. dummy membership records used as production authority

13. arbitrary tenant selection when multiple memberships exist

14. duplicate Company authority

15. duplicate Tenant authority

16. ungoverned role/permission schema

---

## 22. IMPLEMENTATION SCOPE

This Decision authorizes the following next physical implementation scope:

1. public.tenants

2. public.tenant_memberships

3. Required primary keys

4. Required foreign keys

5. Required uniqueness constraints

6. Required lifecycle columns only after physical dictionary confirmation

7. Required indexes

8. Required security prerequisites

9. Validation evidence

This Decision does NOT yet authorize:

- Flutter adapter implementation
- production deployment
- production RLS activation
- production tenant provisioning
- arbitrary tenant seed data
- role/permission physical implementation
- final runtime API transport binding
- external production provider declaration

---

## 23. MIGRATION GATE

Tenant migration may begin only against this approved physical decision.

Migration must explicitly document:

- exact columns
- exact data types
- nullability
- defaults
- primary keys
- foreign keys
- unique constraints
- indexes
- delete/update behavior
- trigger behavior
- routine dependency
- RLS/security boundary

No undocumented column may be added during migration.

No undocumented table may be added during migration.

---

## 24. VALIDATION GATE

After migration, physical validation must prove at minimum:

- exact table existence
- exact columns
- exact types
- exact nullability
- exact defaults
- primary keys
- foreign keys
- FK target correctness
- unique constraints
- indexes
- trigger safety
- routine dependency
- constraint validity
- existing data integrity
- RLS/security state

Validation result must be recorded in a separate validation artifact.

---

## 25. RUNTIME PROVIDER GATE

After physical implementation and validation, runtime provider implementation may proceed.

Runtime provider must resolve:

authenticated_subject
    ->
validated membership
    ->
effective tenant
    ->
company
    ->
user_id + tenant_id + company_id

Runtime provider must not derive TenantContext from client assumptions.

Concrete HTTP/transport binding remains governed separately by SP-203 transport decision.

---

## 26. CURRENT STATUS

SP-203 Architecture:

GREEN

SP-203 Logical Contract:

APPROVED / LOCKED

SP-203 Runtime Contract:

APPROVED / LOCKED

Existing Runtime Provider:

NOT AVAILABLE

Company Physical Authority:

APPROVED / VALIDATED / LOCKED

SP-203 Runtime Provider Evidence:

APPROVED / VALIDATED / LOCKED

Tenant Physical Design:

APPROVED / DECISION LOCKED

Tenant Migration:

NOT YET IMPLEMENTED

Tenant Physical Validation:

NOT YET IMPLEMENTED

RLS:

NOT YET IMPLEMENTED

Runtime Resolver:

NOT YET IMPLEMENTED

Flutter TenantContext Adapter:

NOT YET IMPLEMENTED

Production Authorization:

NOT AUTHORIZED

---

## 27. GOVERNANCE DECISION

Decision 001 APPROVED.

The VENTRA-DEV implementation target will establish a separate Tenant access boundary from Company.

Approved baseline:

Identity:
auth.users

Tenant:
public.tenants

Membership:
public.tenant_memberships

Company:
public.companies

Relationship:

auth.users.id
    ->
tenant_memberships.user_id

tenant_memberships.tenant_id
    ->
tenants.tenant_id

tenants.company_id
    ->
companies.company_id

Tenant and Company remain separate authorities.

Effective Tenant Access must be resolved authoritatively and deterministically.

No tenant identity may be guessed from identity attributes or client state.

---

## 28. NEXT GOVERNANCE STAGE

Next stage:

TENANT PHYSICAL MIGRATION

Required artifacts:

1. Tenant Physical Migration SQL
2. Tenant Physical Validation
3. Runtime Provider Decision
4. Runtime Provider Implementation
5. Runtime Provider Validation
6. Flutter TenantContext Adapter
7. Integration Validation

Each stage requires independent evidence and approval.

---

## 29. CHECKPOINT

SP-203 TENANT PHYSICAL DESIGN:

APPROVED / DECISION LOCKED

Migration authorization:

APPROVED FOR NEXT STAGE ONLY

Runtime provider:

NOT YET IMPLEMENTED

Production authorization:

NOT GRANTED