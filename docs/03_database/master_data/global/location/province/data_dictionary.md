# PROVINCE DATA DICTIONARY

Version : 1.0

---

# Tujuan

Dokumen ini mendefinisikan struktur data resmi untuk Master Data Province.

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
| Table Name | province |
| Module | Master Data |
| Category | Global Location |
| Parent | Country |
| Child | City |

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
| 2 | country_id | UUID | - | No | - | Parent Country |
| 3 | code | VARCHAR | 20 | Yes | NULL | Province Code |
| 4 | name | VARCHAR | 150 | No | - | Province Name |
| 5 | official_name | VARCHAR | 200 | Yes | NULL | Official Province Name |
| 6 | capital | VARCHAR | 150 | Yes | NULL | Capital City |
| 7 | iso_code | VARCHAR | 20 | Yes | NULL | ISO Subdivision Code |
| 8 | area_km2 | NUMERIC | 18,2 | Yes | NULL | Area in KM² |
| 9 | population | BIGINT | - | Yes | NULL | Population |
|10 | timezone | VARCHAR | 100 | Yes | NULL | Timezone |
|11 | description | TEXT | - | Yes | NULL | Description |
|12 | sort_order | INTEGER | - | No | 0 | Display Order |
|13 | status | SMALLINT | - | No | 1 | Status |
|14 | is_active | BOOLEAN | - | No | TRUE | Active Status |
|15 | created_at | TIMESTAMP | - | No | NOW() | Created Time |
|16 | created_by | UUID | - | Yes | NULL | Created By |
|17 | updated_at | TIMESTAMP | - | Yes | NULL | Updated Time |
|18 | updated_by | UUID | - | Yes | NULL | Updated By |
|19 | deleted_at | TIMESTAMP | - | Yes | NULL | Soft Delete |
|20 | deleted_by | UUID | - | Yes | NULL | Deleted By |

---

# Foreign Key

| Column | Reference |
|---------|-----------|
| country_id | country.id |
| created_by | user.id |
| updated_by | user.id |
| deleted_by | user.id |

---

# Unique Constraint

| Column |
|---------|
| country_id + name |
| country_id + code |
| country_id + iso_code |

---

# Index Recommendation

| Column | Purpose |
|---------|----------|
| country_id | Join Performance |
| code | Search |
| name | Search |
| status | Filter |
| is_active | Filter |
| deleted_at | Soft Delete |
| sort_order | Sorting |

---

# Enum Reference

Status

| Value | Description |
|--------|-------------|
| 0 | Inactive |
| 1 | Active |

---

# Base Entity

Province mengikuti Base Entity Standard ERP Travel AI Platform.

Kolom audit tidak boleh dihapus.

---

# Naming Standard

Menggunakan snake_case.

Contoh:

country_id

official_name

created_at

deleted_by

---

# Data Ownership

Province merupakan Global Master Data.

Province tidak dimiliki oleh Company.

---

# Cache Recommendation

Province termasuk Master Data yang jarang berubah.

Disarankan:

- Preload saat Login
- Offline Cache pada Flutter
- Cache API

---

# Integration

Province digunakan oleh:

- Company
- Branch
- Customer
- Jamaah
- Vendor
- Supplier
- Booking
- Hotel
- Airport
- Dashboard
- AI

---

# Catatan

Province merupakan Parent Entity untuk City.

Seluruh City wajib menggunakan province_id sebagai Foreign Key.