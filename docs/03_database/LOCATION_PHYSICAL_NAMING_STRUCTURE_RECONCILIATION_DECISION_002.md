# LOCATION PHYSICAL NAMING & STRUCTURE RECONCILIATION — DECISION 002

**Decision ID:** LOCATION-PHYSICAL-NAMING-STRUCTURE-RECONCILIATION-002
**Domain:** Global Location / Database Architecture
**Version:** 1.0
**Status:** APPROVED / LOCKED
**Decision Type:** Physical Naming & Structure Reconciliation
**Implementation Status:** HOLD — NO DATABASE CHANGE AUTHORIZED
**Scope:** Country → Province → City → District → Village

---

## 1. PURPOSE

Decision ini menetapkan baseline evidence dan boundary rekonsiliasi physical naming serta physical structure untuk Global Location:

- Country
- Province
- City
- District
- Village

Decision ini dibuat untuk menyelesaikan konflik dokumentasi dan physical implementation sebelum pembuatan Foreign Key Company/Branch atau migration Location berikutnya.

Decision ini **tidak mengubah database** dan **tidak mengubah Data Dictionary/ERD sumber secara diam-diam**.

---

## 2. GOVERNANCE PRINCIPLE

Rekonsiliasi mengikuti urutan:

**Evidence → Conflict Identification → Decision → Physical Contract → Migration → Validation → Approval**

Decision 002 hanya menyelesaikan tahap evidence dan reconciliation boundary.

SQL physical change baru boleh dilakukan setelah physical contract final memperoleh approval terpisah.

---

## 3. DECISION BOUNDARY

Decision 002 mengunci bahwa konflik physical naming dan structure harus diselesaikan secara eksplisit sebelum Location migration SQL.

**Database change authorized: ZERO.**

---
## 4. EVIDENCE — COUNTRY

- Documented Country uses primary key `id`.
- Physical `public.countries` exists.
- Physical primary key is `id`.
- Physical primary key evidence is currently aligned with the documented Country primary key.

## 5. EVIDENCE — PROVINCE

- Documented Province uses primary key `id`.
- Physical `public.provinces` exists.
- Physical primary key is `id`.
- `country_id` references `public.countries.id`.
- Physical indexes and uniqueness have been verified.
- Approved Province Data Dictionary defines 20 columns.
- Current physical `public.provinces` contains 17 columns.
- Missing documented columns are `population`, `description`, and `sort_order`.
- Province physical structure is therefore PARTIAL and requires reconciliation.

## 6. EVIDENCE — CITY

- Documented City uses primary key `id`.
- Documented City uses `province_id → province.id`.
- Physical `public.cities` has not been established.
- City physical implementation therefore remains HOLD.

---
## 7. EVIDENCE - DISTRICT

- Documented District uses table `md_district`.
- Documented District primary key is `district_id`.
- `country_id` references `md_country.country_id`.
- `province_id` references `md_province.province_id`.
- `city_id` references `md_city.city_id`.
- District documentation uses controlled denormalization for Country, Province, and City references.
- No authoritative physical District implementation has been established.
- District physical implementation therefore remains HOLD.

## 8. EVIDENCE - VILLAGE

- Documented Village uses table `md_village`.
- Documented Village primary key is `village_id`.
- `country_id` references `md_country.country_id`.
- `province_id` references `md_province.province_id`.
- `city_id` references `md_city.city_id`.
- `district_id` references `md_district.district_id`.
- Village is the final administrative level in the documented hierarchy.
- Village references must use `village_id` rather than Village name.
- No authoritative physical Village implementation has been established.
- Village physical implementation therefore remains HOLD.

---
## 9. PHYSICAL NAMING CONFLICT

Teridentifikasi dua pola naming primary key dalam dokumentasi Location:

- Country / Province / City menggunakan `id` sebagai primary key dalam dokumentasi.
- District / Village menggunakan `district_id` dan `village_id` dalam dokumentasi.
- Pola tersebut belum memiliki keputusan rekonsiliasi physical naming yang memilih salah satu pola.
- Tidak diperbolehkan membuat alias primary key hanya untuk menyelesaikan konflik naming.
- Tidak diperbolehkan mengganti nama primary key existing tanpa Decision terpisah.

## 10. PHYSICAL NAMESPACE CONFLICT

Teridentifikasi dua pola namespace/table naming:

- Physical implementation yang telah diverifikasi menggunakan namespace `public.*` untuk `countries` dan `provinces`.
- Dokumentasi District/Village menggunakan naming `md_district` dan `md_village`.
- Dokumentasi City menggunakan naming `City` dengan primary key `id`.
- Belum terdapat evidence yang menetapkan bahwa `public.*` atau `md_*` merupakan physical namespace final untuk seluruh Location.
- Tidak diperbolehkan membuat duplicate table hanya untuk mengakomodasi perbedaan naming.

