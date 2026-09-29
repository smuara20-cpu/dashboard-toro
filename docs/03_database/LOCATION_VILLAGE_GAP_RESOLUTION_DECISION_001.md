# LOCATION VILLAGE GAP RESOLUTION DECISION 001

Status : APPROVED
Version : 1.0
Decision Type : Physical Database Gap Resolution
Domain : Global Master Data - Location
Scope : Country → Province → City → District → Village

---

## 1. PURPOSE

Dokumen ini menyelesaikan gap antara:

1. Village Data Dictionary v1.1 yang telah APPROVED.
2. LOCATION_PHYSICAL_CONTRACT_DECISION_001.md yang telah menetapkan physical contract Village.

Keputusan ini menjadi dasar penyusunan physical migration Village.

Dokumen ini tidak mengubah Data Dictionary dan tidak mengubah Physical Contract yang telah disetujui.

---

## 2. EVIDENCE BASE

### 2.1 Village Data Dictionary

Source:

docs/03_database/master_data/global/location/village/data_dictionary.md

Status:
APPROVED

Version:
1.1

Documented table:
md_village

Documented primary key:
village_id

### 2.2 Location Physical Contract

Source:

docs/03_database/LOCATION_PHYSICAL_CONTRACT_DECISION_001.md

Physical target:
public.villages

Physical primary key:
village_id

Required parent relationship:

district_id → public.districts.district_id

---

## 3. IDENTIFIED GAP

Physical Contract Section 9.5 menetapkan:

- physical table public.villages
- primary key village_id
- parent foreign key district_id → public.districts.district_id
- controlled-denormalized country_id
- controlled-denormalized province_id
- controlled-denormalized city_id
- uniqueness requirements
- supporting index requirements

Namun Section 9.5 belum menetapkan complete physical column definition.

Village Data Dictionary v1.1 telah menetapkan complete approved column definition.

Dengan demikian terdapat gap:

APPROVED DATA DICTIONARY
→ complete column definition available

PHYSICAL CONTRACT
→ physical identity and constraint boundary available
→ complete column definition not explicitly repeated

---

## 4. GAP RESOLUTION

Gap diselesaikan dengan menggunakan Village Data Dictionary v1.1 sebagai sumber complete physical column definition.

Physical implementation SHALL preserve the complete approved Village Data Dictionary structure.

Physical table:

public.villages

Physical primary key:

village_id

---

## 5. APPROVED PHYSICAL COLUMN BASELINE

Physical table public.villages SHALL contain exactly the following 17 columns:

| Column | Data Type | Null | Default |
|---|---|---|---|
| village_id | UUID | NOT NULL | gen_random_uuid() |
| country_id | UUID | NOT NULL | - |
| province_id | UUID | NOT NULL | - |
| city_id | UUID | NOT NULL | - |
| district_id | UUID | NOT NULL | - |
| village_code | VARCHAR(30) | NOT NULL | - |
| village_name | VARCHAR(150) | NOT NULL | - |
| postal_code | VARCHAR(10) | NULL | NULL |
| latitude | DECIMAL(10,8) | NULL | NULL |
| longitude | DECIMAL(11,8) | NULL | NULL |
| is_active | BOOLEAN | NOT NULL | TRUE |
| created_at | TIMESTAMP | NOT NULL | NOW() |
| created_by | UUID | NOT NULL | - |
| updated_at | TIMESTAMP | NULL | NULL |
| updated_by | UUID | NULL | NULL |
| deleted_at | TIMESTAMP | NULL | NULL |
| deleted_by | UUID | NULL | NULL |

No additional Village column is authorized by this Decision.

No existing approved Village column may be removed or renamed by this Decision.

---

## 6. PRIMARY KEY

The physical primary key SHALL be:

village_id

The physical constraint SHALL represent the Village identity defined by the approved Data Dictionary.

---

## 7. HIERARCHY AND FOREIGN KEY

The required physical parent relationship SHALL be:

district_id → public.districts.district_id

The physical implementation SHALL enforce this relationship through a foreign key.

The controlled-denormalized geographic references SHALL remain:

- country_id
- province_id
- city_id

