# LOCATION PHYSICAL CONTRACT — DECISION 001

**Decision ID:** LOCATION-PHYSICAL-CONTRACT-001
**Domain:** Global Location / Database Architecture
**Version:** 1.0
**Status:** APPROVED / LOCKED
**Decision Type:** Physical Contract
**Implementation Status:** HOLD — CONTRACT APPROVED, MIGRATION NOT YET AUTHORIZED
**Scope:** Country → Province → City → District → Village

---

## 1. PURPOSE

Decision ini menetapkan physical contract untuk Global Location berdasarkan evidence dan reconciliation yang telah dikunci melalui:

- `LOCATION-PHYSICAL-AUTHORITY-RECONCILIATION-001`
- `LOCATION-COMPANY-FK-RECONCILIATION-001`
- `LOCATION-PHYSICAL-NAMING-STRUCTURE-RECONCILIATION-002`

Contract ini menetapkan physical identity, table naming, primary key mapping, dan parent-child hierarchy sebagai baseline sebelum migration SQL.

Decision ini tidak mengubah Data Dictionary atau ERD sumber secara diam-diam.

---

## 2. PHYSICAL AUTHORITY

Physical Location contract menggunakan PostgreSQL namespace `public` untuk seluruh physical Location hierarchy.

Logical/documented naming `md_*` pada District dan Village tidak menjadi physical table naming.

Physical Location tables yang dikontrakkan:

- `public.countries`
- `public.provinces`
- `public.cities`
- `public.districts`
- `public.villages`

---

## 3. PRIMARY KEY CONTRACT

| Entity | Physical Table | Primary Key |
|---|---|---|
| Country | `public.countries` | `id` |
| Province | `public.provinces` | `id` |
| City | `public.cities` | `id` |
| District | `public.districts` | `district_id` |
| Village | `public.villages` | `village_id` |

Primary key existing pada `public.countries` dan `public.provinces` tidak diubah.

District dan Village menggunakan documented identity `district_id` dan `village_id` sebagai physical primary key.

Decision ini tidak mengotorisasi alias primary key.

---

## 4. HIERARCHY CONTRACT

Physical hierarchy ditetapkan sebagai:

`countries → provinces → cities → districts → villages`

Relationship:

- `provinces.country_id → countries.id`
- `cities.province_id → provinces.id`
- `districts.city_id → cities.id`
- `villages.district_id → districts.district_id`

Country → Province → City → District → Village adalah hierarchy utama Global Location.

---

---

## 5. CONTROLLED DENORMALIZATION CONTRACT

District dan Village mempertahankan documented geographic references sebagai berikut:

- District: `country_id`, `province_id`, `city_id`.
- Village: `country_id`, `province_id`, `city_id`, `district_id`.

Field tersebut merupakan controlled denormalization sesuai documented Location architecture.

Physical contract tidak menghapus field tersebut.

Integrity antara direct parent dan denormalized geographic references wajib divalidasi pada database boundary.

Belum ada mekanisme trigger, composite constraint, function, atau mekanisme lain yang diotorisasi oleh Decision ini.

Implementasi mekanisme hierarchical integrity memerlukan validation dan decision implementation tersendiri sebelum migration.

---

## 6. COMPANY LOCATION FK CONTRACT

Company physical authority tetap menggunakan `companies` dengan primary key `company_id`.

Location FK target direkonsiliasi terhadap physical primary key yang telah ditetapkan:

| Company Column | Physical Location Target |
|---|---|
| `country_id` | `public.countries.id` |
| `province_id` | `public.provinces.id` |
| `city_id` | `public.cities.id` |
| `district_id` | `public.districts.district_id` |
| `village_id` | `public.villages.village_id` |

Mapping ini merupakan controlled reconciliation terhadap Company Data Dictionary.

Tidak dibuat alias primary key atau compatibility column untuk memenuhi naming lama.

Implementasi FK pada `companies` tetap memerlukan migration validation dan implementation approval.

---

## 7. PROVINCE STRUCTURE BOUNDARY

