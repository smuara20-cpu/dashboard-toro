# RBAC MIGRATION DESIGN 001

Version : 1.0
Status : APPROVED / DESIGN BASELINE
Domain : Core / Identity & Access
Decision ID : RBAC-MIGRATION-DESIGN-001
Physical Contract : RBAC-PHYSICAL-CONTRACT-001

---

# 1. Purpose

Dokumen ini menetapkan Migration Design untuk Physical Contract RBAC:
- roles
- permissions
- user_roles
- role_permissions

Migration Design ini diturunkan dari:
- RBAC Physical Authority Reconciliation Decision 001
- RBAC Physical Contract Decision 001
- Company Physical Authority Reconciliation 001
- User Physical Authority yang telah disetujui

Dokumen ini adalah desain migrasi.
Dokumen ini belum mengeksekusi PostgreSQL migration.

---

# 2. Migration Scope

Migration scope hanya mencakup:

| Entity | Physical Table |
|---|---|
| Role | roles |
| Permission | permissions |
| User Role | user_roles |
| Role Permission | role_permissions |

Tidak termasuk:
- tenants
- tenant memberships
- tenant RLS
- SP-203 transport
- authentication transport
- Flutter adapter
- Supabase Auth schema modification
- Company migration
- User migration

---

# 3. Physical Authority

## 3.1 Company

Canonical physical authority:

    companies.company_id UUID PRIMARY KEY

RBAC company_id wajib mereferensikan:

    companies.company_id

Company bukan Tenant.

    tenant_id != company_id

Tenant physical authority tetap HOLD.

## 3.2 User

Canonical physical authority:

    users.user_id UUID

RBAC user_roles.user_id wajib mereferensikan:

    users.user_id

Migration RBAC tidak membuat atau mengubah tabel users.

## 3.3 Role

    roles.id UUID PRIMARY KEY

## 3.4 Permission

    permissions.id UUID PRIMARY KEY

## 3.5 Relationship

    user_roles.id UUID PRIMARY KEY
    role_permissions.id UUID PRIMARY KEY

---

# 4. Migration Dependency Order

Dependency order:

    companies
       |
       +----> roles
       |       |
       |       +----> user_roles
       |
       +----> permissions
               |
               +----> role_permissions

Migration execution order:

1. Verify Company physical authority exists.
2. Verify User physical authority exists.
3. Create oles.
4. Create permissions.
5. Create user_roles.
6. Create ole_permissions.
7. Create required indexes and constraints.
8. Execute structural validation.
9. Execute relationship integrity validation.
10. Execute rollback validation.

No RBAC migration may execute against an environment where the required Company/User physical authorities are absent or incompatible.

---

# 5. UUID Generation Strategy

RBAC primary keys use UUID:

- roles.id
- permissions.id
- user_roles.id
- role_permissions.id

UUID generation must be PostgreSQL-compatible and deterministic at schema level.

Migration design permits a database-side UUID generation strategy.

However, this document does not invent or mandate a specific PostgreSQL extension/function until the existing project database standard confirms the approved UUID generation mechanism.

Required validation before SQL finalization:
- approved UUID function/extension
- compatibility with target PostgreSQL version
- compatibility with existing project migrations
- no conflict with existing UUID authority

UUID generation strategy = VALIDATION REQUIRED before SQL execution.

---

# 6. Primary Key Strategy

All RBAC tables use their physical contract primary key:

| Table | Primary Key |
|---|---|
| roles | id |
| permissions | id |
| user_roles | id |
| role_permissions | id |

Primary keys are UUID and NOT NULL.

No alternate primary key is introduced.

---

# 7. Foreign Key Strategy

## 7.1 roles

    roles.company_id
    -> companies.company_id

## 7.2 permissions

    permissions.company_id
    -> companies.company_id

## 7.3 user_roles

    user_roles.company_id
    -> companies.company_id

    user_roles.user_id
    -> users.user_id

    user_roles.role_id
    -> roles.id

## 7.4 role_permissions

    role_permissions.company_id
    -> companies.company_id

    role_permissions.role_id
    -> roles.id

    role_permissions.permission_id
    -> permissions.id

FK delete/update behavior is intentionally not invented by this design.

Required validation:
- approved project FK behavior
- parent deletion behavior
- soft-delete compatibility
- migration rollback behavior

No ON DELETE CASCADE or ON DELETE SET NULL is authorized by the physical contract.

---

# 8. Cross-Company Relationship Integrity

company_id exists on RBAC relationship tables.

