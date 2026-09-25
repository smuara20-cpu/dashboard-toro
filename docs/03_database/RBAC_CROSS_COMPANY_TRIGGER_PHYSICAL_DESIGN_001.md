# RBAC Cross-Company Trigger Physical Design 001

Decision ID: RBAC-CROSS-COMPANY-TRIGGER-PHYSICAL-DESIGN-001
Version: 1.0
Status: APPROVED / LOCKED
Domain: RBAC
Authority: RBAC Cross-Company Integrity Decision 001

---

## 1. Purpose

This decision defines the PostgreSQL physical trigger design for enforcing the approved RBAC cross-company integrity invariants.

---

## 2. Approved Invariants

### User Role

    user_roles.company_id
        = users.company_id
        = roles.company_id

### Role Permission

    role_permissions.company_id
        = roles.company_id
        = permissions.company_id

---

## 3. Physical Enforcement

PostgreSQL constraint triggers are the authoritative database enforcement mechanism.

Constraint-trigger enforcement MUST reject an invalid cross-company relationship at the PostgreSQL transaction boundary.

Application validation is not authoritative.

---

## 4. Trigger Function Responsibilities

### User Role Relationship

A dedicated trigger function MUST validate that the referenced User and Role belong to the same company_id as the user_roles row.

Function naming convention:

    fn_user_roles_validate_company_integrity

### Role Permission Relationship

A dedicated trigger function MUST validate that the referenced Role and Permission belong to the same company_id as the role_permissions row.

Function naming convention:

    fn_role_permissions_validate_company_integrity

### Parent Ownership Changes

Parent company ownership changes MUST NOT leave an active RBAC relationship in an invalid cross-company state.

Validation functions MUST therefore cover relevant company_id changes on:

- users
- roles
- permissions

Exact trigger object definitions are implementation artifacts and MUST conform to this design.

---

## 5. Constraint Trigger Scope

Constraint triggers MUST cover:

- INSERT on user_roles;
- UPDATE of user_roles.company_id;
- UPDATE of user_roles.user_id;
- UPDATE of user_roles.role_id;
- INSERT on role_permissions;
- UPDATE of role_permissions.company_id;
- UPDATE of role_permissions.role_id;
- UPDATE of role_permissions.permission_id;
- UPDATE of users.company_id;
- UPDATE of roles.company_id;
- UPDATE of permissions.company_id.

Triggers MUST operate only within the approved RBAC physical contract.

---

## 6. Soft Delete Boundary

Active relationships are those where deleted_at IS NULL.

Soft-deleted relationship rows MUST NOT be treated as active RBAC relationships for cross-company integrity validation.

The implementation MUST NOT hard-delete data as part of integrity enforcement.

---

## 7. Transaction Boundary

Constraint-trigger enforcement MUST execute within PostgreSQL transaction semantics.

An invalid final transaction state MUST NOT be committed.

No application-only or UI-only enforcement is permitted.

---

## 8. Physical Object Naming

Functions use:

    fn_

Triggers use:

    tr_

Migration files use the repository YYYYMMDD_HHMM_description.sql convention.

Function and trigger objects MUST be placed under the repository SQL functions/ and triggers/ directories.

---

## 9. Physical Contract Protection

This design MUST NOT alter:

- users.user_id primary key;
- roles.id primary key;
- permissions.id primary key;
- existing company_id foreign keys;
- approved RBAC columns;
- approved RBAC unique constraints;
- tenant authority;
- SP-203 authority.

No composite unique key is introduced solely to support this trigger design.

---

## 10. Migration Requirements

The implementation MUST provide:

- forward migration;
- rollback migration;
- pre-existing data validation;
- trigger function creation;
- constraint trigger creation;
- PostgreSQL validation;
- invalid cross-company test cases;
- valid same-company test cases;
- UPDATE ownership test cases;
- rollback validation.

Migration MUST NOT silently repair invalid existing data.

---

## 11. SQL Implementation Boundary

This document is the physical design authority.

Executable PostgreSQL SQL MUST be created only after this design artifact is validated.

Exact SQL syntax, trigger timing, trigger deferral configuration, object names, and rollback statements MUST be validated during migration implementation.

---

## 12. Governance Status

Decision: APPROVED
Status: LOCKED
Implementation Gate: OPEN
PostgreSQL Implementation: READY AFTER ARTIFACT VALIDATION

---

## 13. Approval Record

Approved by project owner:
Physical Trigger Design 001 explicitly approved.

Decision is locked as the governing physical design for RBAC cross-company PostgreSQL enforcement.
