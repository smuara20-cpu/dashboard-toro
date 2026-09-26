# LOCATION PROVINCE GAP RESOLUTION — DECISION 001

Decision ID: LOCATION-PROVINCE-GAP-RESOLUTION-001
Domain: Global Location / Database Architecture
Version: 1.0
Status: APPROVED / LOCKED
Decision Type: Physical Structure Gap Resolution
Implementation Status: HOLD — NO DATABASE CHANGE AUTHORIZED
Scope: public.provinces

## 1. PURPOSE

This decision resolves the documented structural gap between the approved Province Data Dictionary and the current physical public.provinces table.

The purpose is to establish an explicit governance decision for the three documented Province fields that are currently absent from the physical table: population, description, and sort_order.

No database modification is authorized by this artifact.

## 2. GOVERNANCE PRINCIPLE

Evidence → Reconciliation → Decision → Physical Contract → Implementation Approval → Migration → Validation

The approved Province Data Dictionary remains the authoritative source for the documented Province logical structure.
The existing public.provinces physical structure remains the current physical evidence.
No undocumented field, semantic, type, default, constraint, index, or business behavior may be invented.

## 3. AUTHORITATIVE EVIDENCE

### 3.1 Approved Province Data Dictionary

The approved Province Data Dictionary defines 20 physical data elements for Province.

The three fields not currently present in public.provinces are:

- population
- description
- sort_order

### 3.2 Current Physical Evidence

public.provinces currently contains 17 columns.

Existing physical structure includes:

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

Physical primary key remains public.provinces.id.

The existing country relationship is:

public.provinces.country_id → public.countries.id

Referential actions are RESTRICT on UPDATE and RESTRICT on DELETE.

## 4. GAP IDENTIFICATION

The reconciliation gap is limited to three documented fields:

| Field | Documented Authority | Current Physical State | Resolution Status |
|---|---|---|---|
| population | Province Data Dictionary | Not present | Requires physical contract resolution |
| description | Province Data Dictionary | Not present | Requires physical contract resolution |
| sort_order | Province Data Dictionary | Not present | Requires physical contract resolution |

No other Province physical column gap is authorized by this decision.

## 5. GAP RESOLUTION DECISION

The three fields population, description, and sort_order remain part of the approved Province logical/data-dictionary contract.

They SHALL NOT be silently removed from the Province Data Dictionary merely because they are absent from the current physical implementation.

At the physical implementation boundary, their exact PostgreSQL definition MUST be validated against the authoritative Province Data Dictionary before ALTER TABLE is authorized.

The following implementation properties remain governed and MUST NOT be guessed:

- PostgreSQL data type
- NULL / NOT NULL behavior
- default value
- index requirement
- uniqueness requirement
- soft-delete interaction
- existing-data compatibility
- downstream dependency impact
- API serialization impact
- Flutter model/data-layer impact
- reporting/dashboard impact
- AI/master-data consumption impact

## 6. PHYSICAL IMPLEMENTATION BOUNDARY

This decision does NOT authorize ALTER TABLE.

No column shall be added, renamed, removed, repurposed, or given a compatibility alias under this decision.

Before implementation, a separate physical implementation step MUST validate the exact column definitions against the approved Province Data Dictionary and the PostgreSQL/Supabase runtime.

## 7. EXISTING DATA IMPACT

Before adding any missing field, existing public.provinces data MUST be evaluated for compatibility with the authoritative field definition.

No default value, backfill value, generated value, or transformation rule may be invented.

No existing Province data may be silently modified.

Any required backfill or data transformation requires an explicit implementation/data-migration decision.

## 8. DOWNSTREAM DEPENDENCY IMPACT

The gap resolution does not authorize creation or modification of City, District, Village, Company, or other downstream structures.

Current downstream physical evidence remains unchanged:

- public.cities is not established
- public.districts is not established
- public.villages is not established
- public.companies is not established

Company Location FK implementation therefore remains governed by the existing Location Physical Contract and remains HOLD until its own implementation gates are satisfied.

## 9. DATABASE SAFETY BOUNDARY

The following operations are NOT authorized by this decision:

- CREATE TABLE
- ALTER TABLE
- DROP TABLE
- RENAME TABLE
- ADD COLUMN
- DROP COLUMN
- ALTER COLUMN
- RENAME COLUMN
- CREATE INDEX
- DROP INDEX
- CREATE CONSTRAINT
- DROP CONSTRAINT
- CREATE FUNCTION
- CREATE TRIGGER
- DML/data migration
- silent data repair
- silent schema compatibility changes

Database Change Authorized by this artifact: ZERO.

## 10. REQUIRED IMPLEMENTATION VALIDATION

Before physical implementation, the following must be validated:

1. Exact Province Data Dictionary definitions for population, description, and sort_order.
2. PostgreSQL-compatible data types.
3. Nullability and defaults.
4. Existing-data compatibility.
5. Index and uniqueness requirements.
6. Soft-delete interaction.
7. API and application dependency impact.
8. Dashboard/reporting dependency impact.
9. AI/master-data dependency impact.
10. Migration forward path.
11. Rollback strategy.
12. Supabase/PostgreSQL execution validation.

Only after these checks are satisfied may a separate implementation approval authorize schema change.

## 11. RELATION TO LOCATION PHYSICAL CONTRACT

This decision is subordinate to LOCATION-PHYSICAL-CONTRACT-001.

The physical naming and hierarchy contract remains unchanged:

- public.countries
- public.provinces
- public.cities
- public.districts
- public.villages

Province primary key remains public.provinces.id.

No PK alias, duplicate Province table, or namespace change is permitted.

## 12. FINAL STATUS

Province Physical Structure: PARTIAL / GAP RESOLUTION DEFINED

Missing documented fields:

- population
- description
- sort_order

Logical/Data Dictionary Authority: PRESERVED
Physical Schema Change: HOLD
Implementation Approval: REQUIRED SEPARATELY
Database Change: ZERO

## 13. APPROVAL BOUNDARY

This artifact is APPROVED / LOCKED as the governance decision for the Province structural gap.

APPROVED / LOCKED does not mean that ALTER TABLE is authorized.

The next implementation gate must independently validate the exact physical definitions and migration safety before any database schema modification.

## 14. FINAL GOVERNANCE STATEMENT

The Province Data Dictionary remains authoritative for the documented 20-field Province structure.
The current public.provinces implementation remains valid as existing physical evidence but is formally recognized as incomplete relative to that documented structure.
The three missing fields are not silently discarded and are not implemented by assumption.

Any physical addition must follow Evidence → Decision → Implementation Approval → Migration → Validation and must preserve existing data, PostgreSQL integrity, downstream compatibility, and rollback safety.
