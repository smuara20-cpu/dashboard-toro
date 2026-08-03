# DISTRICT ENTITY RELATIONSHIP DIAGRAM (ERD)

Version : 1.0

---

# Tujuan

Dokumen ini menjelaskan hubungan (Relationship) antara Master Data District dengan Master Data lainnya.

ERD digunakan sebagai acuan Database Engineer, Backend Developer, Flutter Developer, AI Engineer, dan Architecture Team.

---

# Posisi District

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

District merupakan wilayah administrasi yang berada di bawah City dan menjadi Parent bagi Village.

---

# Parent Entity

| Parent | Relationship |
|----------|-------------|
| Country | Many to One (N:1) |
| Province | Many to One (N:1) |
| City | Many to One (N:1) |

---

# Child Entity

| Child | Relationship |
|---------|-------------|
| Village | One to Many (1:N) |

---

# Foreign Key

| Column | Reference |
|----------|-----------|
| country_id | md_country.country_id |
| province_id | md_province.province_id |
| city_id | md_city.city_id |

---

# Primary Key

```
district_id
```

---

# Relationship Diagram

```
md_country
------------

country_id (PK)

        │

        │ 1

        ▼

md_province
------------

province_id (PK)

country_id (FK)

        │

        │ 1

        ▼

md_city
------------

city_id (PK)

country_id (FK)

province_id (FK)

        │

        │ 1

        ▼

md_district
----------------

district_id (PK)

country_id (FK)

province_id (FK)

city_id (FK)

        │

        │ 1

        ▼

md_village
----------------

village_id (PK)

country_id (FK)

province_id (FK)

city_id (FK)

district_id (FK)
```

---

# Controlled Denormalization

ERP Travel AI Platform menggunakan Controlled Denormalization sesuai Architecture Decision AD-033.

Setiap District menyimpan referensi berikut:

- country_id
- province_id
- city_id

Tujuannya adalah:

- Mempercepat Dashboard
- Mempercepat Reporting
- Mempercepat AI Analytics
- Mempercepat Geo Intelligence
- Mengurangi JOIN yang kompleks

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
| District | SOFT DELETE |
| Village | SOFT DELETE |

District yang masih memiliki Village atau telah digunakan oleh transaksi tidak boleh dihapus.

---

# Update Rules

Perubahan nama District tidak mengubah:

- district_id

Perubahan Parent harus melalui proses validasi hierarki.

---

# AI Relationship

Master Data District digunakan oleh:

- Intelligent Address Engine
- Geo Search Engine
- Geo Intelligence Engine
- Territory Performance Engine
- Executive Dashboard
- AI Recommendation Engine
- Travel Marketplace Engine

AI hanya memiliki hak Read Only.

---

# Catatan

Seluruh relasi wajib menjaga Hierarchical Integrity sesuai Golden Rule 032.

Konsistensi hubungan Country → Province → City → District → Village harus selalu terjaga pada seluruh proses Database, API, Flutter, AI, dan Business Module.