# JAMAAH DB PHYSICAL DECISION 001

Version: 1.0
Status: APPROVED
Classification: Controlled Engineering Decision
Domain: Jamaah
Entity: ENT-011 Jamaah

---

## 1. Purpose

Dokumen ini menetapkan physical persistence contract minimum untuk
Jamaah MVP agar implementasi Data Layer dapat dimulai tanpa menunggu
physical database blueprint yang lebih detail.

Keputusan ini merupakan controlled engineering decision dan tidak
mengubah ownership/domain contract yang telah disetujui.

---

## 2. Authority

Urutan authority:

1. VENTRA Development Constitution
2. Approved Business Blueprint
3. Approved Domain Contract
4. Approved Database Architecture
5. JAMAAH DB Physical Decision 001
6. Implementation Source Code

Decision ini tidak boleh bertentangan dengan authority di atas.

---

## 3. Table Scope

Primary table:

    jamaah

Deferred related tables:

    jamaah_passport
    jamaah_medical
    jamaah_mahram
    jamaah_room
    jamaah_group

Related tables tidak termasuk dalam first Jamaah Data Layer slice.

---

## 4. Physical MVP Contract

Table: jamaah

| Field | Type Concept | Required | Purpose |
|---|---|---:|---|
| id | UUID | YES | Stable internal identifier |
| tenant_id | UUID | YES | Tenant isolation |
| customer_id | UUID | YES | Customer relationship |
| jamaah_code | STRING | YES | Human-readable business identity |
| identity_data | STRUCTURED DATA | YES | Jamaah identity boundary |
| status | STRING | YES | Domain status |
| lifecycle | STRING | YES | Lifecycle state |
| created_at | TIMESTAMP | YES | Creation audit metadata |
| updated_at | TIMESTAMP | YES | Update audit metadata |
| deleted_at | TIMESTAMP | NO | Soft delete |

---

## 5. Identity Boundary

The first physical slice does not finalize individual identity
columns such as:

- full_name
- gender
- birth_date
- birth_place
- NIK
- phone
- email
- address

These remain inside the identity boundary until a dedicated
physical identity decision is approved.

The application/domain layer must not expose database-specific
implementation details.

---

## 6. Tenant Isolation

Every Jamaah persistence operation is tenant scoped.

The tenant context is mandatory for read operations.

Cross-tenant access is prohibited.

The application must not rely on UI filtering as the security
boundary.

---

## 7. Customer Relationship

Current business flow requires Jamaah to reference Customer.

Physical MVP uses:

    customer_id

The relationship represents the current Customer -> Jamaah business
relationship.

Jamaah remains a separate domain entity from Customer.

---

## 8. Business Identity

Internal identity:

    id

Business identity:

    jamaah_code

These identities must not be conflated.

The business number is not used as the primary key.

---

## 9. Status and Lifecycle

Status and lifecycle are separate concepts.

Physical persistence stores both values.

Final domain enum values remain controlled by the Jamaah domain
contract and must not be expanded by the UI layer.

---

## 10. Audit

Minimum persistence audit fields:

    created_at
    updated_at

Actor fields remain part of the domain/application audit contract
and must not be invented as additional physical columns in this
first slice.

---

## 11. Soft Delete

Hard delete is not part of the first Jamaah repository contract.

Soft deletion uses:

    deleted_at

A deleted Jamaah must not appear in normal active/read queries unless
an explicit future administrative/recovery contract allows it.

---

## 12. Security Classification

Jamaah identity information is controlled data.

Passport and medical information are more sensitive and remain in
their dedicated related domains/tables.

No anonymous Jamaah access is permitted.

---

## 13. Deferred Decisions

The following remain separate future decisions:

- Detailed identity physical columns
- Passport physical contract
- Medical physical contract
- Mahram physical contract
- Room allocation physical contract
- Jamaah group physical contract
- Final status enum values
- Final lifecycle enum values
- Advanced unique constraints
- Advanced composite indexes
- External API persistence contract

---

## 14. Implementation Boundary

This decision authorizes implementation of:

- JamaahModel
- JamaahMapper
- JamaahDataSource
- JamaahRepositoryImpl

for the primary `jamaah` slice only.

It does not authorize implementation of the deferred related tables.

---

## 15. Governance

Any change to this physical contract requires a new controlled
engineering decision.

Do not silently modify the contract from UI requirements.

---

## 16. Acceptance

JAMAAH-DB-PHYSICAL-DECISION-001:

    APPROVED

Implementation status:

    READY FOR DATA LAYER