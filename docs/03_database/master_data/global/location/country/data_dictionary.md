# COUNTRY

Version : 1.0

---

# 1. Overview

Country merupakan Master Data Global yang menyimpan daftar negara yang digunakan oleh seluruh modul ERP Travel AI Platform.

Country menjadi root untuk seluruh struktur lokasi.

---

# 2. Business Purpose

Country digunakan sebagai referensi oleh:

- Company
- Branch
- Customer
- Jamaah
- Vendor
- Supplier
- Hotel
- Airport
- Booking
- Travel Requirement
- AI Agent

---

# 3. Business Rules

Mengacu pada:

country/business_rules.md

---

# 4. Workflow

Platform Administrator

↓

Create Country

↓

Province

↓

City

↓

District

↓

Village

↓

Business Module

---

# 5. Primary Key

| Kolom | Type |
|--------|------|
| id | UUID |

---

# 6. Columns

| Kolom | Type | Null | Default | Keterangan |
|--------|------|------|----------|------------|
| id | UUID | No | gen_random_uuid() | Primary Key |
| iso_alpha2 | VARCHAR(2) | No | - | ISO 3166 Alpha-2 |
| iso_alpha3 | VARCHAR(3) | No | - | ISO 3166 Alpha-3 |
| iso_numeric | VARCHAR(3) | Yes | - | ISO Numeric |
| name | VARCHAR(150) | No | - | Nama Negara |
| official_name | VARCHAR(200) | Yes | - | Nama Resmi |
| nationality | VARCHAR(150) | Yes | - | Sebutan Warga Negara |
| dialing_code | VARCHAR(10) | Yes | - | Kode Telepon |
| currency_code | VARCHAR(3) | Yes | - | ISO Currency |
| timezone_default | VARCHAR(100) | Yes | - | Default Timezone |
| flag_emoji | VARCHAR(10) | Yes | - | Emoji Bendera |
| flag_url | TEXT | Yes | - | URL Gambar Bendera |
| is_active | BOOLEAN | No | TRUE | Status Aktif |

---

# 7. Base Entity

Seluruh Master Data menggunakan Base Entity.

| Kolom | Type |
|--------|------|
| created_at | TIMESTAMP |
| created_by | UUID |
| updated_at | TIMESTAMP |
| updated_by | UUID |
| deleted_at | TIMESTAMP |
| deleted_by | UUID |

---

# 8. Relationships

Has Many

- Province
- Company
- Branch
- Customer
- Jamaah
- Vendor
- Supplier
- Hotel
- Airport

---

# 9. Index

- iso_alpha2
- iso_alpha3
- name
- is_active

---

# 10. Unique

- iso_alpha2
- iso_alpha3
- name

---

# 11. Security

Country merupakan Global Master.

Tidak memiliki company_id.

Hanya Platform Administrator yang dapat melakukan Create, Update, dan Inactivate.

Company hanya memiliki hak Read.

---

# 12. Validation

Mengacu pada:

country/validation_rules.md

---

# 13. Soft Delete

Country menggunakan Soft Delete.

Hard Delete tidak diperbolehkan.

Apabila Country masih digunakan oleh Province atau modul lain, Country tidak dapat dinonaktifkan sebelum relasi tersebut diselesaikan sesuai kebijakan bisnis.

---

# 14. Business Scenario

Platform Administrator menambahkan:

Saudi Arabia

↓

Province

Makkah

↓

City

Makkah

↓

Company membuat Package Umroh

↓

Customer memilih Package

↓

Booking menggunakan Country Saudi Arabia

Seluruh modul menggunakan Country yang sama sebagai referensi.

---

# 15. AI Readiness

Country dapat digunakan oleh AI untuk:

- Travel Recommendation
- Travel Requirement
- Visa Recommendation
- Dashboard Analytics
- Country Statistics

AI wajib menggunakan country_id sebagai referensi utama.

---

# 16. Future Expansion

Country dirancang untuk mendukung:

- Multi Language
- Multi Currency
- Embassy Information
- Visa Requirement
- Prayer Time
- Travel Advisory
- Emergency Contact
- Weather Integration
- Public Holiday
- Country Profile

---

# 17. Owner

Platform

---

# 18. Module Dependency

Digunakan oleh:

- Core
- CRM
- Customer
- Jamaah
- Booking
- Finance
- Package
- Hotel
- Ticket
- Travel Requirement
- Dashboard
- AI

---

# 19. Audit

Seluruh perubahan Country wajib tercatat pada Audit Log.

Audit minimal mencatat:

- User
- Tanggal
- Aksi
- Data Lama
- Data Baru
- IP Address
- Device

---

# 20. Notes

Country merupakan Master Data Global pertama yang dibuat.

Dokumen Country menjadi template standar bagi seluruh Master Data berikutnya seperti Province, City, Currency, Airline, Airport, Bank, dan lainnya.