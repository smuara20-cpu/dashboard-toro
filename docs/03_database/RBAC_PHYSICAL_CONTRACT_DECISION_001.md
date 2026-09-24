# RBAC PHYSICAL CONTRACT DECISION 001

Version : 1.0
Status : APPROVED / LOCKED
Domain : Core / Identity & Access
Decision ID : RBAC-PHYSICAL-CONTRACT-001

---

# 1. Purpose

Dokumen ini menetapkan Physical Contract untuk:
- Role
- Permission
- User Role
- Role Permission

Decision ini berdasarkan RBAC Physical Authority Reconciliation Decision 001.

# 2. Physical Tables

| Business Entity | Physical Table |
|---|---|
| Role | roles |
| Permission | permissions |
| User Role | user_roles |
| Role Permission | role_permissions |

Primary key seluruh entity:

id UUID

# 3. Company Boundary

Company Physical Authority:

companies.company_id UUID PRIMARY KEY

RBAC company_id menggunakan FK ke companies.company_id.

Company bukan Tenant.

tenant_id != company_id

# 4. Role Physical Contract

Physical table: roles

Columns:

- id UUID NOT NULL PRIMARY KEY
- company_id UUID NOT NULL
- code VARCHAR(20) NOT NULL
- name VARCHAR(150) NOT NULL
- description TEXT NULL
- approval_level SMALLINT NULL
- is_system BOOLEAN NOT NULL DEFAULT FALSE
- status SMALLINT NOT NULL DEFAULT 1
- is_active BOOLEAN NOT NULL DEFAULT TRUE
- deleted_at TIMESTAMP NULL

FK:
company_id -> companies.company_id

Unique:
(company_id, code)

Indexes:
- company_id
- code
- name
- status

Audit mengikuti Base Entity.
Soft delete menggunakan deleted_at.

# 5. Permission Physical Contract

Physical table: permissions

Columns:

- id UUID NOT NULL PRIMARY KEY
- company_id UUID NOT NULL
- code VARCHAR(100) NOT NULL
- resource VARCHAR(100) NOT NULL
- action VARCHAR(50) NOT NULL
- module VARCHAR(100) NOT NULL
- description TEXT NULL
- is_system BOOLEAN NOT NULL DEFAULT FALSE
- status SMALLINT NOT NULL DEFAULT 1
- is_active BOOLEAN NOT NULL DEFAULT TRUE
- deleted_at TIMESTAMP NULL

FK:
company_id -> companies.company_id

Unique:
(company_id, code)

Indexes:
- company_id
- code
- resource
- module
- status

Audit mengikuti Base Entity.
Soft delete menggunakan deleted_at.

# 6. User Role Physical Contract

Physical table: user_roles

Columns:

- id UUID NOT NULL PRIMARY KEY
- company_id UUID NOT NULL
- user_id UUID NOT NULL
- role_id UUID NOT NULL
- is_default BOOLEAN NOT NULL DEFAULT FALSE
- is_active BOOLEAN NOT NULL DEFAULT TRUE
- deleted_at TIMESTAMP NULL

FK:
- company_id -> companies.company_id
- user_id -> users.user_id
- role_id -> roles.id

Unique:
(company_id, user_id, role_id)

Indexes:
- company_id
- user_id
- role_id

Audit mengikuti Base Entity.
Soft delete menggunakan deleted_at.

Business rule satu active Default Role tidak ditetapkan sebagai PostgreSQL constraint pada decision ini.

# 7. Role Permission Physical Contract

Physical table: role_permissions

Columns:

- id UUID NOT NULL PRIMARY KEY
- company_id UUID NOT NULL
- role_id UUID NOT NULL
- permission_id UUID NOT NULL
- is_active BOOLEAN NOT NULL DEFAULT TRUE
- deleted_at TIMESTAMP NULL

FK:
- company_id -> companies.company_id
- role_id -> roles.id
- permission_id -> permissions.id

Unique:
(company_id, role_id, permission_id)

Indexes:
- company_id
- role_id
- permission_id

Audit mengikuti Base Entity.
Soft delete menggunakan deleted_at.

# 8. Tenant Boundary

Decision ini TIDAK menetapkan:
- tenant table
- tenant primary key
- tenant membership
- tenant-company FK
- tenant RLS policy
- tenant provisioning

Effective tenant access tetap merupakan authority SP-203.

# 9. RLS Boundary

RLS belum ditetapkan oleh decision ini.

Tidak ada RLS policy atau tenant predicate yang diinvent.

# 10. Status Boundary

Business default dipertahankan:

status SMALLINT DEFAULT 1
is_active BOOLEAN DEFAULT TRUE

Numeric status mapping tidak ditetapkan.

# 11. Delete Boundary

Soft delete menggunakan deleted_at.

Decision ini tidak mengizinkan:
- ON DELETE CASCADE
- ON DELETE SET NULL
- hard delete behavior

# 12. Migration Gate

RBAC Physical Contract = APPROVED

PostgreSQL Migration = READY FOR MIGRATION DESIGN

Migration belum dieksekusi.

# 13. Supabase Gate

Supabase VENTRA-DEV merupakan implementation target.

Supabase Auth bukan pengganti SP-203 Effective Tenant Access.

# 14. Flutter Gate

RBAC tables tidak boleh menjadi sumber TenantContext.

Runtime tetap:

Authentication -> SP-203 -> Effective Tenant Access -> TenantContext -> SessionContext

# 15. Result

Role Physical Contract = APPROVED
Permission Physical Contract = APPROVED
User Role Physical Contract = APPROVED
Role Permission Physical Contract = APPROVED

Company FK Boundary = APPROVED
User FK Boundary = APPROVED

Tenant Physical Authority = HOLD
Tenant RLS Authority = HOLD
SP-203 Transport = HOLD

# 16. Next Governance Step

RBAC MIGRATION DESIGN & VALIDATION

Validation wajib mencakup:
- Base Entity physical audit contract
- UUID generation strategy
- FK behavior
- index strategy
- constraint naming
- migration ordering
- rollback strategy
- PostgreSQL compatibility
- Company/User physical authority compatibility

# 17. Decision

RBAC PHYSICAL CONTRACT DECISION 001

APPROVED
LOCKED

Decision ini menetapkan physical contract untuk Role, Permission, User Role, dan Role Permission.

Decision ini tidak mengubah Company Physical Authority, User Physical Authority, Tenant Physical Authority, SP-203 Runtime Contract, SP-203 Transport Decision, atau RLS/Tenant Isolation Decision.

# 18. Governance Principle

Evidence -> Decision -> Physical Contract -> Validation -> Approval -> Migration -> Runtime Implementation

# 19. Change Control

Perubahan membutuhkan evidence baru, reconciliation baru, decision ID/version baru, architecture review, explicit approval, dan commit checkpoint baru.
