# RBAC PHYSICAL AUTHORITY RECONCILIATION DECISION 001

Version : 1.0
Status : APPROVED / LOCKED
Domain : Core / Identity & Access
Decision ID : RBAC-PHYSICAL-AUTHORITY-RECONCILIATION-001

---

## 1. Purpose

Dokumen ini menetapkan hasil rekonsiliasi Physical Authority untuk:

- Role
- Permission
- User Role
- Role Permission

Decision ini menjadi governance boundary sebelum Physical Data Dictionary,
PostgreSQL migration, Supabase implementation, dan runtime Identity & Access
implementation dilakukan.

---

## 2. Evidence Reviewed

Business contract yang telah direkonsiliasi:

- business_rules/core/role.md
- business_rules/core/role_business_rules.md
- business_rules/core/permission.md
- business_rules/core/permission_business_rules.md
- business_rules/core/user_role.md
- business_rules/core/user_role_business_rules.md
- business_rules/core/role_permission.md
- business_rules/core/role_permission_business_rules.md

Physical Data Dictionary evidence:

- data_dictionary/core/role.md = 15 bytes, berisi dangling reference
- data_dictionary/core/permission.md = empty
- data_dictionary/core/user_role.md = empty
- data_dictionary/core/role_permission.md = empty

Business Rules tidak diperlakukan sebagai physical PostgreSQL schema.

---

## 3. Approved RBAC Contract

Model konseptual yang telah disetujui:

User
  |
  +-- User Role
          |
          +-- Role
                |
                +-- Role Permission
                          |
                          +-- Permission

Company merupakan business/data-owner boundary.

RBAC tidak mengubah definisi Tenant pada SP-203.

---

## 4. Role

Role merupakan master data job function.

Approved business contract:

- Role dimiliki oleh Company.
- Role memiliki code dan name.
- Role dapat digunakan oleh banyak User.
- Role memiliki Permission melalui Role Permission.
- Role tidak memberikan authorization secara langsung.
- Role dapat dinonaktifkan.
- Perubahan Role harus diaudit.
- Role yang masih digunakan tidak boleh dihapus secara sembarangan.

Approved uniqueness:

(company_id, code)

Physical table name, physical PK name, status mapping, cascade behavior,
dan additional indexes belum ditetapkan.

---

## 5. Permission

Permission menentukan Resource + Action.

Approved business contract:

- Permission dimiliki oleh Company.
- Permission memiliki code.
- Permission memiliki resource.
- Permission memiliki action.
- Permission memiliki module.
- Permission diberikan kepada Role melalui Role Permission.
- Permission tidak diberikan langsung kepada User.
- Permission dapat dinonaktifkan.
- Perubahan harus diaudit.

Approved uniqueness:

(company_id, code)

Physical table name, physical PK name, status mapping, cascade behavior,
dan additional indexes belum ditetapkan.

---

## 6. User Role

User Role merupakan relationship antara User dan Role.

Approved attributes:

- company_id
- user_id
- role_id
- is_default
- is_active
- audit fields
- soft delete

Approved uniqueness:

(company_id, user_id, role_id)

Approved business rules:

- User minimal memiliki satu active Role.
- User dapat memiliki banyak Role.
- User maksimal memiliki satu active Default Role.
- Active Role harus dimiliki User dan aktif.
- Role inactive/suspended/deleted tidak dapat menjadi Active Role.
- Perubahan Active Role harus direvalidasi terhadap Permission.
- Perubahan Role harus diaudit.
- Setiap Session memiliki tepat satu Active Role.

Cross-record/session enforcement tidak ditetapkan sebagai PostgreSQL
constraint pada decision ini.

---

## 7. Role Permission

Role Permission merupakan relationship antara Role dan Permission.

Approved attributes:

- company_id
- role_id
- permission_id
- is_active
- audit fields
- soft delete

Approved uniqueness:

(company_id, role_id, permission_id)

Approved business rules:

- Role dapat memiliki banyak Permission.
- Permission dapat dimiliki banyak Role.
- Duplicate relationship tidak diperbolehkan.
- Relationship dapat dinonaktifkan.
- Perubahan segera mempengaruhi access.
- Perubahan harus diaudit.

