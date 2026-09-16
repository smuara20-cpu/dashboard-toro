# BOOKING EXACT PHYSICAL CONTRACT READINESS DECISION 001

Version: 1.0
Status: HOLD / NOT READY
Classification: Controlled Engineering Decision
Domain: Booking
Entity: Booking
Gate: 015A
Step: 5N-D

---

## 1. Purpose

Dokumen ini menutup Step 5N-D — Exact Physical Contract Readiness.

Tujuannya adalah menetapkan apakah evidence yang tersedia sudah cukup
untuk membangun exact PostgreSQL physical contract untuk parent entity
`booking`.

Decision ini hanya menentukan readiness.

Decision ini tidak mengotorisasi migration dan tidak mengizinkan schema
invention.

---

## 2. Evidence Reviewed

Evidence yang telah direview sampai Step 5N-D meliputi:

- `docs/20_blueprints/business/BP-104_booking_blueprint.md`
- `docs/20_blueprints/database/DB-104 Booking Database Blueprint.md`
- `docs/03_database/business_rules/booking_rules.md`
- `docs/03_database/booking_erd.md`
- `docs/03_database/BOOKING_DB_PHYSICAL_DECISION_001.md`
- `docs/03_database/BOOKING_PHYSICAL_CONTRACT_DECISION_001.md`
- `docs/03_database/BOOKING_PHYSICAL_GAP_RESOLUTION_DECISION_001.md`
- relevant tenant/authitecture evidence
- existing PostgreSQL SQL inventory

---

## 3. Current Physical SQL Evidence

Physical SQL inventory confirms:

```text
booking_passenger
acquisition_spend
```

No authoritative parent Booking table was found.

Specifically, no:

```sql
CREATE TABLE booking (...)
```

was found in the repository SQL inventory.

The existing Booking-related migration is:

```text
20260912_1011_create_booking_passenger.sql
```

This migration defines the child relationship entity
`booking_passenger`, not the parent `booking`.

---

## 4. Physical Readiness Matrix

| Concern | Current Evidence | Readiness |
|---|---|---|
| Parent table `booking` | No physical CREATE TABLE | HOLD |
| Primary key | No Booking-specific physical decision | HOLD |
| `tenant_id` | Tenant architecture exists; Booking physical mapping absent | HOLD |
| Booking Number | Business authority exists; physical mapping absent | HOLD |
| Booking Number UNIQUE | Business rule exists; physical implementation absent | HOLD |
| Booking Number generator | Business rule exists; physical strategy absent | HOLD |
| `customer_id` | Logical architecture evidence exists | HOLD |
| Customer FK | Customer physical authority remains HOLD | HOLD |
| Package reference | Logical/business evidence exists | HOLD |
| Package FK | Package physical authority not established | HOLD |
| Booking Owner | Logical/business evidence exists | HOLD |
| Booking Owner FK | Physical target not established | HOLD |
| Booking Date | Business evidence exists | HOLD |
| Booking Status | Logical lifecycle evidence exists | HOLD |
| Status representation | No physical decision | HOLD |
| Currency | Logical/enterprise evidence exists | HOLD |
| Total Traveler | Business evidence exists | HOLD |
| Total Amount | Business evidence exists | HOLD |
| Amount precision/scale | No physical decision | HOLD |
| Audit fields | Generic conventions only | HOLD |
| Archive/soft-delete implementation | Business rule exists; physical implementation absent | HOLD |
| UNIQUE constraints | No Booking physical decision | HOLD |
| Indexes | No Booking physical decision | HOLD |
| Tenant-safe constraints | Parent physical authority absent | HOLD |
| Migration | No approved physical contract | HOLD |
| Rollback | No Booking migration | HOLD |

---

## 5. What Is Approved

The following are approved at business or logical level based on the
reviewed evidence:

### Booking Domain

Booking is an authoritative transaction center for the Booking Domain.

### Booking Number

Business authority establishes that Booking Number is:

- required
- unique
- automatically generated
- permanent

This does not approve its PostgreSQL implementation.

### Customer Reference

Logical architecture and Booking business rules establish Customer
Reference as a required Booking relationship.

Logical evidence includes:

```text
booking.customer_id
```

This does not approve the physical Customer FK.

### Package Reference

Booking has a Package Reference and Package remains the domain owner of
Package Master.

This does not approve a physical Package FK.

### Booking Owner

Booking Owner is a required business attribute and is represented in
logical Booking ownership architecture.

