# LOCATION PROVINCE STRUCTURE RECONCILIATION — DECISION 001

Decision ID: LOCATION-PROVINCE-STRUCTURE-RECONCILIATION-001
Domain: Global Location / Database Architecture
Version: 1.0
Status: APPROVED / LOCKED
Decision Type: Physical Structure Reconciliation
Implementation Status: HOLD — NO DATABASE CHANGE AUTHORIZED
Scope: public.provinces

---

## 1. PURPOSE

This decision records and governs the reconciliation of the approved Province Data Dictionary against the currently established physical PostgreSQL structure of public.provinces.

The purpose is to establish an explicit evidence boundary before any ALTER TABLE, migration, schema expansion, or structural repair is considered.

This decision does not silently modify the Province Data Dictionary, Physical Contract, existing database structure, or downstream Company Location foreign-key boundary.

---

## 2. GOVERNANCE PRINCIPLE

Implementation SHALL follow:

Evidence → Reconciliation → Decision → Physical Contract → Implementation Approval → Migration → Validation

No database change SHALL be executed from an unresolved structural discrepancy.

---

## 3. AUTHORITATIVE EVIDENCE

### 3.1 Province Data Dictionary

The approved Province Data Dictionary defines a 20-column Province structure.

The documented structure includes:

- id
- country_id
- code
- name
- official_name
- capital
- iso_code
- area_km2
- timezone
- population
- description
- sort_order
- status
- is_active
- created_at
- created_by
- updated_at
- updated_by
- deleted_at
- deleted_by

### 3.2 Existing Physical Evidence

The currently established physical table is:

- Schema: public
- Table: provinces
- Primary Key: id

Current physical structure contains 17 columns.

Verified physical columns:

- id
- country_id
- code
- name
- official_name
- capital
- iso_code
- area_km2
- timezone
- status
- is_active
- created_at
- created_by
- updated_at
- updated_by
- deleted_at
- deleted_by

### 3.3 Existing Physical Constraints

Verified Province physical constraints and indexes include:

- Primary key: pk_provinces on id
- Foreign key: fk_provinces_country
- Foreign key target: public.countries(id)
- Foreign key update rule: RESTRICT
- Foreign key delete rule: RESTRICT
- Unique index: uq_provinces_country_code on (country_id, code)
- Unique index: uq_provinces_country_name on (country_id, name)
- Supporting indexes for country_id, code, name, status, and is_active

These existing physical structures SHALL NOT be renamed, replaced, duplicated, or silently modified by this decision.

---

## 4. RECONCILIATION GAP

The approved Province Data Dictionary contains 20 columns, while the established physical public.provinces table contains 17 columns.

The following three documented columns are currently absent from the physical table:

1. population
2. description
3. sort_order

Therefore the current physical Province structure is classified as PARTIAL.

---

## 5. RECONCILIATION DECISION

### 5.1 Current Physical Structure

The existing public.provinces physical structure SHALL remain unchanged under this decision.

### 5.2 Missing Columns

The absence of population, description, and sort_order is formally recorded as an unresolved physical-structure reconciliation gap.

This decision does NOT authorize adding, removing, renaming, changing type, changing nullability, or changing defaults for these columns.

### 5.3 Data Dictionary Boundary

The approved Province Data Dictionary remains the documented structure authority.

This decision does not silently revise the Data Dictionary to match the current physical implementation.

### 5.4 Physical Contract Boundary

The approved Location Physical Contract remains authoritative for the contracted physical naming, namespace, primary-key mapping, and hierarchy boundary.

Province physical structure remains subject to the explicit reconciliation prerequisite recorded in that contract.

---

## 6. IMPLEMENTATION HOLD

Until the three-column reconciliation is separately resolved and approved:

- No ALTER TABLE public.provinces is authorized.
- No column shall be added solely to make the physical table match the Data Dictionary.
- No Data Dictionary field shall be removed solely to match the current physical table.
- No existing column shall be renamed or repurposed.
- No compatibility or alias column shall be introduced.
- No data migration or silent data repair shall be performed.

Implementation status remains HOLD.

---

## 7. REQUIRED FOLLOW-UP VALIDATION

Before any Province structural implementation approval, the following SHALL be validated:

1. Business purpose of population.
2. Business purpose of description.
3. Business purpose of sort_order.
4. Required data type for each field.
5. Nullability for each field.
6. Default value, if any.
7. Index requirement, if any.
8. Unique constraint requirement, if any.
9. Existing-data impact.
10. Backward compatibility.
11. PostgreSQL/Supabase compatibility.
12. Forward migration strategy.
13. Rollback strategy.
14. Impact on downstream Location consumers.
15. Impact on Company Location FK implementation.

Only after these validations may a separate physical implementation decision authorize schema change.

---

## 8. DOWNSTREAM DEPENDENCY BOUNDARY

Current validation found no public.city_id, district_id, or village_id columns in the existing public schema.

public.cities, public.districts, public.villages, and public.companies are not currently established as physical tables in the validated public schema.

Therefore this decision does not authorize creation of downstream Location tables or Company Location foreign keys.

Those implementations remain governed by the approved Location Physical Contract and their respective validation and implementation gates.

---

## 9. DATABASE SAFETY BOUNDARY

This decision authorizes no database operation.

Prohibited under this decision:

- CREATE TABLE
- ALTER TABLE
- DROP TABLE
- RENAME
- ADD COLUMN
- DROP COLUMN
- ALTER COLUMN
- CREATE INDEX
- DROP INDEX
- CREATE CONSTRAINT
- DROP CONSTRAINT
- CREATE FUNCTION
- CREATE TRIGGER
- data migration
- silent data repair

Any such operation requires a separate implementation approval.

---

## 10. FINAL STATUS

Province Physical Structure:

PARTIAL / RECONCILIATION REQUIRED

Physical public.provinces remains unchanged.

The three-column discrepancy — population, description, and sort_order — is formally recorded and remains unresolved until a subsequent approved reconciliation decision.

Implementation remains HOLD.

Database Change under this decision: ZERO.

---

## 11. APPROVAL BOUNDARY

This decision is APPROVED / LOCKED as a governance and evidence artifact.

Approval of this decision does not constitute approval to modify public.provinces.

A separate implementation approval SHALL be required before any physical schema change.

---

## 12. RELATION TO EXISTING GOVERNANCE

This decision follows and does not replace:

- Approved Province Data Dictionary
- Approved Global Location Architecture Review
- LOCATION-COMPANY-FK-RECONCILIATION-001
- LOCATION-PHYSICAL-AUTHORITY-RECONCILIATION-001
- LOCATION-PHYSICAL-NAMING-STRUCTURE-RECONCILIATION-002
- LOCATION-PHYSICAL-CONTRACT-001

This decision preserves the approved Global Master, Location, Company, tenant, and SP-203 authority boundaries.

---

## 13. FINAL GOVERNANCE STATEMENT

The current public.provinces physical implementation is valid as existing database evidence but is not fully reconciled with the approved Province Data Dictionary.

The missing population, description, and sort_order fields SHALL NOT be silently added or removed.

Province implementation SHALL proceed only after the structural gap is explicitly validated, decided, approved, and implemented through the established governance sequence.

**APPROVED / LOCKED — IMPLEMENTATION HOLD — DATABASE CHANGE ZERO**
