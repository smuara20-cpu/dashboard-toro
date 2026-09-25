# RBAC UNIQUE SOFT DELETE DECISION 001

## Decision Identity
- Decision ID: RBAC-UNIQUE-SOFT-DELETE-DECISION-001
- Domain: RBAC
- Scope: Roles, Permissions, User Roles, Role Permissions
- Authority: VENTRA Database Governance
- Status: APPROVED / LOCKED
- Gate: Gate 04
- Decision Date: 2026-09-25

## Decision
RBAC uniqueness applies only to active records.

Active record = deleted_at IS NULL.
Soft-deleted records do not occupy the active uniqueness namespace.

## Approved Unique Keys
- roles: (company_id, code)
- permissions: (company_id, code)
- user_roles: (company_id, user_id, role_id)
- role_permissions: (company_id, role_id, permission_id)

## Physical Implementation Decision
Use Partial Unique Index scoped to active records.

Conceptual form:
CREATE UNIQUE INDEX ... ON <table> (<approved_unique_columns>) WHERE deleted_at IS NULL;

Exact index names and final SQL remain subject to SQL migration validation.

## Lifecycle Rule
Soft-deleted RBAC records remain preserved.
After soft delete, the approved unique key may be reused by a new active record.

## Governance Boundary
This decision only resolves RBAC UNIQUE versus Soft Delete.
It does not authorize hard delete, destructive cascade, tenant changes, RLS, new tables, new columns, or new status values.

## Evidence Basis
1. RBAC physical contract defines the approved unique combinations.
2. RBAC entities use deleted_at as the soft-delete boundary.
3. RBAC business rules define uniqueness and non-duplication.
4. Existing Booking migration demonstrates an active-row partial unique index pattern.

Booking evidence is supporting implementation evidence only.
It is not the authority for the RBAC decision.

## Approval
Gate 04: APPROVED / LOCKED
Decision: ACTIVE-ROW UNIQUENESS
Next gate: Gate 05 - Migration SQL Readiness