This does not approve a physical Owner FK.

### Booking Status

Booking Status and its lifecycle are established at the logical/business
level.

This does not approve PostgreSQL ENUM, CHECK, lookup, or another physical
representation.

### Currency and Amount

Currency and Total Amount are established at business/logical level and
the enterprise architecture supports multi-currency context.

This does not approve exact PostgreSQL monetary types, precision, scale,
or currency constraints.

---

## 6. What Is Not Approved

The following physical decisions remain HOLD:

- exact Booking table name implementation
- exact PostgreSQL column list
- exact PostgreSQL types
- nullability
- primary key implementation
- Booking Number physical column
- Booking Number UNIQUE constraint
- Booking Number generation mechanism
- Customer FK
- Package FK
- Booking Owner FK
- Booking Status physical representation
- Currency physical representation
- Total Traveler physical type/constraint
- Total Amount physical type/precision/scale
- audit field implementation
- archive/soft-delete implementation
- UNIQUE constraints
- indexes
- tenant-safe relationship constraints
- migration
- rollback migration

No item above may be inferred solely from generic standards.

---

## 7. Dependency Readiness

### Customer

Customer physical authority remains:

```text
HOLD / EVIDENCE GAP
```

Therefore Booking → Customer physical FK cannot be finalized.

### Package

Package physical authority has not been established sufficiently for a
Booking physical FK.

### Jamaah

Jamaah has a minimum physical contract, but PostgreSQL mapping remains
incomplete.

The existing `booking_passenger` relationship therefore remains
parent-dependent.

### Company and Branch

Company and Branch physical authorities have been reconciled.

However, the reviewed Booking evidence does not establish exact Booking
Company/Branch physical fields or relationships.

No fields may be invented from those parent authorities.

---

## 8. Readiness Decision

The evidence base is sufficient to understand Booking's:

- business responsibilities
- logical attributes
- logical relationships
- lifecycle
- ownership boundary
- database architectural role

The evidence base is NOT sufficient to construct an exact PostgreSQL
physical Booking contract without assumptions.

Therefore:

```text
Business Authority             APPROVED
Logical Authority              APPROVED
Physical Contract Readiness    HOLD / NOT READY
Migration Readiness            HOLD
Gate 015A                      HOLD
```

---

## 9. Migration Decision

**NO MIGRATION IS AUTHORIZED.**

This decision does not authorize:

```sql
CREATE TABLE booking (...)
```

It also does not authorize alteration of:

```text
booking_passenger
```

The existing child migration must remain unchanged until parent physical
authority is finalized and validated.

---

## 10. Required Closure Before Physical Approval

A subsequent controlled Booking physical contract must explicitly resolve:

1. Parent Booking table and primary key.
2. Tenant boundary.
3. Booking Number physical representation.
4. Booking Number uniqueness.
5. Booking Number generation strategy.
6. Customer physical reference and FK.
7. Package physical reference and FK.
8. Booking Owner physical reference and FK.
9. Booking Date PostgreSQL type and nullability.
10. Booking Status physical representation and authoritative values.
11. Currency representation.
12. Total Traveler representation.
13. Total Amount type and precision/scale.
14. Audit fields.
15. Archive/soft-delete behavior.
16. UNIQUE constraints.
17. Indexes.
18. Tenant-safe relationship constraints.
19. Migration.
20. Rollback.
21. PostgreSQL execution validation.
22. Revalidation of `booking_passenger` against finalized parent schemas.

---

## 11. Governance

The controlled engineering sequence remains:

```text
Evidence
→ Decision
→ Implementation
→ Validation
→ Approval
→ Commit / Push
```

This decision records readiness only.

No physical schema invention, silent reconciliation, or migration is
permitted outside the controlled sequence.

---

## 12. Status

```text
Step 5N-A  Booking Physical Contract Decision       GREEN
Step 5N-B  Evidence Validation                      GREEN
Step 5N-C  Physical Gap Resolution                  GREEN
Step 5N-D  Exact Physical Contract Readiness        HOLD
Booking Physical Authority                          HOLD
Booking Migration                                   HOLD
Gate 015A                                           HOLD
```

---

## 13. Next Controlled Step

Next controlled work:

**Step 5N-E — Parent Dependency Closure**

Objective:

Resolve the physical dependencies that block Booking physical approval,
starting with the authoritative Customer physical contract and any other
Booking parent/reference entity whose physical authority is required.

No Booking migration will be created until the exact physical contract
is APPROVED/LOCKED.
