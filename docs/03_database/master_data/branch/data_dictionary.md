# BRANCH DATA DICTIONARY

Version : 1.0

Status : APPROVED

Master Data Code : MD-BRANCH

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Database Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan struktur Master Data Branch yang digunakan oleh PostgreSQL, REST API, Flutter, AI Engine, Dashboard, Reporting, dan seluruh Business Module.

Data Dictionary merupakan Single Source of Truth untuk struktur data Branch.

---

# Table Information

| Item | Value |
|------|--------|
| Table Name | branches |
| Primary Key | branch_id |
| Master Data Code | MD-BRANCH |
| Domain | Company Management |
| Database | PostgreSQL |
| Soft Delete | Yes |
| Audit Log | Enabled |

---

# Columns

| No | Column | Type | Length | Null | Default | Index | Description |
|----|--------|------|--------|------|----------|-------|-------------|
| 1 | branch_id | UUID | - | No | UUID | PK | Primary Key |
| 2 | company_id | UUID | - | No | - | FK | Company Owner |
| 3 | branch_code | VARCHAR | 30 | No | - | Unique* | Branch Code |
| 4 | branch_name | VARCHAR | 200 | No | - | Yes | Branch Name |
| 5 | branch_type | VARCHAR | 50 | No | Branch Office | Yes | Branch Type |
| 6 | manager_employee_id | UUID | - | Yes | NULL | FK | Branch Manager |
| 7 | email | VARCHAR | 200 | Yes | NULL | - | Branch Email |
| 8 | phone | VARCHAR | 30 | Yes | NULL | - | Branch Phone |
| 9 | website | VARCHAR | 255 | Yes | NULL | - | Branch Website |
| 10 | country_id | UUID | - | No | - | FK | Country |
| 11 | province_id | UUID | - | Yes | NULL | FK | Province |
| 12 | city_id | UUID | - | Yes | NULL | FK | City |
| 13 | district_id | UUID | - | Yes | NULL | FK | District |
| 14 | village_id | UUID | - | Yes | NULL | FK | Village |
| 15 | postal_code | VARCHAR | 20 | Yes | NULL | - | Postal Code |
| 16 | address_line_1 | VARCHAR | 255 | No | - | - | Address Line 1 |
| 17 | address_line_2 | VARCHAR | 255 | Yes | NULL | - | Address Line 2 |
| 18 | branch_status | VARCHAR | 30 | No | Draft | Yes | Branch Status |
| 19 | opened_at | DATE | - | Yes | NULL | - | Opening Date |
| 20 | closed_at | DATE | - | Yes | NULL | - | Closing Date |
| 21 | latitude | DECIMAL(10,7) | - | Yes | NULL | - | Latitude |
| 22 | longitude | DECIMAL(10,7) | - | Yes | NULL | - | Longitude |
| 23 | created_at | TIMESTAMP | - | No | NOW() | - | Created Date |
| 24 | created_by | UUID | - | No | - | - | Created By |
| 25 | updated_at | TIMESTAMP | - | Yes | NULL | - | Updated Date |
| 26 | updated_by | UUID | - | Yes | NULL | - | Updated By |
| 27 | deleted_at | TIMESTAMP | - | Yes | NULL | - | Soft Delete |
| 28 | deleted_by | UUID | - | Yes | NULL | - | Deleted By |

---

# Primary Key

| Column |
|---------|
| branch_id |

---

# Unique Constraints

| Constraint | Columns |
|------------|---------|
| UQ_BRANCH_COMPANY_CODE | company_id + branch_code |

---

# Foreign Keys

| Column | Reference |
|---------|-----------|
| company_id | companies.company_id |
| manager_employee_id | employees.employee_id |
| country_id | countries.country_id |
| province_id | provinces.province_id |
| city_id | cities.city_id |
| district_id | districts.district_id |
| village_id | villages.village_id |

---

# Recommended Index

- company_id
- branch_code
- branch_name
- branch_status
- manager_employee_id
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

---

# AI Readiness

Struktur tabel mendukung:

- Branch Analytics
- Executive Briefing
- AI Branch Performance
- Geo Analytics
- Multi Branch Reporting

---

# Related Master Data

- Company
- Employee
- Country
- Province
- City
- District
- Village

---

# Related Architecture Decisions

- AD-033 Hierarchical Foreign Key Policy
- AD-038 Security by Design Policy
- AD-040 Canonical Address Policy
- AD-044 One Database Per Tenant Policy
- AD-056 Company Boundary Policy

---

# Catatan

Branch merupakan unit operasional resmi milik Company.

Seluruh relasi menggunakan UUID dan mengacu pada Company sebagai Data Owner.