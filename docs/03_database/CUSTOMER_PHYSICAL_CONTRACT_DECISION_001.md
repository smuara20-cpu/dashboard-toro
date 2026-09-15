# CUSTOMER PHYSICAL CONTRACT DECISION 001

Version: 1.0
Status: HOLD / EVIDENCE GAP
Classification: Controlled Engineering Decision
Domain: Customer
Entity: Customer

---

## 1. Purpose

Dokumen ini menutup Step 5O-1 — Customer Physical Contract Decision
berdasarkan evidence yang tersedia pada `docs/03_database`.

Tujuannya adalah menetapkan batas physical authority Customer tanpa
mengarang schema PostgreSQL yang belum didukung evidence.

---

## 2. Evidence Reviewed

Evidence yang ditemukan:

1. `customer_erd.md`
   - Customer has many Customer Address, Family, Emergency Contact,
     Health, Note, Timeline, Document.
   - Customer has many Booking.
   - Customer has many Jamaah.
   - Customer belongs to Branch.
   - Customer belongs to Company.

2. `business_rules/customer_rules.md`
   - Customer dapat memiliki satu atau lebih Jamaah.
   - Customer dapat memiliki lebih dari satu Booking.
   - Customer tidak boleh dihapus apabila memiliki transaksi aktif.
   - Jamaah harus terhubung ke Customer.

3. `base_entity.md` / `table_standard.md`
   - Generic conventions include `id` UUID.
   - Generic audit fields include `created_at`, `updated_at`, `deleted_at`.
   - Generic conventions include `company_id`, `branch_id`, and `status`.
   - These documents are generic standards and are NOT sufficient by
     themselves to establish Customer-specific nullability, FK,
     uniqueness, enum/lookup, or indexes.

4. `data_standards/numbering_standard.md`
   - Customer numbering convention exists: `CUS-000001`.
   - A physical Customer column carrying this business identity is NOT
     explicitly established by the reviewed Customer evidence.

5. `data_standards/status_standard.md`
   - Status must not be free-form string.
   - Customer-specific status values are not defined there.

6. `CRM_PHYSICAL_CONTRACT_DECISION_001_LEAD.md`
   - `customer_id` is LOGICAL APPROVED / PHYSICAL HOLD.
   - The reviewed sources do not yet establish the physical Customer FK
     contract.

7. Physical SQL inventory
   - No `CREATE TABLE customer` was found.
   - No Customer migration was found.

---

## 3. Physical Authority Matrix

| Concern | Evidence | Decision |
|---|---|---|
| Table name `customer` | Customer ERD/domain | LOGICAL APPROVED |
| `id` UUID | Generic DB standard | CONVENTION ONLY |
| `tenant_id` | No Customer-specific physical contract found | HOLD |
| `company_id` | Customer ERD + generic standard | LOGICAL; physical nullability/FK HOLD |
| `branch_id` | Customer ERD + generic standard | LOGICAL; physical nullability/FK HOLD |
| Customer business code | `CUS-000001` numbering standard | BUSINESS CONVENTION; physical column HOLD |
| Customer name/contact fields | No authoritative Customer physical contract | HOLD |
| `status` | Generic standard only; Customer values absent | HOLD |
| `created_at` / `updated_at` | Generic standard | CONVENTION ONLY |
| `deleted_at` | Generic standard | CONVENTION ONLY |
| PK / UNIQUE | No Customer physical decision | HOLD |
| Customer FKs | No physical Customer contract | HOLD |
| Tenant-safe constraints | No Customer physical contract | HOLD |
| Indexes | Generic index guidance only | HOLD |
| Migration | No physical Customer authority | HOLD |

---

## 4. Decision

Customer physical schema is NOT APPROVED for migration.

The available evidence is sufficient to establish Customer as a
logical domain entity and to establish its logical relationships with
Company, Branch, Booking, and Jamaah.

The available evidence is NOT sufficient to approve a PostgreSQL
physical contract.

No `CREATE TABLE customer` migration shall be created from this
decision.

---

## 5. Required Closure Before Customer GREEN

The following must be explicitly decided in a Customer-specific
physical contract:

- tenant isolation mechanism
- exact physical columns and PostgreSQL types
- nullability
- primary key
- Customer business identity column, if physical persistence is
  required
- Customer status representation and authoritative values
- Company FK contract
- Branch FK contract
- Customer/Jamaah relationship FK target
- UNIQUE constraints
- indexes
- soft-delete behavior
- audit fields
- rollback migration

No item above may be inferred solely from the generic Base Entity or
Table Standard.

---

## 6. Downstream Impact

Until Customer physical authority is GREEN:

- Jamaah `customer_id` physical FK remains HOLD.
- Booking → Customer physical FK remains HOLD.
- `booking_passenger` parent reconciliation remains HOLD.
- Gate 015A remains HOLD.

---

## 7. Governance

This document does not authorize physical SQL implementation.

A subsequent controlled decision may promote Customer to
APPROVED/LOCKED once the missing Customer-specific evidence and
decisions are resolved.

---

## 8. Status

Customer Physical Contract:

    HOLD / EVIDENCE GAP

Migration Status:

    HOLD

Gate 015A:

    HOLD