Physical `public.provinces` saat ini telah terbukti ada dan memiliki primary key `id` serta FK `country_id` ke `public.countries.id`.

Physical Province saat ini belum identik dengan seluruh approved Province Data Dictionary.

Existing physical columns dipertahankan.

Missing documented fields:

- `population`
- `description`
- `sort_order`

Decision ini tidak mengotorisasi ALTER TABLE untuk menambahkan field tersebut.

Province structure reconciliation menjadi implementation prerequisite terpisah sebelum perubahan physical structure.

---

## 8. HIERARCHICAL INTEGRITY BOUNDARY

Global Location wajib mempertahankan hierarchy:

`Country → Province → City → District → Village`

Direct parent FK wajib mengikuti:

- Province → Country
- City → Province
- District → City
- Village → District

Controlled denormalized references pada District dan Village juga wajib konsisten dengan hierarchy.

Decision ini belum memilih mekanisme enforcement fisik.

Trigger, composite FK, function, application-only validation, atau mekanisme lain tidak boleh dibuat tanpa decision implementation tersendiri.

---

---

## 9. COLUMN / STRUCTURE CONTRACT

### 9.1 Country

Physical authority: `public.countries`.

Existing physical structure is retained without alteration.

Primary key: `id`.

Country physical column structure follows the existing approved implementation and validated physical evidence.

Timestamp type remains `TIMESTAMP WITHOUT TIME ZONE` as currently implemented.

---

### 9.2 Province

Physical authority: `public.provinces`.

Existing physical structure is retained without alteration by this Decision.

Primary key: `id`.

Existing physical structure contains 17 columns.

Approved Province Data Dictionary contains 20 documented columns.

Known physical structure gap:

- `population`
- `description`
- `sort_order`

These missing fields are not silently added by this Decision.

Province structure reconciliation remains a separate implementation prerequisite.

---

### 9.3 City

Physical authority: `public.cities`.

Physical table is not yet established.

Primary key: `id`.

City physical structure SHALL follow the approved City Data Dictionary when implementation is authorized.

Documented parent reference:

- `province_id → public.provinces.id`

Documented City structure contains 21 columns.

Implementation SHALL validate the complete column definition, defaults, nullability, indexes, uniqueness, and FK dependencies before migration.

---

### 9.4 District

Physical authority: `public.districts`.

Physical table is not yet established.

Primary key: `district_id`.

District physical structure SHALL preserve the documented controlled-denormalized geographic references:

- `country_id`
- `province_id`
- `city_id`

Direct parent reference:

- `city_id → public.cities.id`

Documented District identity remains `district_id`.

Implementation SHALL validate complete column definition, defaults, nullability, indexes, uniqueness, FK dependencies, and hierarchical integrity before migration.

---

### 9.5 Village

Physical authority: `public.villages`.

Physical table is not yet established.

Primary key: `village_id`.

Village physical structure SHALL preserve the documented controlled-denormalized geographic references:

- `country_id`
- `province_id`
- `city_id`
- `district_id`

Direct parent reference:

- `district_id → public.districts.district_id`

Documented Village identity remains `village_id`.

Implementation SHALL validate complete column definition, defaults, nullability, indexes, uniqueness, FK dependencies, and hierarchical integrity before migration.

---

---

## 10. INDEX, UNIQUE & CONSTRAINT CONTRACT

### 10.1 Country

Existing validated physical constraints and indexes on `public.countries` remain unchanged.

Primary key:
- `pk_countries` on `id`.

Unique indexes:
- `uq_countries_iso_alpha2` on `iso_alpha2`.
- `uq_countries_iso_alpha3` on `iso_alpha3`.
- `uq_countries_name` on `name`.

Supporting index:
- `idx_countries_is_active` on `is_active`.

---

### 10.2 Province

Existing validated physical constraints and indexes on `public.provinces` remain unchanged.

Primary key:
- `pk_provinces` on `id`.

Foreign key:
- `fk_provinces_country`: `country_id → public.countries.id`.