The following business invariant must hold:

- user_roles.company_id must correspond to the company ownership of the referenced User and Role.
- role_permissions.company_id must correspond to the company ownership of the referenced Role and Permission.

The existing physical contract does not authorize a specific enforcement mechanism.

Therefore this design does NOT invent:
- composite foreign keys
- triggers
- functions
- generated predicates
- application-only enforcement

Cross-company integrity is a mandatory migration validation gate.

An implementation mechanism may only be selected after evidence from the existing PostgreSQL/database standard and explicit design approval.

---

# 9. Unique Constraints

Approved physical uniqueness:

roles:
    (company_id, code)

permissions:
    (company_id, code)

user_roles:
    (company_id, user_id, role_id)

role_permissions:
    (company_id, role_id, permission_id)

These uniqueness rules are part of the approved Physical Contract.

Soft-delete interaction must be validated before deciding whether uniqueness is implemented as a normal UNIQUE constraint or another approved PostgreSQL mechanism.

No partial unique index is invented at this stage.

---

# 10. Index Strategy

Required logical index coverage:

## roles
- company_id
- code
- name
- status

## permissions
- company_id
- code
- resource
- module
- status

## user_roles
- company_id
- user_id
- role_id

## role_permissions
- company_id
- role_id
- permission_id

Primary-key and unique-constraint indexes generated by PostgreSQL must not be duplicated unnecessarily.

Final SQL index definitions must be reviewed for redundancy against PK/UNIQUE indexes.

---

# 11. Constraint Naming

All explicitly created constraints must use stable, deterministic names.

Naming must distinguish:
- primary key
- foreign key
- unique constraint
- check constraint, if later authorized

Constraint naming must follow the repository database naming standard.

Example naming pattern is descriptive only and is NOT yet an authoritative final name:

    pk_<table>
    fk_<table>_<column>_<parent>
    uq_<table>_<business_key>

Exact naming must be validated against the existing project standard before SQL migration is created.

---

# 12. Base Entity / Audit Boundary

RBAC business contracts state that entities follow Base Entity audit conventions.

The Physical Contract explicitly authorizes:

    deleted_at TIMESTAMP NULL

This Migration Design does not invent additional audit columns.

Therefore this document does not independently add:
- created_at
- created_by
- updated_at
- updated_by
- deleted_by

unless the authoritative Base Entity physical contract confirms those columns for these tables.

Required validation:
- Base Entity physical audit contract
- timestamp type
- timestamp timezone convention
- audit actor type
- default strategy

---

# 13. Soft Delete Boundary

All four RBAC tables include:

    deleted_at TIMESTAMP NULL

Soft delete is the approved lifecycle boundary.

The migration must not introduce:
- hard delete workflow
- ON DELETE CASCADE
- ON DELETE SET NULL
- automatic physical purge

Interaction between soft delete and UNIQUE constraints must be validated before final SQL.

---

# 14. Status Boundary

Approved business defaults:

    status SMALLINT DEFAULT 1
    is_active BOOLEAN DEFAULT TRUE

This migration design does not establish numeric status mappings.

No enum is introduced.

No CHECK constraint mapping numeric values to business meanings is introduced unless separately authorized.

---

# 15. Default Role Rule

Business rule:

One User may have only one active Default Role.

The RBAC Physical Contract explicitly states that this rule is NOT established as a PostgreSQL constraint by that decision.

Therefore this Migration Design does not invent:
- partial unique index
- trigger
- function
- deferred constraint

Enforcement remains a separate validation/design decision.

---

# 16. Migration Naming

Repository migration naming convention:

    YYYYMMDD_HHMM_description.sql

RBAC migration must follow this convention.

Migration naming must be unique within the migration directory.

Final migration filename is intentionally deferred until SQL creation.

---

# 17. Migration Atomicity

RBAC migration should be designed so that schema creation either completes as a coherent unit or fails without leaving an invalid partial RBAC structure.

Final PostgreSQL transaction strategy must be validated against the project migration standard.

Migration must not silently modify existing business data.

Migration must not silently modify Company or User records.

---

# 18. Rollback Strategy

Rollback must be explicit and auditable.

Rollback scope:
- remove RBAC objects created by this migration
- restore schema state that existed immediately before the migration

Rollback must not:
- delete unrelated Company data
- delete unrelated User data
- modify SP-203 data
- modify Supabase Auth users
- modify tenant state
- bypass audit requirements

Rollback SQL must be reviewed together with forward migration SQL.

No destructive rollback may be executed against production without explicit approval.

