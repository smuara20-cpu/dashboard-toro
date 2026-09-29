# LOCATION VILLAGE IMPLEMENTATION VALIDATION 001

Status : VALIDATED / APPROVED / LOCKED
Version : 1.0
Domain : Master Data - Global Location
Physical Authority : public.villages
Parent Physical Authority : public.districts
Validation Environment : VENTRA-DEV
Validation Date : 2026-09-29

---

## 1. PURPOSE

Dokumen ini mencatat hasil validasi implementasi fisik Village setelah
`LOCATION_VILLAGE_GAP_RESOLUTION_DECISION_001.md` dan
`LOCATION_VILLAGE_MIGRATION_001.sql` disetujui dan dieksekusi.

Dokumen ini menjadi validation artifact untuk memastikan bahwa physical
implementation `public.villages` sesuai dengan physical contract yang
telah disetujui.

---

## 2. AUTHORITY

Logical Data Dictionary:

`docs/03_database/master_data/global/location/village/data_dictionary.md`

Physical Contract:

`docs/03_database/LOCATION_PHYSICAL_CONTRACT_DECISION_001.md`

Gap Resolution Decision:

`docs/03_database/LOCATION_VILLAGE_GAP_RESOLUTION_DECISION_001.md`

Migration Artifact:

`docs/03_database/LOCATION_VILLAGE_MIGRATION_001.sql`

Physical Authority:

`public.villages`

---

## 3. PHYSICAL OBJECT VALIDATION

Validated object:

`public.villages`

Result:

- Object exists.
- Object type = TABLE.
- No duplicate Village physical object was identified by the executed
  Village object safety check.

Status:

**GREEN**

---

## 4. COLUMN VALIDATION

Physical implementation contains 17 columns.

Validated structure:

| # | Column | Type | Null | Default |
|---|---|---|---|---|
| 1 | village_id | UUID | NO | gen_random_uuid() |
| 2 | country_id | UUID | NO | NULL |
| 3 | province_id | UUID | NO | NULL |
| 4 | city_id | UUID | NO | NULL |
| 5 | district_id | UUID | NO | NULL |
| 6 | village_code | VARCHAR(30) | NO | NULL |
| 7 | village_name | VARCHAR(150) | NO | NULL |
| 8 | postal_code | VARCHAR(10) | YES | NULL |
| 9 | latitude | NUMERIC(10,8) | YES | NULL |
| 10 | longitude | NUMERIC(11,8) | YES | NULL |
| 11 | is_active | BOOLEAN | NO | TRUE |
| 12 | created_at | TIMESTAMP | NO | NOW() |
| 13 | created_by | UUID | NO | NULL |
| 14 | updated_at | TIMESTAMP | YES | NULL |
| 15 | updated_by | UUID | YES | NULL |
| 16 | deleted_at | TIMESTAMP | YES | NULL |
| 17 | deleted_by | UUID | YES | NULL |

Column validation result:

**GREEN**

---

## 5. PRIMARY KEY VALIDATION

Primary key:

`pk_villages`

Column:

`village_id`

Result:

- Primary key exists.
- Primary key column is `village_id`.
- Physical identity matches the approved Village contract.

Status:

**GREEN**

---

## 6. FOREIGN KEY VALIDATION

Required parent relationship:

`district_id → public.districts.district_id`

Validated constraint:

`fk_villages_district`

Result:

- Foreign key exists.
- Source column = `district_id`.
- Referenced table = `public.districts`.
- Referenced column = `district_id`.

Referential actions:

- ON UPDATE = RESTRICT
- ON DELETE = RESTRICT

Status:

**GREEN**

---

## 7. UNIQUE CONSTRAINT VALIDATION

Required Village uniqueness:

1. `(district_id, village_code)`
2. `(district_id, village_name)`

Validated physical unique indexes:

- `uq_villages_district_code`
- `uq_villages_district_name`

Result:

**GREEN**

---

## 8. SUPPORTING INDEX VALIDATION

Required supporting indexes:

- `village_code`
- `village_name`
- `district_id`
- `city_id`
- `province_id`
- `country_id`
- `postal_code`
- `is_active`

Validated physical indexes:

- `idx_villages_village_code`
- `idx_villages_village_name`
- `idx_villages_district_id`
- `idx_villages_city_id`
- `idx_villages_province_id`
- `idx_villages_country_id`
- `idx_villages_postal_code`
- `idx_villages_is_active`

Primary key index:

- `pk_villages`

Total validated indexes:

**11**

Status:

**GREEN**

---

## 9. DATA INTEGRITY VALIDATION

Village validation query returned:

- Required-null violation for `village_id` = 0
- Required-null violation for `country_id` = 0
- Required-null violation for `province_id` = 0
- Required-null violation for `city_id` = 0
- Required-null violation for `district_id` = 0
- Required-null violation for `village_code` = 0
- Required-null violation for `village_name` = 0

Village data integrity result:

**GREEN**

The physical table is currently empty and therefore contains no
invalid Village rows.

---

## 10. TRIGGER / ROUTINE SAFETY VALIDATION

Validated Village safety checks:

- Village trigger count = 0
- Village-related routine/function count = 0

No additional trigger or routine was introduced by the Village migration.

Status:

**GREEN**

---

## 11. HIERARCHICAL BOUNDARY

Approved hierarchy:

`Country → Province → City → District → Village`

Physical parent enforcement:

`public.villages.district_id`
→ `public.districts.district_id`

Controlled-denormalized references:

- `country_id`
- `province_id`
- `city_id`

No additional cascade, SET NULL, trigger, composite foreign key, or
application-only hierarchical enforcement was introduced.

Status:

**GREEN**

---

## 12. PHYSICAL CONTRACT CONFORMANCE

Village physical implementation conforms to the approved requirements:

- Physical table = `public.villages`
- Primary key = `village_id`
- Parent = `public.districts`
- Parent FK = `district_id`
- Controlled-denormalized geography = country/province/city
- Village code uniqueness within District
- Village name uniqueness within District
- Required supporting indexes
- No unauthorized cascade
- No unauthorized SET NULL
- No unauthorized trigger
- No unauthorized function
- No duplicate `md_village` physical implementation

Result:

**CONFORMANT**

---

## 13. VALIDATION GATE RESULT

Village Physical Implementation Gate:

**PASS**

Overall status:

**GREEN / VALIDATED / APPROVED / LOCKED**

Village physical implementation is accepted as the current VENTRA-DEV
physical authority for the Village master-data scope.

---

## 14. GOVERNANCE BOUNDARY

This validation artifact approves the recorded physical implementation
based on the executed validation evidence.

This document does not authorize:

- Village data seeding
- production deployment
- API implementation
- application integration
- RLS policy creation
- tenant-boundary implementation
- changes to Country, Province, City, or District physical authority

Those scopes require their own evidence and governance gates.

---

## 15. NEXT SCOPE

The next scope is separate from Village physical implementation.

Potential next work must pass its own:

**Evidence → Decision → Implementation → Validation → Approval → Commit/Push**

No downstream implementation is implied by this document.

---

## DECISION STATE

**VALIDATED / APPROVED / LOCKED**