Unique indexes:
- `uq_provinces_country_code` on `(country_id, code)`.
- `uq_provinces_country_name` on `(country_id, name)`.

Supporting indexes:
- `idx_provinces_country_id`.
- `idx_provinces_code`.
- `idx_provinces_name`.
- `idx_provinces_status`.
- `idx_provinces_is_active`.

---

### 10.3 City

Physical table: `public.cities`.

Primary key:
- `id`.

Required parent foreign key:
- `province_id → public.provinces.id`.

Unique requirements:
- `(province_id, name)`.
- `(province_id, code)`.

Supporting index requirements:
- `province_id`.
- `code`.
- `name`.
- `city_type`.
- `status`.
- `is_active`.
- `deleted_at`.
- `sort_order`.

Exact physical constraint and index names shall be validated during migration design before implementation.

---

### 10.4 District

Physical table: `public.districts`.

Primary key:
- `district_id`.

Required parent foreign key:
- `city_id → public.cities.id`.

Controlled-denormalized references:
- `country_id`.
- `province_id`.

Unique requirements:
- `(city_id, district_code)`.
- `(city_id, district_name)`.

Supporting index requirements:
- `district_code`.
- `district_name`.
- `city_id`.
- `province_id`.
- `country_id`.
- `is_active`.

Exact hierarchical integrity enforcement mechanism remains subject to separate implementation decision.

---

### 10.5 Village

Physical table: `public.villages`.

Primary key:
- `village_id`.

Required parent foreign key:
- `district_id → public.districts.district_id`.

Controlled-denormalized references:
- `country_id`.
- `province_id`.
- `city_id`.

Unique requirements:
- `(district_id, village_code)`.
- `(district_id, village_name)`.

Supporting index requirements:
- `village_code`.
- `village_name`.
- `district_id`.
- `city_id`.
- `province_id`.
- `country_id`.
- `postal_code`.
- `is_active`.

Exact hierarchical integrity enforcement mechanism remains subject to separate implementation decision.

---

### 10.6 Constraint Boundary

Primary keys and documented parent foreign keys are part of the physical contract.

Unique constraints SHALL prevent duplicate active geographic identities according to the approved Location Data Dictionaries.

Existing Country and Province physical constraints SHALL NOT be renamed, replaced, or duplicated by this Decision.

No cascade, SET NULL, trigger, composite foreign key, function, or application-only hierarchical enforcement is authorized by this section.

Any additional enforcement mechanism requires a separate implementation decision.

---

---

## 11. AUDIT, TIMESTAMP & SOFT DELETE CONTRACT

### 11.1 Audit Columns

Location physical tables SHALL preserve the approved audit-column structure for their respective Data Dictionaries.

Where the approved physical structure defines:
- `created_at`
- `created_by`
- `updated_at`
- `updated_by`
- `deleted_at`
- `deleted_by`

those columns SHALL NOT be silently removed, renamed, or repurposed.

### 11.2 Existing Country Timestamp Boundary

`public.countries` currently uses `TIMESTAMP WITHOUT TIME ZONE` for its timestamp columns.

This existing physical type SHALL remain unchanged by this Decision.

Any conversion to another timestamp type requires a separate approved implementation decision.

### 11.3 Existing Province Timestamp Boundary

`public.provinces` currently uses `TIMESTAMP WITHOUT TIME ZONE` for its timestamp columns.

This existing physical type SHALL remain unchanged by this Decision.

Any conversion to another timestamp type requires a separate approved implementation decision.

### 11.4 Soft Delete

Location entities use `deleted_at` and `deleted_by` where defined by the approved physical Data Dictionary.

Soft-deleted records SHALL NOT be physically purged by the Location migration.

No hard-delete, purge, cascade-delete, or SET NULL behavior is authorized by this Decision.

### 11.5 Audit Integrity

Audit columns SHALL retain their documented semantic meaning.

No audit column may be reused as a business attribute, geographic identifier, or hierarchy reference.

