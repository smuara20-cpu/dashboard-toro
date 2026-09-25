# RBAC Cross-Company Integrity Decision 001

Decision ID: RBAC-CROSS-COMPANY-INTEGRITY-DECISION-001
Version: 1.0
Status: APPROVED / LOCKED
Domain: RBAC
Authority: RBAC Physical Contract + RBAC Migration Design

---

## 1. Purpose

This decision establishes the physical enforcement mechanism for cross-company relationship integrity within the RBAC domain.

---

## 2. Approved Invariants

The following invariants MUST hold:

### User Role

    user_roles.company_id
        ↔ users.company_id
        ↔ roles.company_id

The company_id stored on an active user_roles relationship MUST correspond to the company ownership of the referenced User and Role.

### Role Permission

    role_permissions.company_id
        ↔ roles.company_id
        ↔ permissions.company_id

The company_id stored on an active role_permissions relationship MUST correspond to the company ownership of the referenced Role and Permission.

---

## 3. Approved Enforcement Mechanism

PostgreSQL constraint trigger is APPROVED as the physical enforcement mechanism.

The constraint-trigger implementation MAY use PostgreSQL trigger functions as its implementation support mechanism.

The enforcement MUST execute inside the PostgreSQL transaction and MUST reject a transaction that creates or leaves an invalid cross-company RBAC relationship.

---

## 4. Enforcement Scope

Enforcement applies to:

- INSERT on user_roles.
- UPDATE of user_roles.company_id, user_roles.user_id, or user_roles.role_id.
- INSERT on role_permissions.
- UPDATE of role_permissions.company_id, role_permissions.role_id, or role_permissions.permission_id.
- UPDATE of users.company_id when referenced by user_roles.
- UPDATE of roles.company_id when referenced by user_roles or role_permissions.
- UPDATE of permissions.company_id when referenced by role_permissions.

Soft-deleted relationship rows MUST NOT be treated as active RBAC relationships for the purpose of this invariant.

---

## 5. Physical Contract Boundary

This decision does NOT authorize alteration of the existing primary keys or approved physical column contracts.

Specifically, this decision does NOT add:

- composite primary keys;
- composite unique constraints to users;
- composite unique constraints to roles;
- composite unique constraints to permissions;
- tenant tables;
- tenant foreign keys;
- organization tables;
- additional business columns;
- CASCADE delete behavior;
- SET NULL delete behavior.

Existing company_id foreign keys remain governed by the approved RBAC Physical Contract.

---

## 6. Transaction and Failure Behavior

Cross-company violations MUST fail at the PostgreSQL database boundary.

The violation MUST prevent the affected transaction from being committed.

No application-only validation is accepted as the authoritative enforcement mechanism.

---

## 7. Tenant / SP-203 Boundary

This decision does NOT define or implement tenant authority.

Tenant identity, effective tenant access, tenant membership, tenant provisioning, and tenant isolation remain governed by SP-203 and the approved TenantContext architecture.

The company_id integrity mechanism MUST NOT be used as a substitute for SP-203 effective tenant access.

---

## 8. Migration Requirements

Implementation MUST:

- use PostgreSQL-compatible trigger functions;
- use PostgreSQL constraint triggers;
- follow the repository SQL naming convention;
- execute within PostgreSQL transaction boundaries;
- provide forward migration;
- provide rollback migration;
- validate existing data before enabling enforcement;
- fail validation if existing cross-company relationships violate the invariant;
- avoid destructive data correction during migration.

Exact trigger/function names and SQL statements are implementation details and MUST be validated during migration design before execution.

---

## 9. Validation Requirements

Before implementation is promoted:

1. Validate that no existing active user_roles row violates User/Role company ownership.
2. Validate that no existing active role_permissions row violates Role/Permission company ownership.
3. Validate INSERT enforcement.
4. Validate UPDATE enforcement.
5. Validate valid same-company relationships.
6. Validate invalid cross-company relationships are rejected.
7. Validate soft-deleted relationships according to the approved soft-delete boundary.
8. Validate rollback.
9. Run PostgreSQL migration validation.
10. Run Flutter regression and repository quality gates after application integration.

---

## 10. Explicitly Rejected Alternatives

The following are NOT selected as the authoritative enforcement mechanism:

- composite foreign keys;
- application-only enforcement;
- generated predicates;
- unapproved database functions without the approved constraint-trigger mechanism;
- UI validation;
- Flutter-side company matching;
- hardcoded company checks;
- tenant-derived company checks.

---

## 11. Governance Status

Decision: APPROVED
Status: LOCKED
Implementation Gate: OPEN
Gate 05.11: GREEN after this decision is committed as the governing decision artifact.

---

## 12. Approval Record

Approved by project owner:
PostgreSQL constraint trigger mechanism explicitly approved.

Decision is now LOCKED and may be used as the governing basis for RBAC migration implementation.
