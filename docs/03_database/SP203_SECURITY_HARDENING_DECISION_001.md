# SP-203 SECURITY HARDENING DECISION 001

## Project

VENTRA â€” IMPLEMENTATION & PRODUCTIZATION  
Codename: VENTRAL 10 DAYS

## Capability

SP-203 â€” Identity & Access Platform Enterprise Edition v2.0

## Document

SP-203 Security Hardening Decision 001

## Status

APPROVED / LOCKED FOR IMPLEMENTATION

## Purpose

Dokumen ini menetapkan keputusan security hardening untuk runtime provider
SP-203 `Resolve Effective Tenant Access` pada Supabase VENTRA-DEV.

Decision ini dibuat berdasarkan hasil security baseline audit aktual sebelum
implementasi Row Level Security (RLS).

---

# 1. Authority

SP-203 tetap menjadi logical authority untuk:

- Identity
- Authentication
- Authorization
- Access Policy
- Tenant Access Context
- Session Security
- Access Lifecycle

Supabase VENTRA-DEV merupakan implementation target untuk runtime provider
SP-203 dan bukan pengganti logical authority SP-203.

---

# 2. Current Runtime Provider

Runtime provider operation:

`resolve_effective_tenant_access()`

Provider boundary:

Supabase PostgreSQL RPC / Data API.

Current function characteristics:

- Function signature: `resolve_effective_tenant_access()`
- Security execution: `SECURITY INVOKER`
- Runtime search path: `public, auth`
- Arguments: none
- Return contract:
  - `user_id UUID`
  - `tenant_id UUID`
  - `company_id UUID`
- EXECUTE granted to `authenticated`
- EXECUTE available to `postgres`

The resolver derives effective tenant access from the authenticated
database identity and validated physical relationships.

---

# 3. Authoritative Relationship

The security boundary follows:

`auth.uid()`
â†’ `tenant_memberships`
â†’ `tenants`
â†’ `companies`

The client must not determine or submit:

- tenant_id
- company_id
- effective tenant
- membership identity

The resolver must not infer tenant access from:

- email
- role
- UI state
- application configuration
- hardcoded values
- Jamaah
- Customer
- Booking
- Finance
- UserEntity.id as tenant_id

---

# 4. Security Baseline Audit

Environment:

Supabase VENTRA-DEV

Audit was read-only and performed before RLS implementation.

## 4.1 RLS State

Current state:

| Table | RLS Enabled | RLS Forced |
|---|---:|---:|
| `companies` | false | false |
| `tenants` | false | false |
| `tenant_memberships` | false | false |

Conclusion:

RLS protection is not yet enabled on the SP-203 runtime tables.

---

# 5. Existing RLS Policies

Audit result:

No existing RLS policies were found for:

- `companies`
- `tenants`
- `tenant_memberships`

Conclusion:

Security hardening requires an explicit first RLS policy design.

---

# 6. Current Table Privileges

The baseline audit identified the following privileges.

## `companies`

`anon`:

- REFERENCES
- TRIGGER
- TRUNCATE

`authenticated`:

- REFERENCES
- SELECT
- TRIGGER
- TRUNCATE

## `tenants`

`anon`:

- REFERENCES
- TRIGGER
- TRUNCATE

`authenticated`:

- REFERENCES
- SELECT
- TRIGGER
- TRUNCATE

## `tenant_memberships`

`anon`:

- REFERENCES
- TRIGGER
- TRUNCATE

`authenticated`:

- REFERENCES
- SELECT
- TRIGGER
- TRUNCATE

These privileges are broader than the minimum runtime read requirement.

Privilege reduction is therefore part of the security hardening scope.

---

# 7. Resolver Privilege

Current resolver privilege:

`authenticated` â†’ `EXECUTE`

`postgres` â†’ `EXECUTE`

The resolver does not grant EXECUTE to `anon`.

This remains the approved runtime boundary.

---

# 8. RLS Security Objective

The security hardening must establish tenant isolation based on the
authenticated identity.

The canonical access relationship remains:

`auth.uid()`
â†’ `tenant_memberships`
â†’ `tenants`
â†’ `companies`

An authenticated user must not be able to use the client runtime to
read another user's membership or another tenant's protected business
context.

---

# 9. Tenant Membership Security Policy

`tenant_memberships` is the identity-to-tenant boundary.

The security policy must bind membership visibility to:

`tenant_memberships.user_id = auth.uid()`

The client must not be able to bypass this boundary by supplying another
user identifier.

No tenant membership may be exposed merely because the caller is an
authenticated user.

---

# 10. Tenant Security Policy

`tenants` is the canonical tenant boundary.

Tenant visibility must be derived through an authenticated user's valid
membership.

The security model must not permit an authenticated user to enumerate
unrelated tenants.

Tenant selection must not be inferred from:

- UI
- configuration
- email
- arbitrary request parameters
- hardcoded tenant identifiers

---

# 11. Company Security Policy

`companies` is the canonical business/master authority.

Company access must be restricted through the user's valid tenant
membership.

A user must not be able to enumerate unrelated companies through the
client data access layer.

The physical relationship remains:

`tenants.company_id â†’ companies.company_id`

No duplicate company authority is introduced.

---