---

# 19. PostgreSQL Compatibility

Before migration execution, validate:
- PostgreSQL UUID support
- UUID generation mechanism
- UUID primary keys
- VARCHAR lengths
- SMALLINT
- BOOLEAN
- TIMESTAMP convention
- FK behavior
- UNIQUE behavior
- index behavior
- soft-delete compatibility
- constraint naming
- transaction behavior

Target Supabase VENTRA-DEV is PostgreSQL-based.

Supabase-specific implementation must remain compatible with the approved physical contract.

---

# 20. Supabase VENTRA-DEV Boundary

Supabase VENTRA-DEV is the approved implementation target.

Migration may create application RBAC tables in the approved application schema.

However:
- Supabase Auth is not SP-203 Effective Tenant Access.
- auth.users is not automatically the ERP users authority.
- Supabase database roles are not automatically application RBAC roles.
- Supabase Auth metadata is not automatically TenantContext.

No mapping is authorized without explicit physical/provider evidence.

---

# 21. RLS Boundary

RLS is NOT established by this Migration Design.

This document does not define:
- tenant_id
- tenant predicate
- RLS policy
- JWT claim
- auth.uid() mapping
- company isolation predicate

RLS requires a separate physical/security authority decision.

---

# 22. SP-203 Boundary

RBAC tables are application persistence structures.

They do not replace the SP-203 Identity & Access authority.

Runtime remains:

    Authentication
        -> SP-203
        -> Effective Tenant Access
        -> TenantContext
        -> SessionContext

SP-203 transport remains independently governed.

This migration does not establish:
- API endpoint
- HTTP method
- token format
- authentication transport
- authorization endpoint
- TenantContext provider

---

# 23. Migration Validation Matrix

| Validation | Required Result |
|---|---|
| Company physical authority | GREEN |
| User physical authority | GREEN |
| RBAC physical contract | APPROVED / LOCKED |
| Base Entity physical audit contract | VALIDATED |
| UUID strategy | VALIDATED |
| FK behavior | VALIDATED |
| Unique strategy | VALIDATED |
| Index strategy | VALIDATED |
| Constraint naming | VALIDATED |
| Migration ordering | VALIDATED |
| Rollback | VALIDATED |
| PostgreSQL compatibility | VALIDATED |
| Cross-company integrity | VALIDATED |
| Default role enforcement | SEPARATE DECISION / NOT INVENTED |
| Tenant physical authority | HOLD |
| Tenant RLS authority | HOLD |
| SP-203 transport | HOLD |

---

# 24. Pre-SQL Gate

SQL migration may only be created after the following are explicitly validated:

1. Base Entity physical audit contract.
2. UUID generation strategy.
3. FK delete/update behavior.
4. Unique + soft-delete interaction.
5. Index redundancy.
6. Constraint naming standard.
7. Migration transaction standard.
8. Rollback design.
9. PostgreSQL/Supabase compatibility.
10. Cross-company relationship integrity mechanism.

Until all required items are validated, PostgreSQL migration remains DESIGN-READY but NOT EXECUTED.

---

# 25. Approval State

RBAC Physical Contract = APPROVED / LOCKED
RBAC Migration Design = APPROVED / DESIGN BASELINE
PostgreSQL Migration = NOT YET EXECUTED
Supabase VENTRA-DEV Migration = NOT YET EXECUTED
Flutter RBAC Runtime = NOT YET IMPLEMENTED
SP-203 TenantContext Adapter = HOLD

---

# 26. Governance Principle

Evidence
-> Decision
-> Physical Contract
-> Migration Design
-> Validation
-> SQL Migration
-> PostgreSQL Validation
-> Approval
-> Runtime Implementation
-> Commit / Push

---

# 27. Change Control

Perubahan terhadap Migration Design membutuhkan:
- evidence baru
- reconciliation jika authority berubah
- decision ID/version baru bila physical contract berubah
- architecture review
- explicit approval
- migration impact review
- commit checkpoint baru

---

# 28. Decision

RBAC MIGRATION DESIGN 001

APPROVED / DESIGN BASELINE

Dokumen ini mengizinkan penyusunan SQL migration setelah seluruh Pre-SQL Gate tervalidasi.

Dokumen ini tidak mengubah:
- Company Physical Authority
- User Physical Authority
- RBAC Physical Contract
- Tenant Physical Authority
- SP-203 Runtime Contract
- SP-203 Transport Decision
- RLS/Tenant Isolation Decision

END OF DECISION
