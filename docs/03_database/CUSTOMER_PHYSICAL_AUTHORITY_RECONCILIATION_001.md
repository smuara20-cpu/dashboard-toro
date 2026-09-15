# CUSTOMER PHYSICAL AUTHORITY RECONCILIATION 001

Version: 1.0
Status: APPROVED / LOCKED
Classification: Controlled Engineering Decision
Domain: Customer
Entity: Customer

---

## 1. Purpose

Dokumen ini merekonsiliasi physical dependency Customer terhadap
Company dan Branch berdasarkan authority yang telah disetujui.

Dokumen ini TIDAK mengarang physical schema Customer yang belum
didukung evidence.

---

## 2. Evidence Reviewed

1. `CUSTOMER_PHYSICAL_CONTRACT_DECISION_001.md`
   - Customer physical schema masih HOLD.
   - Belum ada `CREATE TABLE customer`.
   - Exact Customer columns, PK, FK, status, indexes, dan migration
     belum disetujui.

2. `docs/03_database/data_dictionary/core/company.md`
   - Company merupakan root ERP.
   - Customer merupakan relationship/domain dependent Company.
   - Security menggunakan `company_id`.

3. `docs/03_database/master_data/company/data_dictionary.md`
   - APPROVED.
   - Physical Company authority:
     `companies.company_id`.

4. `docs/03_database/master_data/branch/data_dictionary.md`
   - APPROVED.
   - Physical Branch authority:
     `branches.branch_id`.
   - Company relationship:
     `branches.company_id`.

5. Customer ERD / business rules
   - Customer belongs to Company.
   - Customer belongs to Branch.
   - Customer memiliki Booking dan Jamaah.
   - Jamaah harus terhubung ke Customer.

---

## 3. Authority Decision

Physical parent authorities are locked as follows:

```text
Company
  Table: companies
  PK: company_id

Branch
  Table: branches
  PK: branch_id
  FK: company_id → companies.company_id
```

Customer must reference these canonical authorities when its own
physical contract is finalized.

No alternative Company or Branch table/PK may be introduced from this
reconciliation.

---

## 4. Customer Physical Authority Boundary

The following remain HOLD because Customer-specific physical evidence
does not yet establish them:

- Customer table name for physical implementation
- Customer primary key physical definition
- Customer `company_id` column exact contract
- Customer `branch_id` column exact contract
- Customer business identity physical column
- Customer status physical representation and values
- Customer-specific unique constraints
- Customer-specific indexes
- Customer audit physical contract
- Customer tenant/RLS implementation
- Customer migration and rollback

Therefore this reconciliation does NOT authorize `CREATE TABLE customer`.

---

## 5. Approved Relationship Targets

When the Customer physical contract is finalized, the canonical target
identifiers are:

```text
company_id → companies.company_id
branch_id  → branches.branch_id
```

This decision does not authorize the FK until the Customer physical
contract explicitly defines the source columns, nullability, constraints,
and tenant/security behavior.

---

## 6. Tenant / Company Boundary

Tenant and Company remain distinct.

```text
Tenant
  │ 1:1
  ▼
Company
  │
  ▼
Branch
  │
  ▼
Customer
```

`company_id` must not be replaced by `tenant_id`.

Customer tenant isolation must be reconciled against the approved
Identity & Access / Tenant Context authority before physical migration.

---

## 7. Downstream Impact

Until Customer physical authority becomes GREEN:

- Jamaah `customer_id` remains PHYSICAL HOLD.
- Booking → Customer remains PHYSICAL HOLD.
- Customer → Company FK remains implementation HOLD.
- Customer → Branch FK remains implementation HOLD.
- `booking_passenger` parent reconciliation remains HOLD.
- Gate 015A remains HOLD.

---

## 8. Migration Readiness

Customer migration remains HOLD.

Before migration, Customer requires a separate controlled physical
contract that resolves:

1. exact table and PK;
2. exact Company/Branch columns;
3. PostgreSQL types and nullability;
4. Customer business identity;
5. status representation and authoritative values;
6. UNIQUE constraints;
7. indexes;
8. audit and soft-delete fields;
9. tenant/RLS enforcement;
10. forward migration;
11. rollback migration;
12. PostgreSQL validation.

---

## 9. Decision

APPROVED / LOCKED for dependency authority.

Canonical parent physical authorities:

```text
companies.company_id
branches.branch_id
```

Customer physical schema itself remains:

```text
HOLD / EVIDENCE GAP
```

No Customer migration is authorized by this decision.

---

## 10. Gate Status

Company Physical Authority Reconciliation: GREEN

Customer Parent Authority Reconciliation: GREEN

Customer Physical Schema: HOLD

Booking Physical Authority: HOLD

Jamaah Physical Authority: HOLD

booking_passenger Parent Reconciliation: HOLD

Gate 015A: HOLD