## 11. CONFLICT MATRIX

| Entity | Documented PK | Documented Naming | Physical Evidence | Status |
|---|---|---|---|---|
| Country | `id` | Country | `public.countries.id` | ALIGNED |
| Province | `id` | Province | `public.provinces.id` | PARTIAL |
| City | `id` | City | Physical table not established | HOLD |
| District | `district_id` | `md_district` | Physical table not established | HOLD |
| Village | `village_id` | `md_village` | Physical table not established | HOLD |

---
## 12. RECONCILIATION DECISION

Decision 002 menetapkan:

- Dokumentasi existing tetap dipertahankan sebagai evidence.
- Physical naming final untuk Country, Province, City, District, dan Village belum ditetapkan oleh Decision 002.
- Belum ada keputusan untuk memilih `id` atau `*_id` sebagai pola primary key universal.
- Belum ada keputusan untuk memilih `public.*` atau `md_*` sebagai pola physical table naming universal.
- Existing `public.countries` dan `public.provinces` tidak diubah oleh Decision 002.
- Physical City, District, dan Village tetap HOLD.
- Company Location FK tetap HOLD sampai physical target keys final.

## 13. PROHIBITED ACTIONS

Decision 002 melarang:

- Rename primary key existing tanpa Decision terpisah.
- Rename existing physical table tanpa Decision terpisah.
- Menambahkan alias primary key untuk menyamarkan konflik naming.
- Membuat duplicate Location tables hanya karena perbedaan naming.
- Membuat City, District, atau Village berdasarkan asumsi physical target.
- Mengubah Data Dictionary atau ERD sumber secara diam-diam.
- Membuat Company/Branch Location FK sebelum target physical key final.
- Membuat hierarchical FK sebelum parent-child physical contract final.
- Melakukan silent data migration atau silent data repair.

## 14. DATABASE SAFETY

Decision 002 tidak mengotorisasi:

- CREATE TABLE
- ALTER TABLE
- DROP TABLE
- RENAME TABLE
- ADD/DROP COLUMN
- CREATE/DROP CONSTRAINT
- CREATE/DROP INDEX
- CREATE/DROP FUNCTION
- CREATE/DROP TRIGGER
- INSERT, UPDATE, DELETE, atau data migration

---
## 15. NEXT IMPLEMENTATION GATES

Location physical implementation tetap HOLD sampai seluruh gate berikut selesai:

1. Final physical naming contract Country.
2. Final physical naming contract Province.
3. Final physical naming contract City.
4. Final physical naming contract District.
5. Final physical naming contract Village.
6. Final primary key mapping untuk seluruh hierarchy.
7. Final parent-child Foreign Key mapping.
8. Final hierarchical integrity mechanism.
9. Final Company Location FK target mapping.
10. Final index and constraint strategy.
11. Existing data validation.
12. Forward migration and rollback validation.
13. PostgreSQL/Supabase physical validation.
14. Separate implementation approval.

## 16. RELATION TO DECISION 001

Decision 002 merupakan tindak lanjut dari:

`LOCATION-PHYSICAL-AUTHORITY-RECONCILIATION-001`

Decision 001 menetapkan bahwa physical authority Location belum final.
Decision 002 mempersempit reconciliation boundary pada physical naming dan structure.
Decision 002 tidak membatalkan, mengganti, atau mengubah Decision 001.

Company Location FK reconciliation tetap mengikuti:
`LOCATION-COMPANY-FK-RECONCILIATION-001`

Company/Branch Location FK tetap HOLD sampai target physical keys final.

## 17. TENANT BOUNDARY

Decision 002 tidak mengubah tenant architecture.

- Global Location tetap diperlakukan sebagai Global Master berdasarkan existing documentation.
- Tidak ada `tenant_id` yang ditambahkan oleh Decision 002.
- Tidak ada perubahan terhadap SP-203 Identity & Access Platform.
- Tidak ada perubahan terhadap TenantContext atau SessionContext.
- Tenant isolation tidak boleh diinferensikan dari Location structure.

## 18. APPROVAL STATUS

**Decision:** APPROVED / LOCKED

**Implementation:** HOLD

**Database Change Authorized:** ZERO

Decision 002 hanya mengunci evidence, conflict boundary, reconciliation boundary, dan implementation gates.

Physical Location contract dan migration SQL memerlukan Decision/Approval terpisah.

## 19. FINAL GOVERNANCE STATEMENT

Global Location tidak boleh dimigrasikan berdasarkan asumsi naming.

Seluruh physical identity, namespace, primary key, hierarchy, Foreign Key, integrity mechanism, dan Company FK target harus memiliki evidence dan approval sebelum implementation.

**Evidence → Decision → Physical Contract → Migration → Validation → Approval → Commit/Push**

---
**END OF DECISION 002**
