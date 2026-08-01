# VILLAGE DATA DICTIONARY

Version : 1.1

Status : APPROVED

Last Updated : 2026-08-01

Owner : Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan struktur tabel Master Data Village sebagai referensi wilayah administrasi tingkat Village (Desa/Kelurahan atau setara) pada ERP Travel AI Platform.

Dokumen ini menjadi acuan resmi bagi Database Engineer, Backend Developer, Flutter Developer, AI Engineer, QA Engineer, dan Architecture Team.

---

# Table Information

| Item | Value |
|------|-------|
| Table Name | md_village |
| Primary Key | village_id |
| Parent Table | md_district |
| Engine | PostgreSQL |
| Type | Global Master Data |

---

# Column Dictionary

| Column | Data Type | Length | Null | Default | Description |
|---------|-----------|--------|------|----------|-------------|
| village_id | UUID | - | No | UUID Generate | Primary Key |
| country_id | UUID | - | No | - | Referensi Country |
| province_id | UUID | - | No | - | Referensi Province |
| city_id | UUID | - | No | - | Referensi City |
| district_id | UUID | - | No | - | Referensi District |
| village_code | VARCHAR | 30 | No | - | Kode Village |
| village_name | VARCHAR | 150 | No | - | Nama Village |
| postal_code | VARCHAR | 10 | Yes | NULL | Kode Pos |
| latitude | DECIMAL(10,8) | Yes | NULL | NULL | Latitude |
| longitude | DECIMAL(11,8) | Yes | NULL | NULL | Longitude |
| is_active | BOOLEAN | - | No | TRUE | Status Aktif |
| created_at | TIMESTAMP | - | No | NOW() | Waktu Dibuat |
| created_by | UUID | - | No | - | User Pembuat |
| updated_at | TIMESTAMP | - | Yes | NULL | Waktu Perubahan |
| updated_by | UUID | - | Yes | NULL | User Pengubah |
| deleted_at | TIMESTAMP | - | Yes | NULL | Soft Delete |
| deleted_by | UUID | - | Yes | NULL | User Penghapus |

---

# Primary Key

| Column |
|---------|
| village_id |

---

# Foreign Key

| Column | Reference |
|---------|-----------|
| country_id | md_country.country_id |
| province_id | md_province.province_id |
| city_id | md_city.city_id |
| district_id | md_district.district_id |

---

# Unique Constraint

| Constraint | Description |
|------------|-------------|
| district_id + village_code | Kode Village harus unik dalam satu District |
| district_id + village_name | Nama Village harus unik dalam satu District |

---

# Index Strategy

| Index | Purpose |
|--------|---------|
| village_code | Lookup cepat |
| village_name | Smart Search |
| district_id | Filter District |
| city_id | Filter City |
| province_id | Filter Province |
| country_id | Filter Country |
| postal_code | Postal Lookup |
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

Village tidak boleh dihapus permanen.

Penghapusan menggunakan:

- deleted_at
- deleted_by

Status data menjadi Inactive.

---

# AI Readiness

Struktur tabel mendukung:

- Intelligent Address Engine
- Geo Search Engine
- Geo Intelligence Engine
- AI Geo Timeline
- Territory Performance Engine
- Dashboard Analytics
- AI Recommendation
- Travel Marketplace Engine

---

# API Readiness

Master Data Village mendukung:

- GET List Village
- GET Detail Village
- Search Village
- Smart Lookup
- Filter Village
- Cascading Country → Province → City → District → Village

---

# Canonical Address

Village merupakan level administrasi terakhir pada Canonical Address Policy (AD-040).

Seluruh alamat operasional ERP wajib menggunakan:

- country_id
- province_id
- city_id
- district_id
- village_id

Address Line hanya bersifat pelengkap.

---

# Catatan

Seluruh Business Module wajib menggunakan village_id sebagai referensi utama wilayah administrasi.

Penggunaan nama Village secara langsung pada tabel transaksi tidak diperbolehkan.