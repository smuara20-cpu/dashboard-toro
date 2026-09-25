# LOCATION PHYSICAL AUTHORITY RECONCILIATION DECISION 001

Version : 1.0
Status : APPROVED / LOCKED
Decision ID : LOCATION-PHYSICAL-AUTHORITY-RECONCILIATION-001
Domain : Global Location / Master Data
Owner : Architecture Team
Reviewer : Architecture Review Board
Approval : APPROVED

---

# 1. Purpose

Decision ini menjadi Decision Gate untuk merekonsiliasi physical authority seluruh Global Location sebelum physical migration berikutnya dilakukan.

Scope:
- Country
- Province
- City
- District
- Village
- Company Location Foreign Keys

Decision ini bukan migration SQL dan tidak mengubah physical database.

---

# 2. Evidence Baseline

Evidence yang menjadi dasar:
- Country Data Dictionary dan ERD.
- Province Data Dictionary dan ERD.
- City Data Dictionary dan ERD.
- District Data Dictionary dan ERD.
- Village Data Dictionary dan ERD.
- Global Location Architecture Review.
- Global Master governance.
- Company Physical Authority Reconciliation Decision 001.
- Physical evidence public.countries.
- Physical evidence public.provinces.

---

# 3. Current Physical Authority Evidence

Country:
- Source documentation menggunakan Country sebagai root.
- Physical key menggunakan id.
- public.countries telah tersedia dengan primary key id.

Province:
- Source documentation menggunakan Province dengan primary key id.
- public.provinces telah tersedia dengan primary key id.
- Physical Province masih harus direkonsiliasi terhadap approved Province Data Dictionary karena struktur physical saat ini belum seluruhnya terbukti sama.

City:
- Approved source menggunakan City dengan primary key id.
- public.cities belum terbukti tersedia pada physical database saat Decision ini dibuat.

District:
- Approved source menggunakan md_district dengan primary key district_id.
- Physical target belum terbukti tersedia.

Village:
- Approved source menggunakan md_village dengan primary key village_id.
- Physical target belum terbukti tersedia.

---

# 4. Reconciliation Conflicts

Conflict A — Physical Naming:
- Source Country/Province/City menggunakan model physical identity id.
- Source District/Village menggunakan md_* dengan *_id.

Conflict B — Company FK Target:
- Company physical authority menggunakan country_id, province_id, city_id, district_id, village_id.
- Target physical key untuk seluruh Location belum seluruhnya authoritative.

Conflict C — Namespace:
- Source documentation menggunakan md_country, md_province, md_city, md_district, md_village pada sebagian Location.
- Physical Supabase evidence menggunakan public.countries dan public.provinces.
- Mapping antara kedua naming model belum diputuskan secara authoritative.

Conflict D — Province Physical Completeness:
- public.provinces telah dibuat.
- Struktur physical Province belum boleh dianggap final sebelum direkonsiliasi dengan approved Province Data Dictionary.

Conflict E — Hierarchical Integrity:
- Source mensyaratkan hierarchical validation.
- Physical enforcement mechanism untuk seluruh hierarchy belum ditetapkan sebagai physical authority.

---

# 5. Decision

5.1 Approved Location Data Dictionaries dan ERDs tetap menjadi evidence authority untuk documented business structure.

5.2 Company Physical Authority tetap authoritative untuk Company identity dan Company physical structure.

5.3 Physical Location mapping belum ditetapkan sebagai final authority.

5.4 Tidak ada keputusan untuk memilih public.* atau md_* sebagai physical namespace final melalui Decision ini.

5.5 Tidak ada keputusan untuk mengganti primary key Location.

5.6 Tidak ada keputusan untuk membuat alias primary key.

5.7 Tidak ada keputusan untuk membuat duplicate Location tables.

5.8 Tidak ada keputusan untuk mengubah Data Dictionary atau ERD secara silent.

5.9 Company Location Foreign Keys tetap HOLD sampai target physical Location authoritative.

5.10 City, District, dan Village physical migration tetap HOLD.

5.11 Hierarchical integrity mechanism tetap HOLD sampai physical model final ditetapkan.

---

# 6. Prohibited Actions

Selama Decision Gate belum selesai, dilarang:
- membuat migration City/District/Village berdasarkan asumsi.
- membuat duplicate public.* dan md_* tables.
- membuat alias PK hanya untuk memenuhi Company FK.
- mengganti PK existing tanpa Decision baru.
- mengubah Data Dictionary tanpa Architecture Review.
- membuat Company FK menuju target yang belum authoritative.
- melakukan silent data repair.
- melakukan silent rename table atau column.
- membuat compatibility column tanpa Decision terpisah.

---

# 7. Reconciliation Gates

Gate 01 — Country physical identity.
Gate 02 — Province physical identity dan completeness.
Gate 03 — City physical identity.
Gate 04 — District physical identity.
Gate 05 — Village physical identity.
Gate 06 — public.* versus md_* namespace mapping.
Gate 07 — Parent-child FK mapping.
Gate 08 — Hierarchical integrity enforcement.
Gate 09 — Company Location FK target validation.
Gate 10 — Migration and rollback readiness.

Setiap Gate wajib berdasarkan evidence yang dapat diverifikasi.

---

# 8. Migration Boundary

Migration Location tidak boleh dimulai sebelum:
- physical authority Location selesai direkonsiliasi.
- target PK seluruh Location terkonfirmasi.
- parent-child FK terkonfirmasi.
- hierarchical integrity mechanism ditetapkan.
- Company FK target terkonfirmasi.
- PostgreSQL constraint/index strategy tervalidasi.
- forward migration tervalidasi.
- rollback strategy tervalidasi.
- existing physical data diperiksa.

---

# 9. Company Boundary

Company physical authority tetap menggunakan:

- company_id sebagai primary key.
- country_id.
- province_id.
- city_id.
- district_id.
- village_id.

Namun FK target Location belum boleh dibuat sampai reconciliation selesai.

---

# 10. Tenant Boundary

Decision ini tidak mengubah:
- SP-203 Identity & Access.
- TenantContext.
- Tenant boundary.
- RBAC.
- tenant provisioning.
- RLS policy.

Location tetap Global Master Data sesuai approved architecture.

---

# 11. Approval

Decision:
APPROVED / LOCKED

Implementation:
HOLD pending reconciliation gates.

Migration:
HOLD.

Company Location FK:
HOLD.

Next governance step:
Evidence validation per reconciliation gate.

---