# 12. Resolver Compatibility Requirement

The resolver currently uses:

`SECURITY INVOKER`

Therefore RLS policies and table privileges must be designed so that the
authenticated resolver can perform its required relationship traversal
without bypassing the security boundary.

The implementation must not convert the resolver to `SECURITY DEFINER`
merely to bypass RLS.

Any future change to security execution semantics requires a separate
security decision.

---

# 13. Write Security Boundary

The current SP-203 runtime provider is a read/resolution capability.

The client must not receive unrestricted INSERT, UPDATE, DELETE, or
TRUNCATE capability on:

- `tenant_memberships`
- `tenants`
- `companies`

Write authority must remain outside the client runtime unless a separate
governed administrative contract explicitly authorizes it.

No write policy is approved by this decision.

---

# 14. Anonymous Access

Anonymous clients must not receive tenant context.

Anonymous clients must not be able to:

- resolve effective tenant access
- read tenant memberships
- enumerate tenants
- enumerate companies belonging to protected tenant context

The resolver remains unavailable to `anon`.

---

# 15. Privilege Minimization

Security hardening must reduce database privileges to the minimum required
by the approved runtime.

The implementation must specifically review and remove unnecessary
client-facing privileges such as:

- TRUNCATE
- TRIGGER
- REFERENCES

from roles that do not require them.

The exact final grant set must be validated after implementation.

---

# 16. Multiple Membership Policy

The existing SP-203 runtime decision remains unchanged.

If an authenticated user has:

- zero valid memberships â†’ `TENANT_ACCESS_NOT_FOUND`
- exactly one valid membership â†’ resolve successfully
- more than one valid membership â†’ `INVALID_ACCESS_CONTEXT`

The resolver must never select an arbitrary tenant.

No `LIMIT 1` or equivalent arbitrary selection is permitted.

Explicit multi-tenant selection requires a separate contract decision.

---

# 17. Fail-Closed Requirement

Security hardening must preserve fail-closed behavior.

If effective tenant access cannot be established, session establishment must
not authenticate the application session.

The runtime must not fall back to:

- user ID
- email
- default tenant
- first tenant
- hardcoded tenant
- local configuration
- dummy tenant

---

# 18. Implementation Scope

The next implementation stage is authorized to cover:

1. Enable RLS on:
   - `tenant_memberships`
   - `tenants`
   - `companies`

2. Create explicit RLS policies enforcing authenticated tenant isolation.

3. Review and minimize client-facing table privileges.

4. Preserve resolver EXECUTE for `authenticated`.

5. Preserve resolver SECURITY INVOKER semantics.

6. Validate resolver behavior after RLS activation.

7. Validate anonymous denial.

8. Validate cross-tenant isolation.

9. Validate zero/single/multiple membership behavior.

10. Validate regression against the Flutter application.

---

# 19. Explicit Non-Goals

This decision does not authorize:

- role/permission implementation
- policy engine implementation
- arbitrary tenant switching
- direct Flutter database bypass
- auth.users schema modification
- replacing SP-203 with Supabase as logical authority
- changing the resolver to SECURITY DEFINER
- production authorization approval
- unrestricted administrative write access
- automatic tenant selection for multiple memberships

---

# 20. Required Security Validation

After implementation, validation must prove at minimum:

### RLS

- RLS enabled on all three runtime tables.
- No unintended bypass.
- Policies exist and match the approved security boundary.

### Anonymous

- Anonymous cannot read protected runtime data.
- Anonymous cannot execute the resolver.

### Authenticated User

- User can resolve own valid tenant context.
- User cannot read another user's membership.
- User cannot enumerate unrelated tenants.
- User cannot enumerate unrelated companies.

### Resolver

- Zero membership â†’ `TENANT_ACCESS_NOT_FOUND`
- One membership â†’ success
- Multiple memberships â†’ `INVALID_ACCESS_CONTEXT`

### Privileges

- Unnecessary client privileges removed.
- Required resolver EXECUTE retained.

### Regression

- Full Flutter test suite passes.
- `flutter analyze` passes.
- `git diff --check` passes.

---

# 21. Production Authorization Gate

RLS implementation alone does not authorize production.

Production Authorization remains:

`NOT AUTHORIZED`

until all security validation evidence has passed and the security
implementation has been committed and approved as a complete checkpoint.

---

# 22. Governance Status

Current state:

- SP-203 logical authority: LOCKED
- Tenant physical design: LOCKED
- Tenant physical migration: EXECUTED
- Tenant physical validation: GREEN
- Runtime provider decision: LOCKED
- Runtime provider implementation: EXECUTED
- Runtime provider functional validation: GREEN
- Runtime provider validation evidence: COMMITTED
- Security baseline audit: COMPLETE
- Security hardening decision: APPROVED / LOCKED
- RLS implementation: NEXT
- Security validation: NOT YET EXECUTED
- Production Authorization: NOT AUTHORIZED

---

# 23. Next Gate

The next controlled stage is:

`SP-203 RLS / SECURITY HARDENING IMPLEMENTATION 001`

Implementation must follow:

Evidence
â†’ Decision
â†’ Implementation
â†’ Validation
â†’ Approval
â†’ Commit / Push

No production authorization may be inferred before completion of the
security validation gate.