---

## 8. Company Boundary

Company Physical Authority telah APPROVED / LOCKED:

companies
  |
  +-- company_id UUID PRIMARY KEY

RBAC entity yang memiliki company_id mengikuti Company Physical Authority.

Company bukan Tenant.

Decision ini tidak menyamakan:

tenant_id dengan company_id

Tenant tetap merupakan canonical tenancy boundary SP-203.

---

## 9. Tenant Boundary

Decision ini TIDAK menetapkan:

- tenant table name
- tenant primary key
- tenant status
- tenant membership table
- tenant-to-company physical FK
- tenant RLS implementation
- tenant provisioning mechanism

Tenant Physical Authority merupakan separate governance decision.

---

## 10. Physical Authority Status

Role              = NOT ESTABLISHED
Permission        = NOT ESTABLISHED
User Role         = NOT ESTABLISHED
Role Permission   = NOT ESTABLISHED

Business contracts menjadi input physical finalization,
bukan physical schema.

---

## 11. Prohibited Assumptions

Sebelum Physical Contract Finalization, implementation tidak boleh
mengasumsikan:

- table name
- primary key name
- UUID generation mechanism
- numeric status mapping
- enum values
- cascade behavior
- RLS policy
- tenant foreign key
- authentication token format
- SP-203 HTTP endpoint
- SP-203 HTTP method
- SP-203 gateway
- timeout
- retry policy
- authorization transport
- direct Flutter database authorization

Tidak boleh membuat mock production provider sebagai pengganti
authoritative Identity & Access provider.

---

## 12. Migration Gate

PostgreSQL RBAC migration:

BLOCKED

Migration hanya boleh dimulai setelah physical contract masing-masing
entity memperoleh authority eksplisit.

---

## 13. Supabase Gate

Supabase VENTRA-DEV adalah implementation target yang telah dipilih
untuk provider SP-203.

Implementasi tetap menunggu:

1. RBAC physical contract
2. Tenant physical authority
3. RLS / tenant isolation decision
4. Concrete SP-203 runtime transport decision

Supabase Auth tidak dianggap sebagai pengganti Effective Tenant Access
SP-203.

---

## 14. Flutter Gate

TenantContextSource tidak boleh memperoleh tenant dari:

- UserEntity.id
- email
- role
- UI
- app configuration
- Company
- Jamaah
- Customer
- Booking
- Finance
- direct database query

Runtime flow:

Authentication
    |
    v
SP-203 Identity & Access Runtime
    |
    v
Effective Tenant Access
    |
    +-- user_id
    +-- tenant_id
    +-- company_id
    |
    v
TenantContext
    |
    v
SessionContext

---

## 15. Reconciliation Result

Company Physical Authority        GREEN
Branch Physical Authority         GREEN
User Physical Authority           GREEN

Role Business Contract             GREEN
Permission Business Contract       GREEN
User Role Business Contract        GREEN
Role Permission Business Contract  GREEN

Role Physical Authority            HOLD
Permission Physical Authority      HOLD
User Role Physical Authority       HOLD
Role Permission Physical Authority HOLD

Tenant Physical Authority          HOLD
PostgreSQL RBAC Migration          HOLD
Supabase RBAC Implementation       HOLD
Flutter SP-203 Adapter             HOLD

---

## 16. Decision

RBAC Physical Authority Reconciliation 001:

APPROVED
LOCKED

Next governance step:

RBAC PHYSICAL CONTRACT FINALIZATION

Decision ini tidak mengotorisasi PostgreSQL migration atau runtime
implementation.

---

## 17. Governance Principle

Evidence -> Decision -> Physical Contract -> Validation
-> Approval -> Migration -> Runtime Implementation

No schema or runtime authority may be inferred from missing evidence.

---

## 18. Change Control

Perubahan terhadap decision ini membutuhkan:

1. New evidence
2. New reconciliation
3. New decision ID/version
4. Architecture review
5. Explicit approval
6. New commit checkpoint
