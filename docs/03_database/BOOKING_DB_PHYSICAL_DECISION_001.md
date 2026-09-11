# BOOKING DB PHYSICAL DECISION 001

Version : 1.0
Status : APPROVED
Classification : Controlled Engineering Decision
Domain : Booking
Entity : booking_passenger
Decision ID : BOOKING-DB-PHYSICAL-DECISION-001

---

## 1. Purpose

Decision ini menetapkan physical persistence contract minimum untuk `booking_passenger` sebagai relationship table antara Booking dan Jamaah.

Decision ini menyelesaikan DB-8 (physical schema authority) tanpa mengubah logical architecture pada DB-104, domain ownership, atau relationship decisions yang telah disetujui sebelumnya.

---

## 2. Authority

Urutan authority:

1. VENTRA Development Constitution / Enterprise Governance
2. Approved Business Blueprint
3. Approved Domain Contract
4. Approved Database Architecture / DB-104
5. BOOKING-DB-PHYSICAL-DECISION-001
6. Implementation Source Code

Decision ini tidak boleh bertentangan dengan authority di atas.

---

## 3. Physical Table

Physical table yang ditetapkan:

`booking_passenger`

Table ini ditetapkan sebagai relationship table antara Booking dan Jamaah.

Table ini tidak mengambil alih ownership data master Jamaah.

---

## 4. Minimum Physical Contract

| Column | Type | Required | Contract |
|---|---|---:|---|
| id | UUID | YES | Primary key |
| tenant_id | UUID | YES | Tenant boundary |
| booking_id | UUID | YES | Foreign key to `booking.id` |
| jamaah_id | UUID | YES | Foreign key to `jamaah.id` |
| created_at | TIMESTAMP | YES | Creation timestamp |
| updated_at | TIMESTAMP | YES | Last update timestamp |
| deleted_at | TIMESTAMP | NO | Soft-delete timestamp |

No additional business column is authorized by this decision.

---

## 5. Primary Key

`booking_passenger.id` is the primary key.

Identifier type:

`UUID`

---

## 6. Foreign Keys

The physical relationship is:

`booking_passenger.booking_id → booking.id`

`booking_passenger.jamaah_id → jamaah.id`

Foreign keys establish referential integrity and do not transfer domain ownership.

---

## 7. Tenant Boundary

`tenant_id` is required.

Every `booking_passenger` row belongs to exactly one tenant context.

Implementation must preserve tenant isolation and must not permit cross-tenant relationship records.

---

## 8. Cardinality

The approved relationship is:

`Booking 1 ─── N booking_passenger N ─── 1 Jamaah`

A Booking may contain multiple Jamaah records.

A Jamaah may participate in multiple Booking records.

The minimum-one-Jamaah rule remains a domain/application invariant and is not claimed to be enforced by a simple foreign key.

---

## 9. Uniqueness

The same Jamaah must not be attached more than once to the same Booking within the active relationship set.

Active uniqueness must be enforced for:

`(booking_id, jamaah_id)`

The implementation must follow the repository's approved soft-delete and index conventions.

---

## 10. Index Foundation

At minimum, provide query support for:

- `booking_id`
- `jamaah_id`
- active `(booking_id, jamaah_id)` uniqueness

No speculative indexes are required.

---

## 11. Delete and Update Behavior

Foreign-key behavior must preserve referential integrity.

No automatic destructive cascade is approved.

Implementation must follow the approved lifecycle and soft-delete conventions.

---

## 12. Audit and Lifecycle

Required:

- `created_at`
- `updated_at`

Optional:

- `deleted_at`

A deleted relationship must not be treated as an active Booking-Jamaah membership.

---

## 13. Relationship Ownership

This decision establishes only physical relationship persistence.

It does not:

- change Jamaah domain ownership;
- redefine the Jamaah master table;
- redefine Booking aggregate ownership;
- change DB-104;
- expose the database directly to clients;
- authorize direct client-side database access;
- replace the official application/service boundary.

---

## 14. Implementation Authorization

Authorized after this decision:

1. Physical SQL definition for `booking_passenger`.
2. Required indexes and uniqueness enforcement.
3. Required foreign keys.
4. Database migration.
5. Repository/entity/model mapping required by approved architecture.
6. Automated persistence and tenant-isolation tests.

Implementation must not introduce additional business semantics.

---

## 15. Migration Requirement

Physical creation or alteration must use migration.

Migration naming convention:

`YYYYMMDD_HHMM_description.sql`

Every migration requires a documented rollback plan.

No migration may silently modify existing business data.

---

## 16. Security and Tenant Isolation

`booking_passenger` is controlled business data.

All reads and writes must respect tenant isolation and the approved service/data-access boundary.

No public/client-facing direct SQL access is authorized.

---

## 17. Deferred

Not defined by this decision:

- passenger-specific role/type;
- room assignment;
- seat assignment;
- visa/document status;
- pricing/allocation;
- passenger snapshot;
- booking-specific passenger status;
- external API persistence contract;
- additional audit/event metadata.

Those concerns require separate approved decisions.

---

## 18. Change Control

Any change to this physical contract requires a new controlled engineering decision.

Implementation source code must not silently redefine this contract.

---

## 19. Acceptance

This decision resolves DB-8 for the minimum physical `booking_passenger` relationship contract.

Physical implementation may proceed according to this decision and existing repository/database governance.

**Status: APPROVED**

**Decision ID: BOOKING-DB-PHYSICAL-DECISION-001**

**Next Gate: DB-9 — Physical SQL + Migration Implementation**