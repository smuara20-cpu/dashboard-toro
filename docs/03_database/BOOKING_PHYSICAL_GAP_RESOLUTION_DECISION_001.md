# BOOKING PHYSICAL GAP RESOLUTION DECISION 001

Version: 1.0
Status: HOLD / EVIDENCE GAP
Classification: Controlled Engineering Decision
Domain: Booking
Entity: Booking
Gate: 015A
Step: 5N-C

---

## 1. Purpose

Dokumen ini menutup Step 5N-C — Booking Physical Gap Resolution Discovery.

Tujuannya adalah merekam evidence tambahan yang ditemukan setelah
`BOOKING_PHYSICAL_CONTRACT_DECISION_001.md`, memisahkan logical/business
authority dari physical PostgreSQL authority, dan menetapkan gap yang masih
harus diselesaikan sebelum Booking dapat dipromosikan menjadi physical
authority APPROVED/LOCKED.

Dokumen ini tidak mengotorisasi migration.

---

## 2. Evidence Reviewed

### 2.1 Booking Number

Evidence dari BP-104 menunjukkan:

- Booking Number wajib ada.
- Booking Number harus unik.
- Booking Number dihasilkan otomatis oleh sistem.
- Booking Number bersifat permanen.

Decision:

```text
Business rule       APPROVED
Logical identity    APPROVED
Physical column     HOLD
Physical type       HOLD
UNIQUE constraint   HOLD
Generator strategy  HOLD
```

Evidence business tersebut belum menetapkan PostgreSQL type, length,
constraint implementation, sequence/algorithm, atau physical generator.

---

### 2.2 Customer Reference

Evidence architecture AD-018 menunjukkan adanya logical reference:

```text
booking.customer_id
```

BP-104 dan Booking business rules juga menetapkan Customer Reference
sebagai atribut wajib dan valid.

Namun Customer physical authority masih:

```text
HOLD / EVIDENCE GAP
```

Karena itu:

```text
booking.customer_id
    ↓
Logical architecture       APPROVED
Business requirement       APPROVED
Physical column            HOLD
Physical FK                HOLD
```

Tidak boleh dibuat FK Booking → Customer sebelum Customer physical
authority dan FK target-nya authoritative.

---

### 2.3 Package Reference

BP-104 menetapkan Package Reference sebagai bagian dari Booking.

Evidence BP-105 menunjukkan Package sebagai domain owner untuk Package
Master dan Booking melakukan validation terhadap Package Reference.

Namun tidak ditemukan physical Package table authority yang cukup untuk
menetapkan:

- physical `package_id`
- PostgreSQL type
- FK target
- nullability
- indexes

Decision:

```text
Package Reference logical authority     APPROVED
Physical Package reference              HOLD
Physical Package FK                     HOLD
```

Generic naming convention seperti `package_id` tidak dengan sendirinya
menjadi physical schema authority.

---

### 2.4 Booking Owner

BP-104 menetapkan Booking Owner sebagai business attribute dan required
Booking rule.

AD-018 mempunyai Booking Ownership architecture.

Namun belum ada physical authority yang menetapkan:

- exact owner column
- PostgreSQL type
- FK target
- nullability
- indexes

Decision:

```text
Booking Owner logical authority         APPROVED
Physical owner reference                HOLD
Physical FK                             HOLD
```

---

### 2.5 Booking Status

Evidence Booking Domain menetapkan Booking Status sebagai logical
attribute/value object dan mendefinisikan lifecycle/status transitions.

Namun belum ada Booking-specific physical decision yang menetapkan:

- PostgreSQL representation
- ENUM vs CHECK vs lookup
- authoritative physical values
- nullability
- status indexes

Decision:

```text
Booking Status logical authority        APPROVED
Physical status strategy                HOLD
Physical status constraints             HOLD
```

Logical lifecycle tidak boleh langsung diterjemahkan menjadi PostgreSQL
ENUM atau CHECK tanpa controlled physical decision.

---

### 2.6 Currency and Amount

Enterprise architecture memberikan evidence bahwa sistem mendukung
multi-currency dan monetary records memerlukan currency context.

Booking business model mencakup Currency dan Total Amount.

Namun belum ada Booking-specific physical decision mengenai:

- currency PostgreSQL type
- amount PostgreSQL type
- precision/scale
- currency reference
- rounding rules
- amount/currency constraint

Decision:

```text
Currency logical authority              APPROVED
Amount logical authority                APPROVED
Physical currency mapping               HOLD
Physical amount mapping                 HOLD
Precision/scale                         HOLD
```

---

## 3. Evidence Classification

| Evidence | Classification | Physical Authority |
|---|---|---|
| Booking Number unique | Business authority | HOLD |
| Booking Number auto-generated | Business authority | HOLD |
| Booking Number permanent | Business authority | HOLD |
| `booking.customer_id` | Logical architecture | HOLD |
| Customer Reference required | Business authority | HOLD |
| Package Reference | Logical/business authority | HOLD |
| Package ownership BP-105 | Domain authority | HOLD |
| Booking Owner | Logical/business authority | HOLD |
| Booking Status lifecycle | Logical/domain authority | HOLD |
| Currency | Logical/enterprise architecture | HOLD |
| Total Amount | Logical/business authority | HOLD |
| `CREATE TABLE booking` | Physical SQL | NOT FOUND |
| Booking migration | Physical SQL | NOT FOUND |
| Booking PK | Physical authority | NOT FOUND |
| Booking FK definitions | Physical authority | NOT FOUND |
| Booking indexes | Physical authority | NOT FOUND |

