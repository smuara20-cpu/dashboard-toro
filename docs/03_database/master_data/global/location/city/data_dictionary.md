# CITY DATA DICTIONARY

Version : 1.0

---

# Tujuan

Dokumen ini mendefinisikan struktur data resmi untuk Master Data City.

Dokumen ini menjadi acuan utama dalam implementasi:

- PostgreSQL
- Supabase
- API
- Flutter
- Import Data
- AI

---

# Table Information

| Item | Value |
|------|-------|
| Table Name | city |
| Module | Master Data |
| Category | Global Location |
| Parent | Province |
| Child | District |

---

# Primary Key

| Column | Type |
|---------|------|
| id | UUID |

---

# Columns

| No | Column | Type | Length | Null | Default | Description |
|----|---------|------|--------|------|----------|-------------|
| 1 | id | UUID | - | No | gen_random_uuid() | Primary Key |
| 2 | province_id | UUID | - | No | - | Parent Province |
| 3 | code | VARCHAR | 20 | Yes | NULL | City Code |
| 4 | name | VARCHAR | 150 | No | - | City Name |
| 5 | official_name | VARCHAR | 200 | Yes | NULL | Official City Name |
| 6 | city_type | VARCHAR | 30 | Yes | NULL | City, Regency, Municipality, Metropolitan |
| 7 | postal_code | VARCHAR | 20 | Yes | NULL | Default Postal Code |
| 8 | capital | BOOLEAN | - | No | FALSE | Is Province Capital |
| 9 | area_km2 | NUMERIC | 18,2 | Yes | NULL | Area in KM² |
|10 | population | BIGINT | - | Yes | NULL | Population |
|11 | timezone | VARCHAR | 100 | Yes | NULL | Timezone Override |
|12 | description | TEXT | - | Yes | NULL | Description |
|13 | sort_order | INTEGER | - | No | 0 | Display Order |
|14 | status | SMALLINT | - | No | 1 | Status |
|15 | is_active | BOOLEAN | - | No | TRUE | Active Status |
|16 | created_at | TIMESTAMP | - | No | NOW() | Created Time |
|17 | created_by | UUID | - | Yes | NULL | Created By |
|18 | updated_at | TIMESTAMP | - | Yes | NULL | Updated Time |
|19 | updated_by | UUID | - | Yes | NULL | Updated By |
|20 | deleted_at | TIMESTAMP | - | Yes | NULL | Soft Delete |
|21 | deleted_by | UUID | - | Yes | NULL | Deleted By |

---

# Foreign Key

| Column | Reference |
|---------|-----------|
| province_id | province.id |
| created_by | user.id |
| updated_by | user.id |
| deleted_by | user.id |

---

# Unique Constraint

| Column |
|---------|
| province_id + name |
| province_id + code |

---

# Index Recommendation

| Column | Purpose |
|---------|----------|
| province_id | Join Performance |
| code | Search |
| name | Search |
| city_type | Filter |
| status | Filter |
| is_active | Filter |
| deleted_at | Soft Delete |
| sort_order | Sorting |

---

# Enum Reference

## Status

| Value | Description |
|--------|-------------|
| 0 | Inactive |
| 1 | Active |

---

## City Type

| Value | Description |
|--------|-------------|
| CITY | City |
| REGENCY | Regency |
| MUNICIPALITY | Municipality |
| METROPOLITAN | Metropolitan |
| SPECIAL_REGION | Special Region |

---

# Base Entity

City mengikuti Base Entity Standard ERP Travel AI Platform.

Kolom audit tidak boleh dihapus.

---

# Naming Standard

Menggunakan snake_case.

Contoh:

province_id

official_name

city_type

postal_code

created_at

deleted_by

---

# Data Ownership

City merupakan Global Master Data.

City tidak dimiliki oleh Company.

---

# Cache Recommendation

City termasuk Master Data dengan frekuensi perubahan rendah.

Disarankan:

- Preload berdasarkan Province
- Offline Cache pada Flutter
- Cache API

---

# Integration

City digunakan oleh:

- Company
- Branch
- Customer
- Jamaah
- Vendor
- Supplier
- Hotel
- Airport
- Booking
- Dashboard
- AI

---

# Catatan

City merupakan Parent Entity bagi District.

Seluruh District wajib menggunakan city_id sebagai Foreign Key.