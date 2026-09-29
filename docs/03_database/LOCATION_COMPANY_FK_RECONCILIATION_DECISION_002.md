# LOCATION COMPANY FK RECONCILIATION DECISION 002

Version: 1.0
Status: APPROVED / LOCKED
Classification: Controlled Engineering Decision
Domain: Global Location / Core Company
Decision ID: LOCATION-COMPANY-FK-RECONCILIATION-002
Date: 2026-09-29

## 1. Purpose

Decision ini mengunci physical FK mapping antara Company dan Global Location berdasarkan physical object yang telah diverifikasi langsung pada database VENTRA-DEV.

Decision ini tidak membuat tabel companies, tidak membuat FK, dan tidak mengubah tabel Location yang sudah tervalidasi.

## 2. Evidence

Physical Location objects yang telah terbukti ada di public schema:

- public.countries — TABLE — PK id
- public.provinces — TABLE — PK id
- public.cities — TABLE — PK id
- public.districts — TABLE — PK district_id
- public.villages — TABLE — PK village_id

Physical Company object:

- public.companies — NOT PRESENT pada VENTRA-DEV saat validation.

Constraint evidence:

- countries.pk_countries → PRIMARY KEY (id)
- provinces.pk_provinces → PRIMARY KEY (id)
- cities.pk_cities → PRIMARY KEY (id)
- districts.pk_districts → PRIMARY KEY (district_id)
- villages.pk_villages → PRIMARY KEY (village_id)

## 3. Decision

Physical Company FK mapping ditetapkan sebagai berikut:

| Company Column | Physical Target | Target Column | Status |
|---|---|---|---|
| companies.country_id | public.countries | id | APPROVED MAPPING |
| companies.province_id | public.provinces | id | APPROVED MAPPING |
| companies.city_id | public.cities | id | APPROVED MAPPING |
| companies.district_id | public.districts | district_id | APPROVED MAPPING |
| companies.village_id | public.villages | village_id | APPROVED MAPPING |

Mapping di atas merupakan physical reconciliation terhadap target PostgreSQL yang telah terbukti.

Mapping ini tidak mengubah atau menulis ulang Data Dictionary Company secara diam-diam.

## 4. Physical Authority

Canonical Company physical identity tetap:

- Table: public.companies
- Primary Key: company_id UUID

Canonical Location physical authorities:

- Country: public.countries.id
- Province: public.provinces.id
- City: public.cities.id
- District: public.districts.district_id
- Village: public.villages.village_id

## 5. Implementation Boundary

Decision ini hanya mengunci mapping.

Belum diizinkan:

- CREATE TABLE public.companies
- ALTER TABLE public.companies
- CREATE FOREIGN KEY pada companies
- menambahkan compatibility column pada Location
- rename primary key Location
- membuat duplicate md_district / md_village
- membuat duplicate physical Location table
- mengubah Country, Province, City, District, atau Village
- mengubah tenant boundary
- membuat RLS atau policy baru

## 6. Company Migration Gate

Company physical migration dapat dipersiapkan setelah Decision 002 ini.

Migration wajib menggunakan mapping physical yang telah dikunci:

companies.country_id  → countries.id
companies.province_id → provinces.id
companies.city_id     → cities.id
companies.district_id → districts.district_id
companies.village_id  → villages.village_id

Company migration tetap merupakan implementation gate terpisah dan membutuhkan validation PostgreSQL setelah execution.

## 7. Validation Requirements

Setelah public.companies diimplementasikan, validation wajib mencakup:

1. Exact Company column definition terhadap approved Company Physical Authority.
2. Primary key company_id.
3. FK country_id → public.countries.id.
4. FK province_id → public.provinces.id.
5. FK city_id → public.cities.id.
6. FK district_id → public.districts.district_id.
7. FK village_id → public.villages.village_id.
8. Referential actions sesuai approved Company migration contract.
9. Required UNIQUE/index constraints.
10. Data integrity.
11. Trigger/function safety.
12. Tidak ada duplicate Company physical object.
13. Tenant boundary tetap unchanged.

## 8. Governance Boundary

Decision ini tidak mengubah authority SP-203.

Decision ini tidak membuat Tenant, Membership, Tenant FK, RLS tenant isolation, atau Identity & Access runtime.

Company tetap merupakan Core Company physical authority.

Global Location tetap merupakan physical location authority yang telah divalidasi.

## 9. Final Decision

LOCATION-COMPANY-FK-RECONCILIATION-002 = APPROVED / LOCKED.

Physical Company FK mapping is approved.

Physical Company implementation remains a separate migration and validation gate.

Current status:

- Location Physical Authority: GREEN
- Company FK Mapping: GREEN / APPROVED / LOCKED
- Company Physical Table: NOT YET IMPLEMENTED
- Company FK Implementation: HOLD UNTIL COMPANY MIGRATION
- Tenant Boundary: UNCHANGED
