# COMPANY DATA DICTIONARY

Version : 1.0

Status : APPROVED

Master Data Code : MD-COMPANY

Domain Code : DOM-002

Last Updated : 2026-08-02

Owner : Database Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan struktur Master Data Company yang akan digunakan oleh PostgreSQL, REST API, Flutter, AI Engine, Dashboard, Reporting, dan seluruh Business Module.

Data Dictionary merupakan Single Source of Truth untuk struktur data Company.

---

# Table Information

| Item | Value |
|------|--------|
| Table Name | companies |
| Primary Key | company_id |
| Master Data Code | MD-COMPANY |
| Domain | Company Management |
| Database | PostgreSQL |
| Multi Tenant | One Database Per Tenant |
| Soft Delete | Yes |
| Audit Log | Enabled |

---

# Columns

| No | Column | Type | Length | Null | Default | Index | Description |
|----|--------|------|--------|------|----------|-------|-------------|
| 1 | company_id | UUID | - | No | UUID | PK | Primary Key |
| 2 | company_code | VARCHAR | 30 | No | - | Unique | Company Code |
| 3 | legal_name | VARCHAR | 200 | No | - | Yes | Legal Company Name |
| 4 | display_name | VARCHAR | 200 | No | - | Yes | Display Name |
| 5 | brand_name | VARCHAR | 200 | Yes | NULL | - | Brand Name |
| 6 | company_type | VARCHAR | 50 | No | - | Yes | Company Type |
| 7 | registration_number | VARCHAR | 100 | Yes | NULL | - | Business Registration Number |
| 8 | tax_identification_number | VARCHAR | 100 | Yes | NULL | - | Tax ID |
| 9 | email | VARCHAR | 200 | Yes | NULL | - | Primary Email |
| 10 | phone | VARCHAR | 30 | Yes | NULL | - | Primary Phone |
| 11 | website | VARCHAR | 255 | Yes | NULL | - | Website |
| 12 | logo_url | TEXT | - | Yes | NULL | - | Company Logo |
| 13 | favicon_url | TEXT | - | Yes | NULL | - | Company Favicon |
| 14 | country_id | UUID | - | No | - | FK | Country |
| 15 | province_id | UUID | - | Yes | NULL | FK | Province/State |
| 16 | city_id | UUID | - | Yes | NULL | FK | City |
| 17 | district_id | UUID | - | Yes | NULL | FK | District |
| 18 | village_id | UUID | - | Yes | NULL | FK | Village |
| 19 | postal_code | VARCHAR | 20 | Yes | NULL | - | Postal Code |
| 20 | address_line_1 | VARCHAR | 255 | No | - | - | Address Line 1 |
| 21 | address_line_2 | VARCHAR | 255 | Yes | NULL | - | Address Line 2 |
| 22 | default_language_code | VARCHAR | 10 | No | en | - | Default Language |
| 23 | default_currency_code | VARCHAR | 10 | No | USD | - | Default Currency |
| 24 | default_timezone | VARCHAR | 50 | No | UTC | - | Time Zone |
| 25 | fiscal_year_start_month | SMALLINT | - | No | 1 | - | Fiscal Year Start |
| 26 | company_status | VARCHAR | 30 | No | Registered | Yes | Company Status |
| 27 | verification_status | VARCHAR | 30 | No | Pending | - | Verification Status |
| 28 | subscription_plan | VARCHAR | 50 | Yes | NULL | - | Subscription Plan |
| 29 | license_expired_at | TIMESTAMP | - | Yes | NULL | - | License Expiration |
| 30 | created_at | TIMESTAMP | - | No | NOW() | - | Created Date |
| 31 | created_by | UUID | - | No | - | - | Created By |
| 32 | updated_at | TIMESTAMP | - | Yes | NULL | - | Updated Date |
| 33 | updated_by | UUID | - | Yes | NULL | - | Updated By |
| 34 | deleted_at | TIMESTAMP | - | Yes | NULL | - | Soft Delete |
| 35 | deleted_by | UUID | - | Yes | NULL | - | Deleted By |

---

# Primary Key

| Column |
|---------|
| company_id |

---

# Unique Constraints

| Column |
|---------|
| company_code |

---

# Foreign Keys

| Column | Reference |
|---------|-----------|
| country_id | countries.country_id |
| province_id | provinces.province_id |
| city_id | cities.city_id |
| district_id | districts.district_id |
| village_id | villages.village_id |

---

# Recommended Index

- company_code
- legal_name
- display_name
- company_status
- country_id
- city_id

---

# Soft Delete Policy

Record tidak dihapus secara fisik.

Menggunakan:

- deleted_at
- deleted_by

---

# Audit Fields

Seluruh perubahan wajib menggunakan:

- created_at
- created_by
- updated_at
- updated_by
- deleted_at
- deleted_by

Audit Log disimpan pada tabel Audit Log sesuai Security Policy.

---

# Related Master Data

- Country
- Province
- City
- District
- Village
- Language
- Currency
- Time Zone

---

# AI Readiness

Struktur tabel mendukung:

- AI Company Intelligence
- Executive Briefing
- Dashboard Analytics
- Reporting
- Multi Language
- Multi Country

---

# Related Architecture Decisions

- AD-038 Security by Design Policy
- AD-040 Canonical Address Policy
- AD-044 One Database Per Tenant Policy
- AD-051 Multi-Language User Experience Policy
- AD-053 Internationalization First Policy
- AD-054 Configuration Over Customization Policy
- AD-056 Company Boundary Policy

---

# Catatan

Perubahan struktur tabel Company wajib melalui Architecture Review, Impact Analysis, dan Architecture Decision apabila memengaruhi Business Rules.