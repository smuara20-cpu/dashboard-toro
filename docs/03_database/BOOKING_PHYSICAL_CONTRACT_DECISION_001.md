# BOOKING PHYSICAL CONTRACT DECISION 001

Version: 1.0
Status: HOLD / EVIDENCE GAP
Classification: Controlled Engineering Decision
Domain: Booking
Entity: Booking

---

## 1. Purpose

Dokumen ini menutup Gate 015A Step 5N-A — Booking Physical Contract Decision.

Tujuannya adalah menetapkan batas physical authority Booking berdasarkan evidence yang tersedia, tanpa mengarang schema PostgreSQL yang belum didukung evidence.

Dokumen ini bukan migration authorization.

---

## 2. Evidence Reviewed

### 2.1 Booking Business Authority

`docs/20_blueprints/business/BP-104_booking_blueprint.md`

Booking ditetapkan sebagai transaction center untuk Booking Domain, dengan scope antara lain:

- Booking Management
- Reservation
- Traveler Assignment
- Validation
- Confirmation
- Amendment
- Cancellation
- Status Management
- Timeline
- Approval
- History
- Analytics

Business model Booking mencakup antara lain:

- Booking Number
- Customer Reference
- CRM Reference
- Package Reference
- Booking Date
- Booking Status
- Booking Channel
- Booking Type
- Currency
- Total Traveler
- Total Amount
- Booking Owner

### 2.2 Booking Business Rules

`docs/03_database/business_rules/booking_rules.md`

Booking wajib memiliki:

- Customer Reference
- Package Reference
- Booking Date
- Booking Status
- Booking Owner

Customer Reference harus valid.

Booking tidak dihapus secara langsung apabila telah memiliki transaksi; lifecycle menggunakan mekanisme archival sesuai business rule.

### 2.3 Booking Database Authority

`docs/20_blueprints/database/DB-104 Booking Database Blueprint.md`

Booking Database ditetapkan sebagai persistence authority untuk Booking Domain dengan perhatian terhadap:

- tenant isolation
- transaction integrity
- customer reference
- traveller traceability
- indexing foundation
- data-access boundary

Namun dokumen tersebut belum memberikan PostgreSQL DDL lengkap untuk parent table `booking`.

### 2.4 Existing Physical SQL

Inventory physical SQL saat ini membuktikan physical table:

1. `booking_passenger`
2. `acquisition_spend`

Tidak ditemukan:

```sql
CREATE TABLE booking
```

Tidak ditemukan migration parent Booking.

Physical SQL yang ada hanya membuktikan dependency:

```text
booking_passenger.booking_id → booking.id
```

Physical parent table `booking` sendiri belum tersedia.

### 2.5 Booking Passenger Physical Contract

`docs/03_database/BOOKING_DB_PHYSICAL_DECISION_001.md`

Physical contract yang telah APPROVED untuk `booking_passenger` menetapkan:

- `id`
- `tenant_id`
- `booking_id`
- `jamaah_id`
- audit timestamps
- `deleted_at`
- primary key
- FK ke Booking dan Jamaah
- active uniqueness untuk `(booking_id, jamaah_id)`

Dokumen tersebut hanya menetapkan physical contract untuk `booking_passenger`, bukan parent Booking.

---

## 3. Physical Authority Matrix

| Concern | Evidence | Decision |
|---|---|---|
| Table name `booking` | BP-104 / DB-104 | LOGICAL APPROVED |
| Booking as transaction center | BP-104 | APPROVED |
| `id` | Generic DB convention exists | CONVENTION ONLY |
| `tenant_id` | Tenant architecture requires tenant boundary, Booking-specific physical mapping not established | HOLD |
| Booking Number | BP-104 business model | BUSINESS FIELD APPROVED; physical mapping HOLD |
| Customer Reference | BP-104 + booking rules | LOGICAL APPROVED; physical FK/column HOLD |
| CRM Reference | BP-104 | LOGICAL; physical mapping HOLD |
| Package Reference | BP-104 | LOGICAL; physical mapping HOLD |
| Booking Date | BP-104 / business rules | BUSINESS FIELD APPROVED; physical type/nullability HOLD |
| Booking Status | BP-104 / business rules | LOGICAL APPROVED; physical representation/value set HOLD |
| Booking Channel | BP-104 | LOGICAL; physical mapping HOLD |
| Booking Type | BP-104 | LOGICAL; physical mapping HOLD |
| Currency | BP-104 | LOGICAL; physical type/constraint HOLD |
| Total Traveler | BP-104 | LOGICAL; physical type/constraint HOLD |
| Total Amount | BP-104 | LOGICAL; physical type/precision/scale/currency boundary HOLD |
| Booking Owner | BP-104 / business rules | LOGICAL APPROVED; physical FK/column HOLD |
| Created/Updated timestamps | Generic DB convention | CONVENTION ONLY |
| Deleted/Archive behavior | Booking business rules | BUSINESS RULE APPROVED; physical implementation HOLD |
| Primary Key | No Booking-specific physical decision | HOLD |
| UNIQUE constraints | No Booking-specific physical decision | HOLD |
| Foreign Keys | Parent/related physical authorities incomplete | HOLD |
| Tenant-safe constraints | Booking physical schema absent | HOLD |
| Indexes | No Booking-specific physical decision | HOLD |
| Migration | No approved Booking physical contract | HOLD |

---

## 4. Physical Contract Boundary

### 4.1 Approved at Domain / Logical Level

Booking is an authoritative Booking Domain entity.