Exact foreign-key treatment for audit-user references shall be validated during implementation against the authoritative User physical contract.

### 11.6 Implementation Boundary

Timestamp type changes, audit foreign keys, automatic audit triggers, purge policies, and historical-data repair require separate implementation validation and approval.

---

---

## 12. DELETE / UPDATE BEHAVIOR CONTRACT

### 12.1 Delete Boundary

Location master records SHALL follow the approved soft-delete model where `deleted_at` and `deleted_by` are defined.

Physical deletion of Location master records SHALL NOT be performed by the Location migration.

Hard-delete and purge behavior are outside the scope of this Physical Contract.

### 12.2 Parent-Child Delete Behavior

Country, Province, City, District, and Village hierarchy SHALL NOT use destructive cascade behavior.

Existing Country and Province parent-child behavior SHALL remain unchanged.

Any physical DELETE/UPDATE referential action SHALL be validated against the approved Location Data Dictionary, ERD, and existing physical constraints before implementation.

### 12.3 Update Boundary

Primary-key geographic identity SHALL remain immutable after record creation.

Renaming, replacing, or aliasing primary keys is prohibited by this Contract.

Updates to parent references SHALL preserve the approved Country → Province → City → District → Village hierarchy.

### 12.4 Controlled Denormalized References

District `country_id` and `province_id` SHALL remain aligned with its City hierarchy.

Village `country_id`, `province_id`, and `city_id` SHALL remain aligned with its District hierarchy.

Changing these denormalized references SHALL require hierarchical-integrity validation.

### 12.5 Referential Action Boundary

No `ON DELETE CASCADE`, `ON DELETE SET NULL`, or equivalent destructive referential behavior is authorized by this Contract.

No automatic hierarchy-repair behavior is authorized by this Contract.

Any trigger, composite constraint, function, or other enforcement mechanism requires a separate approved implementation decision.

### 12.6 Implementation Gate

Delete/update behavior SHALL be validated against PostgreSQL/Supabase before migration implementation.

Validation SHALL include existing data, foreign-key behavior, soft-delete behavior, parent updates, rollback behavior, and hierarchical integrity.

---

## 13. DEPENDENCY & IMPLEMENTATION ORDER

### 13.1 Physical Dependency Order

Implementasi physical Location SHALL mengikuti urutan dependency berikut:

1. Country — public.countries
2. Province — public.provinces
3. City — public.cities
4. District — public.districts
5. Village — public.villages
6. Company Location Foreign Keys — companies

Setiap tahap SHALL hanya dilakukan setelah physical parent authority, primary key, foreign key target, constraint, index, existing-data condition, dan migration safety telah divalidasi.

### 13.2 Existing Physical Tables

public.countries dan public.provinces merupakan existing physical objects.

Migration SHALL NOT rename, replace, duplicate, atau silently alter existing Country/Province structures.

Province structure reconciliation SHALL be completed before any approved physical alteration to public.provinces.

### 13.3 New Physical Tables

public.cities, public.districts, dan public.villages SHALL only be created after their respective physical contracts and implementation gates are approved.

Table creation SHALL follow the parent-child dependency order defined in Section 13.1.

### 13.4 Company Dependency

Company Location foreign keys SHALL only be implemented after public.cities, public.districts, dan public.villages have authoritative physical primary keys and validated foreign-key targets.

Company physical authority remains companies.company_id.

### 13.5 Migration Boundary

No Location migration SHALL be executed solely from documented naming assumptions.

Migration SHALL include forward execution, validation, rollback strategy, existing-data validation, constraint validation, and PostgreSQL/Supabase compatibility validation.

### 13.6 Implementation Approval

Section 13 defines dependency order only.

It does not itself authorize CREATE TABLE, ALTER TABLE, DROP, RENAME, ADD CONSTRAINT, CREATE INDEX, CREATE FUNCTION, CREATE TRIGGER, data migration, or Company foreign-key implementation.

## 14. VALIDATION GATE / MIGRATION READINESS