---

## 4. Physical Gap Matrix

| Physical Concern | Current Evidence | Decision |
|---|---|---|
| Parent table `booking` | No CREATE TABLE | HOLD |
| PK | No Booking physical decision | HOLD |
| `tenant_id` | Tenant architecture exists; Booking-specific mapping absent | HOLD |
| Booking Number column | Business authority only | HOLD |
| Booking Number UNIQUE | Business requirement only | HOLD |
| Booking Number generator | Business requirement only | HOLD |
| `customer_id` | Logical architecture evidence | HOLD |
| Customer FK | Customer physical authority HOLD | HOLD |
| Package reference | Logical/business evidence | HOLD |
| Package FK | Package physical authority absent | HOLD |
| Booking Owner | Logical/business evidence | HOLD |
| Booking Owner FK | Physical target absent | HOLD |
| Booking Date | Business evidence | HOLD |
| Booking Status | Logical lifecycle evidence | HOLD |
| Status physical strategy | No physical decision | HOLD |
| Currency | Logical/enterprise evidence | HOLD |
| Total Amount | Logical/business evidence | HOLD |
| Amount precision/scale | No physical decision | HOLD |
| Audit fields | Generic conventions only | HOLD |
| Soft-delete/archive | Business rule exists; physical implementation absent | HOLD |
| UNIQUE constraints | No Booking physical decision | HOLD |
| Indexes | No Booking physical decision | HOLD |
| Migration | No physical contract approval | HOLD |
| Rollback | No migration | HOLD |

---

## 5. Important Negative Evidence

The following were specifically searched and not found as authoritative
physical Booking implementation:

```text
CREATE TABLE booking
CREATE TABLE customer
CREATE TABLE jamaah
```

The current physical SQL inventory remains limited to:

```text
booking_passenger
acquisition_spend
```

The existing `booking_passenger` table references:

```text
booking.id
jamaah.id
```

but this child relationship does not establish the parent physical
schemas.

---

## 6. Dependency Impact

### Customer

Customer physical authority remains HOLD.

Therefore:

```text
booking.customer_id → customer
```

cannot yet be physically authorized.

### Package

Package physical authority is not established.

Therefore Booking → Package FK remains HOLD.

### Jamaah

Jamaah minimum physical contract exists, but PostgreSQL mapping and
parent Customer authority remain incomplete.

Therefore:

```text
booking_passenger
```

remains parent-dependent.

### Company / Branch

Company and Branch physical authorities have been reconciled.

However, the reviewed Booking evidence does not establish exact Booking
Company/Branch physical columns or FK requirements.

No such fields may be invented.

---

## 7. Decision

The additional evidence materially strengthens Booking's business and
logical authority, but does not establish a complete PostgreSQL physical
contract.

Therefore:

```text
Booking Business Authority        APPROVED
Booking Logical Authority         APPROVED
Booking Physical Authority       HOLD / EVIDENCE GAP
Booking Migration                HOLD
Gate 015A                        HOLD
```

No migration is authorized.

No `CREATE TABLE booking` is authorized.

No modification of `booking_passenger` is authorized solely by this
decision.

---

## 8. Required Next Closure

Before Booking Physical Authority can become APPROVED/LOCKED, the next
controlled decision must resolve the exact PostgreSQL physical contract,
including:

1. Parent table and PK.
2. Tenant boundary.
3. Booking Number physical column and uniqueness.
4. Booking Number generation strategy.
5. Customer physical reference and FK.
6. Package physical reference and FK.
7. Booking Owner physical reference and FK.
8. Booking Date type/nullability.
9. Booking Status physical representation and authoritative values.
10. Currency representation.
11. Total Traveler representation.
12. Total Amount type and precision/scale.
13. Audit fields.
14. Archive/soft-delete physical behavior.
15. UNIQUE constraints.
16. Indexes.
17. Tenant-safe relationship constraints.
18. Migration.
19. Rollback.
20. PostgreSQL execution validation.

No item may be silently inferred from generic standards.

---

## 9. Governance

The controlled sequence remains:

```text
Evidence
→ Decision
→ Implementation
→ Validation
→ Approval
→ Commit / Push
```

This decision records evidence and gaps only.

It does not authorize schema invention or direct migration.

---

## 10. Status

```text
5N-C Physical Gap Resolution Discovery    GREEN
Booking Business Authority                APPROVED
Booking Logical Authority                 APPROVED
Booking Physical Authority                HOLD
Booking Migration                         HOLD
Gate 015A                                 HOLD
```

---

## 11. Next Controlled Step

Next:

**Step 5N-D — Exact Physical Contract Readiness**

Objective:

Determine whether the evidence base is sufficient to construct a
Booking-specific PostgreSQL physical contract without assumptions.

If evidence remains insufficient, the contract will remain HOLD and the
remaining gaps will be explicitly documented.

No migration will be created until the physical contract is
APPROVED/LOCKED.