Its business responsibility includes:

- booking identity
- customer reference
- package reference
- booking date
- booking status
- booking channel/type
- currency
- traveler count
- amount
- booking owner
- reservation/workflow lifecycle
- confirmation
- amendment
- cancellation
- history/timeline

### 4.2 Not Yet Approved at Physical Level

The following must not be implemented as PostgreSQL schema based solely on this decision:

- exact table definition for `booking`
- exact PostgreSQL type of each Booking field
- exact nullability
- exact PK definition
- exact Booking Number uniqueness
- exact Customer FK target
- exact Package FK target
- exact CRM FK target
- exact Booking Owner FK target
- exact status enum/check/lookup strategy
- exact currency representation
- exact amount precision/scale
- exact tenant-safe FK strategy
- exact indexes
- migration and rollback SQL

---

## 5. Dependency Authority

### 5.1 Company

Company physical authority is already reconciled.

Canonical physical authority:

```text
companies.company_id UUID
```

Company remains distinct from Tenant.

`company_id` must not be silently substituted for `tenant_id`.

### 5.2 Branch

Branch physical authority is established as:

```text
branches.branch_id UUID
branches.company_id → companies.company_id
```

However, Booking-specific use of Branch is not sufficiently defined in the reviewed Booking physical evidence to authorize a Booking FK.

### 5.3 Customer

Customer logical authority exists, but Customer physical authority remains:

```text
HOLD / EVIDENCE GAP
```

Therefore:

```text
booking → customer
```

cannot yet be physically authorized.

### 5.4 Jamaah

Jamaah has an approved minimum physical decision, but its PostgreSQL mapping remains incomplete.

Therefore the existing:

```text
booking_passenger
```

remains parent-dependent for full tenant-safe reconciliation.

---

## 6. Required Closure Before Booking GREEN

The following must be explicitly resolved in a Booking-specific physical contract:

1. Physical table authority for `booking`.
2. Exact PK and identifier type.
3. Tenant isolation mechanism.
4. Booking business identity / Booking Number physical column.
5. Customer physical reference and FK target.
6. Package physical reference and FK target.
7. CRM reference, if physically persisted.
8. Booking Owner physical reference, if physically persisted.
9. Booking Date type and nullability.
10. Booking Status representation and authoritative values.
11. Booking Channel representation.
12. Booking Type representation.
13. Currency representation.
14. Total Traveler type and constraints.
15. Total Amount type, precision/scale, and currency relationship.
16. Audit fields.
17. Archive/soft-delete physical behavior.
18. UNIQUE constraints.
19. Indexes.
20. Tenant-safe relationship constraints.
21. Migration.
22. Rollback migration.
23. PostgreSQL validation.

No item above may be silently inferred from generic standards.

---

## 7. Downstream Impact

Until Booking physical authority becomes GREEN:

- Booking parent table migration remains HOLD.
- Customer FK from Booking remains HOLD.
- Package FK from Booking remains HOLD.
- CRM reference FK remains HOLD unless separately evidenced.
- Booking Owner FK remains HOLD unless separately evidenced.
- `booking_passenger` tenant-safe parent reconciliation remains HOLD.
- Gate 015A remains HOLD.

---

## 8. Migration Decision

**NO MIGRATION IS AUTHORIZED BY THIS DOCUMENT.**

This decision does not authorize creation of:

```sql
CREATE TABLE booking (...)
```

and does not authorize alteration of:

```text
booking_passenger
```

for tenant-safe composite FK enforcement until the parent physical contracts are authoritative.

---

## 9. Validation Requirements

Before Booking can be promoted from HOLD to APPROVED/LOCKED physical authority, validation must confirm:

- Booking physical contract approved.
- Customer physical authority approved.
- Required dependency authorities approved.
- PostgreSQL types confirmed.
- PK/UNIQUE/FK constraints confirmed.
- Tenant isolation confirmed.
- Index strategy confirmed.
- Migration and rollback prepared.
- PostgreSQL execution validated.
- Existing `booking_passenger` relationship revalidated against finalized parent schema.
- `git diff --check` clean.
- Relevant automated tests pass.
- No undocumented schema invention.

---

## 10. Decision

### Booking Business Authority

**APPROVED**

### Booking Logical Database Authority

**APPROVED**

### Booking Physical PostgreSQL Authority

**HOLD / EVIDENCE GAP**

### Booking Migration

**HOLD**

### Gate 015A

**REMAINS HOLD**

The evidence is sufficient to establish Booking as a logical/domain authority, but insufficient to approve the exact PostgreSQL physical contract.

No physical Booking table shall be created until the missing physical evidence and controlled decisions are resolved.

---

## 11. Governance

This document is a controlled engineering decision.

Any change to the physical Booking boundary must follow:

```text
Evidence
→ Decision
→ Implementation
→ Validation
→ Approval
→ Commit / Push
```

No schema invention, silent reconciliation, or direct migration is permitted outside that sequence.

---

## 12. Status

```text
Booking Physical Contract Decision 001

Business Authority:        APPROVED
Logical Authority:         APPROVED
Physical Authority:        HOLD / EVIDENCE GAP
Migration:                 HOLD
Gate 015A:                 HOLD
```

---

## 13. Next Controlled Step

The next step is **Booking Physical Evidence Gap Resolution**.

Target:

```text
Booking Physical Authority
        ↓
Exact PostgreSQL Contract
        ↓
Customer / Dependency Reconciliation
        ↓
Migration Readiness
        ↓
Gate 015A Closure
```
