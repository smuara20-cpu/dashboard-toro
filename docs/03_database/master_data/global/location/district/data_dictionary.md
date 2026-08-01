# DISTRICT DATA DICTIONARY

Version : 1.0

---

# Tujuan

Dokumen ini mendefinisikan struktur tabel Master Data District yang digunakan sebagai referensi wilayah administrasi tingkat District (Kecamatan atau setara) pada ERP Travel AI Platform.

Data Dictionary menjadi acuan utama bagi Database Engineer, Backend Developer, Flutter Developer, AI Engineer, QA, dan Architecture Team.

---

# Table Information

| Item | Value |
|------|-------|
| Table Name | md_district |
| Primary Key | district_id |
| Parent Table | md_city |
| Child Table | md_village |
| Engine | PostgreSQL |
| Type | Global Master Data |

---

# Column Dictionary

| Column | Data Type | Length | Null | Default | Description |
|---------|-----------|--------|------|----------|-------------|
| district_id | UUID | - | No | UUID Generate | Primary Key |
| country_id | UUID | - | No | - | Referensi Country |
| province_id | UUID | - | No | - | Referensi Province |
| city_id | UUID | - | No | - | Referensi City |
| district_code | VARCHAR | 20 | No | - | Kode District |
| district_name | VARCHAR | 100 | No | - | Nama District |
| postal_code | VARCHAR | 10 | Yes | NULL | Kode Pos Default (Opsional) |
| latitude | DECIMAL(10,8) | - | Yes | NULL | Latitude titik tengah District |
| longitude | DECIMAL(11,8) | - | Yes | NULL | Longitude titik tengah District |
| is_active | BOOLEAN | - | No | TRUE | Status aktif |
| created_at | TIMESTAMP | - | No | NOW() | Tanggal dibuat |
| created_by | UUID | - | No | - | User pembuat |
| updated_at | TIMESTAMP | - | Yes | NULL | Tanggal perubahan |
| updated_by | UUID | - | Yes | NULL | User pengubah |
| deleted_at | TIMESTAMP | - | Yes | NULL | Soft Delete |
| deleted_by | UUID | - | Yes | NULL | User penghapus |

---

# Primary Key

| Column |
|---------|
| district_id |

---

# Foreign Key

| Column | Reference |
|---------|-----------|
| country_id | md_country.country_id |
| province_id | md_province.province_id |
| city_id | md_city.city_id |

---

# Unique Constraint

| Constraint | Description |
|------------|-------------|
| city_id + district_code | Tidak boleh duplikat dalam satu City |
| city_id + district_name | Nama District harus unik dalam satu City |

---

# Index

| Index | Purpose |
|--------|----------|
| district_code | Lookup cepat berdasarkan kode |
| district_name | Search |
| city_id | Filter City |
| province_id | Filter Province |
| country_id | Filter Country |
| is_active | Active Filter |

---

# Audit Fields

Seluruh perubahan wajib mencatat:

- created_at
- created_by
- updated_at
- updated_by
- deleted_at
- deleted_by

---

# Soft Delete

Penghapusan menggunakan:

deleted_at

deleted_by

Data tidak boleh dihapus secara permanen.

---

# AI Readiness

Struktur tabel mendukung:

- Smart Lookup
- Intelligent Address Engine
- Geo Intelligence Engine
- Territory Performance Engine
- AI Geo Timeline
- Dashboard Analytics

---

# API Readiness

Data Dictionary mendukung:

- GET List District
- GET Detail District
- Search District
- Filter District
- Smart Lookup
- Cascading Country → Province → City → District

---

# Catatan

Seluruh transaksi pada ERP Travel AI Platform wajib menggunakan `district_id` sebagai referensi wilayah administrasi tingkat District.

Penggunaan nama District secara langsung pada tabel transaksi tidak diperbolehkan.