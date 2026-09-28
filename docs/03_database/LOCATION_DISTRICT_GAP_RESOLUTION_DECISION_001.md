# LOCATION DISTRICT GAP RESOLUTION DECISION 001

## 1. Document Control

- Document ID: LOCATION-DISTRICT-GAP-RESOLUTION-001
- Domain: Global Location / Database Architecture
- Scope: District Physical Implementation
- Status: APPROVED / LOCKED
- Version: 1.0
- Date: 2026-09-28

---

## 2. Purpose

Dokumen ini menyelesaikan gap antara:

1. District Data Dictionary v1.0
2. LOCATION_PHYSICAL_CONTRACT_DECISION_001

khususnya terhadap physical definition untuk:

- postal_code
- latitude
- longitude

Dokumen ini menjadi authority keputusan sebelum penyusunan District Migration.

---

## 3. Evidence

### 3.1 Physical Authority

LOCATION_PHYSICAL_CONTRACT_DECISION_001 menetapkan:

- Physical table: public.districts
- Primary key: district_id
- Direct parent: city_id -> public.cities.id
- Controlled-denormalized references:
  - country_id
  - province_id
- Unique:
  - (city_id, district_code)
  - (city_id, district_name)
- Supporting indexes:
  - district_code
  - district_name
  - city_id
  - province_id
  - country_id
  - is_active

### 3.2 Data Dictionary Evidence

District Data Dictionary v1.0 mendefinisikan:

- district_id UUID, NOT NULL, Primary Key
- country_id UUID, NOT NULL
- province_id UUID, NOT NULL
- city_id UUID, NOT NULL
- district_code VARCHAR(20), NOT NULL
- district_name VARCHAR(100), NOT NULL
- postal_code VARCHAR(10), NULL, DEFAULT NULL
- latitude DECIMAL(10,8), NULL, DEFAULT NULL
- longitude DECIMAL(11,8), NULL, DEFAULT NULL
- is_active BOOLEAN, NOT NULL, DEFAULT TRUE
- created_at TIMESTAMP, NOT NULL, DEFAULT NOW()
- created_by UUID, NOT NULL
- updated_at TIMESTAMP, NULL
- updated_by UUID, NULL
- deleted_at TIMESTAMP, NULL
- deleted_by UUID, NULL

### 3.3 Physical Database Evidence

Validation terhadap VENTRA-DEV menunjukkan:

- public.districts belum ada.
- public.md_district belum ada.

Tidak terdapat physical District implementation yang dapat dijadikan authority existing.

---

## 4. Gap Identified

Physical Contract belum mendefinisikan secara eksplisit:

- postal_code
- latitude
- longitude

Sementara District Data Dictionary telah mendefinisikan ketiganya.

Tidak ditemukan physical contract tambahan yang memberikan definisi berbeda untuk ketiga field tersebut.

---

## 5. Gap Resolution Decision

Untuk menjaga backward compatibility terhadap logical/data contract yang telah disahkan, ketiga field berikut dipertahankan pada physical District dengan definisi yang sama seperti District Data Dictionary v1.0:

| Column | Physical Definition |
|---|---|
| postal_code | VARCHAR(10) NULL DEFAULT NULL |
| latitude | DECIMAL(10,8) NULL DEFAULT NULL |
| longitude | DECIMAL(11,8) NULL DEFAULT NULL |

Tidak dilakukan perubahan terhadap tipe, panjang, nullability, atau default yang telah terdokumentasi.

---

## 6. Physical District Column Baseline

Physical implementation SHALL use:

- district_id UUID NOT NULL DEFAULT gen_random_uuid()
- country_id UUID NOT NULL
- province_id UUID NOT NULL
- city_id UUID NOT NULL
- district_code VARCHAR(20) NOT NULL
- district_name VARCHAR(100) NOT NULL
- postal_code VARCHAR(10) NULL
- latitude DECIMAL(10,8) NULL
- longitude DECIMAL(11,8) NULL
- is_active BOOLEAN NOT NULL DEFAULT TRUE
- created_at TIMESTAMP NOT NULL DEFAULT NOW()
- created_by UUID NOT NULL
- updated_at TIMESTAMP NULL
- updated_by UUID NULL
- deleted_at TIMESTAMP NULL
- deleted_by UUID NULL

The exact physical constraint and index names SHALL be defined in the migration artifact and subsequently validated.

---

## 7. Constraint Boundary

Required:

- Primary key on district_id
- Foreign key city_id -> public.cities.id
- Unique (city_id, district_code)
- Unique (city_id, district_name)

Controlled-denormalized:

- country_id
- province_id

No additional hierarchical enforcement mechanism is introduced by this decision.

Prohibited unless separately approved:

- trigger
- function
- composite foreign key
- cascade
- SET NULL
- application-only hierarchy enforcement
- duplicate md_district table
- alias table
- physical rename of public.cities
- modification of existing Country/Province/City structures

---

## 8. Audit Boundary

Audit fields remain consistent with the District Data Dictionary:

- created_at
- created_by
- updated_at
- updated_by
- deleted_at
- deleted_by

No additional audit relationship is introduced by this decision.

---

## 9. Migration Boundary

This decision authorizes preparation of the District Migration artifact.

It does NOT authorize direct database execution.

Before execution:

1. Migration artifact must be reviewed.
2. Exact columns must match this decision.
3. Exact constraints must match the Physical Contract.
4. Exact indexes must match the Physical Contract.
5. FK target must be public.cities.id.
6. No unauthorized trigger/function/cascade may be present.
7. Validation artifact must be prepared.
8. Separate implementation approval is required.

---

## 10. Governance Status

District Gap Resolution:

**APPROVED / LOCKED**

District Physical Implementation:

**MIGRATION PREPARATION AUTHORIZED**

District Database Execution:

**NOT YET AUTHORIZED**

Next governed step:

**LOCATION_DISTRICT_MIGRATION_001.sql**
