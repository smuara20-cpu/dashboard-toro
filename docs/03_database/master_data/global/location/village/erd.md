# VILLAGE ENTITY RELATIONSHIP DIAGRAM (ERD)

Version : 1.1

Status : APPROVED

Last Updated : 2026-08-01

Owner : Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini menjelaskan hubungan (Relationship) antara Master Data Village dengan Master Data lainnya.

ERD menjadi acuan resmi bagi Database Engineer, Backend Developer, Flutter Developer, AI Engineer, QA Engineer, dan Architecture Team.

---

# Posisi Village

```
Country
    │
    ▼
Province
    │
    ▼
City
    │
    ▼
District
    │
    ▼
Village
```

Village merupakan level administrasi terakhir pada struktur Global Location dan menjadi referensi utama untuk alamat operasional ERP Travel AI Platform.

---

# Parent Entity

| Parent | Relationship |
|----------|-------------|
| Country | Many to One (N:1) |
| Province | Many to One (N:1) |
| City | Many to One (N:1) |
| District | Many to One (N:1) |

---

# Child Entity

Pada Version 1.1, Village tidak memiliki Child Entity langsung.

Village menjadi referensi bagi berbagai Business Module.

---

# Primary Key

```
village_id
```

---

# Foreign Key

| Column | Reference |
|---------|-----------|
| country_id | md_country.country_id |
| province_id | md_province.province_id |
| city_id | md_city.city_id |
| district_id | md_district.district_id |

---

# Relationship Diagram

```
md_country
------------
country_id (PK)

        │
        ▼

md_province
------------
province_id (PK)
country_id (FK)

        │
        ▼

md_city
------------
city_id (PK)
country_id (FK)
province_id (FK)

        │
        ▼

md_district
------------
district_id (PK)
country_id (FK)
province_id (FK)
city_id (FK)

        │
        ▼

md_village
------------
village_id (PK)
country_id (FK)
province_id (FK)
city_id (FK)
district_id (FK)

        │
        ├─────────────────────────────┐
        ▼                             ▼

Customer                    Jamaah

Company                     Branch

Vendor                      Supplier

Booking                     CRM

Finance                     Marketing

Dashboard                   AI
```

---

# Controlled Denormalization

ERP Travel AI Platform menggunakan Controlled Denormalization sesuai AD-033.

Setiap Village menyimpan:

- country_id
- province_id
- city_id
- district_id

Tujuannya untuk:

- Dashboard Analytics
- AI Analytics
- Territory Performance
- Geo Intelligence
- Executive Briefing
- Reporting

---

# Canonical Address

Village merupakan level terakhir pada Canonical Address.

```
Country
    │
    ▼
Province
    │
    ▼
City
    │
    ▼
District
    │
    ▼
Village
    │
    ▼
Address Line
```

Address Line tidak boleh menggantikan referensi Master Data.

---

# Cardinality

| Parent | Child | Cardinality |
|----------|--------|------------|
| Country | Province | 1 : N |
| Province | City | 1 : N |
| City | District | 1 : N |
| District | Village | 1 : N |

---

# Delete Rules

| Entity | Rule |
|---------|------|
| Country | RESTRICT |
| Province | RESTRICT |
| City | RESTRICT |
| District | RESTRICT |
| Village | SOFT DELETE |

Village yang telah digunakan pada transaksi tidak boleh dihapus.

---

# Update Rules

Perubahan nama Village tidak mengubah:

- village_id

Perubahan Parent wajib melalui:

- Hierarchical Validation
- Geographic Change Management
- Geographic Versioning

---

# AI Relationship

Master Data Village digunakan oleh:

- Intelligent Address Engine
- Geo Search Engine
- Geo Intelligence Engine
- AI Geo Timeline
- Territory Performance Engine
- Campaign Intelligence Engine
- Executive Briefing Engine
- AI Recommendation Engine
- Travel Marketplace Engine

AI hanya memiliki hak Read Only.

---

# Architecture Reference

ERD ini mengacu pada:

- AD-033 — Hierarchical Foreign Key Policy
- AD-038 — Security by Design Policy
- AD-039 — Geographic Change Management Policy
- AD-040 — Canonical Address Policy
- AD-041 — Hierarchical Validation Policy
- AD-042 — Geographic Versioning Policy

---

# Catatan

Master Data Village merupakan fondasi seluruh referensi alamat pada ERP Travel AI Platform.

Seluruh Business Module wajib menggunakan village_id sebagai referensi wilayah administrasi dan tidak diperbolehkan menggunakan nama Village sebagai referensi utama.