This Decision does NOT authorize additional foreign keys for country_id, province_id, or city_id because the Physical Contract explicitly identifies district_id as the required direct parent reference.

---

## 8. UNIQUE REQUIREMENTS

The physical implementation SHALL enforce:

1. district_id + village_code
2. district_id + village_name

These constraints represent Village identity uniqueness within a District.

No additional Village uniqueness rule is authorized by this Decision.

---

## 9. INDEX REQUIREMENTS

The physical implementation SHALL provide supporting indexes for:

- village_code
- village_name
- district_id
- city_id
- province_id
- country_id
- postal_code
- is_active

The primary key and unique constraints are additional required physical structures.

Exact physical constraint and index names SHALL be defined in the migration artifact.

---

## 10. AUDIT AND SOFT DELETE

The approved audit fields SHALL remain:

- created_at
- created_by
- updated_at
- updated_by
- deleted_at
- deleted_by

Village SHALL use soft delete.

Permanent physical deletion is not authorized by this Decision.

---

## 11. HIERARCHICAL INTEGRITY BOUNDARY

This Decision authorizes only the documented direct parent foreign key:

district_id → public.districts.district_id

The following are NOT authorized:

- cascade
- SET NULL
- trigger
- composite foreign key
- database function for hierarchy enforcement
- application-only replacement for the required district foreign key
- duplicate Village physical table
- duplicate md_village physical implementation
- modification of existing Country physical structure
- modification of existing Province physical structure
- modification of existing City physical structure
- modification of existing District physical structure

Any additional hierarchical enforcement mechanism requires a separate implementation decision.

---

## 12. PHYSICAL NAMING

Logical/documented naming:

md_village

Physical naming:

public.villages

Primary key:

village_id

The logical md_village naming SHALL NOT be created as a second physical table.

---

## 13. DATA SAFETY

Village migration SHALL be additive only.

The migration SHALL NOT:

- modify existing Country data
- modify existing Province data
- modify existing City data
- modify existing District data
- rename existing tables
- rename existing columns
- drop existing constraints
- drop existing indexes
- create duplicate location tables
- create triggers
- create functions
- create cascading relationships

The migration SHALL create only the approved Village physical structures.

---

## 14. IMPLEMENTATION GATE

This Decision authorizes preparation of:

docs/03_database/LOCATION_VILLAGE_MIGRATION_001.sql

The migration artifact SHALL follow this Decision exactly.

Database execution is a separate gate and requires explicit approval after migration review.

---

## 15. VALIDATION GATE

After database execution, validation SHALL verify at minimum:

1. public.villages exists as TABLE.
2. Exactly 17 approved columns exist.
3. village_id is the PRIMARY KEY.
4. district_id foreign key references public.districts.district_id.
5. district_id + village_code uniqueness exists.
6. district_id + village_name uniqueness exists.
7. Required supporting indexes exist.
8. Required NOT NULL columns are enforced.
9. Required defaults are enforced.
10. Referential action is validated.
11. Initial row count is validated.
12. Required null checks are validated.
13. No unauthorized Village trigger exists.
14. No unauthorized Village function/routine exists.
15. Existing Country/Province/City/District structures remain unchanged.

---

## 16. GOVERNANCE DECISION

Decision:

APPROVED

Physical authority:

public.villages

Logical authority:

md_village

Column authority:

Village Data Dictionary v1.1

Physical constraint authority:

LOCATION_PHYSICAL_CONTRACT_DECISION_001.md

Parent authority:

public.districts.district_id

Migration authority:

This Decision

Execution authority:

Separate explicit database execution approval

Validation authority:

Separate Village Implementation Validation Gate

---

## 17. STATUS

Village Evidence Gate:
GREEN

Village Physical Gap:
RESOLVED

Village Physical Contract:
GREEN

Migration:
NOT YET EXECUTED

Database:
NOT YET MODIFIED

Validation:
NOT YET STARTED

Final Village Approval:
DEFERRED UNTIL IMPLEMENTATION VALIDATION

---

## 18. NEXT APPROVED STEP

Prepare:

LOCATION_VILLAGE_MIGRATION_001.sql

No database execution is authorized by this document alone.

---

Decision State:

APPROVED / LOCKED