### 14.1 Physical Authority Validation

Before migration, each Location physical table SHALL have authoritative evidence for table name, namespace, primary key, column structure, and existing physical state.

### 14.2 Primary Key & Foreign Key Validation

Before migration, each primary key and parent-child foreign key SHALL be validated against the approved physical contract and authoritative PostgreSQL/Supabase metadata.

### 14.3 Column & Constraint Validation

Before migration, column types, nullability, defaults, unique constraints, indexes, soft-delete fields, and referential actions SHALL be validated against the approved physical contract and existing PostgreSQL/Supabase metadata.

### 14.4 Existing Data Validation

Before migration or physical alteration, existing Location data SHALL be validated for primary-key integrity, foreign-key integrity, duplicate identities, nullability violations, soft-delete consistency, and hierarchy consistency.

### 14.5 Migration Safety & Rollback Validation

Before implementation, the migration SHALL have a validated forward path, rollback strategy, transaction boundary, failure handling, and PostgreSQL/Supabase compatibility.

### 14.6 Implementation Approval Gate

Location migration SHALL remain on HOLD until all validation gates in this section are satisfied and a separate implementation approval explicitly authorizes the database change.


## 15. DECISION BOUNDARY / PROHIBITIONS

### 15.1 Naming & Identity Prohibitions

No table, namespace, primary key, or geographic identity SHALL be renamed, aliased, replaced, duplicated, or silently reconciled outside this approved physical contract.

### 15.2 Migration & Database Change Prohibitions

No CREATE, ALTER, DROP, RENAME, constraint, index, function, trigger, or data migration SHALL be executed solely from this decision without separate implementation approval.

### 15.3 Data & Hierarchy Prohibitions

No silent data repair, duplicate Location master, automatic hierarchy repair, or Company foreign-key implementation SHALL be performed before the relevant validation and implementation gates are approved.

### 15.4 Authority & Scope Boundary

This decision governs the physical Location contract only. It does not replace the approved Location Data Dictionaries, ERDs, Company physical authority, or Identity & Access authority, and it does not authorize changes to tenant or SP-203 boundaries.

### 15.5 Security & Tenant Boundary

Location master data remains Global Master Data. This decision does not introduce tenant_id, company ownership, tenant RLS, tenant provisioning, or any change to the approved SP-203 identity and access boundary.

### 15.6 Implementation Status Boundary

The physical Location contract is APPROVED / LOCKED as a governance baseline, while database implementation remains HOLD until all required implementation approvals and validation gates are completed.
## 16. FINAL GOVERNANCE & APPROVAL BOUNDARY

### 16.1 Governance Status

This Location Physical Contract is APPROVED / LOCKED as the authoritative physical contract baseline for the Global Location hierarchy within the scope defined by this decision.

### 16.2 Implementation Status

Database implementation remains HOLD. Approval of this physical contract does not by itself authorize CREATE, ALTER, DROP, RENAME, constraint, index, function, trigger, or data migration operations.

### 16.3 Required Implementation Gates

Before database implementation, the required implementation gates SHALL validate physical table definitions, primary keys, parent-child foreign keys, controlled denormalized references, unique constraints, indexes, referential actions, existing data, hierarchical integrity, migration safety, rollback behavior, PostgreSQL/Supabase compatibility, and Company Location foreign-key targets.

### 16.4 Separate Implementation Approval

A separate implementation approval SHALL be required before any physical Location database change is executed. This decision does not constitute that implementation approval.

### 16.5 Authority Boundary

This decision remains subordinate to the approved Location Data Dictionaries, ERDs, Company physical authority, and Identity & Access authority within their respective scopes. No downstream module may infer additional physical authority from this decision beyond the explicitly contracted boundaries.

### 16.6 Final Decision Statement

The physical Location naming, namespace, primary-key mapping, hierarchy baseline, controlled denormalization boundary, Company Location FK mapping, and implementation HOLD boundary are established by this decision. Physical implementation SHALL proceed only through the subsequent validation and separate implementation-approval process.
