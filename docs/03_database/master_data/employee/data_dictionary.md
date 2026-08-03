# EMPLOYEE DATA DICTIONARY

Version : 1.0

Status : APPROVED

Master Data Code : MD-EMPLOYEE

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Database Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan struktur Master Data Employee yang digunakan oleh PostgreSQL, REST API, Flutter, AI Engine, Dashboard, Reporting, dan seluruh Business Module.

Data Dictionary merupakan Single Source of Truth untuk struktur data Employee.

---

# Table Information

| Item | Value |
|------|--------|
| Table Name | employees |
| Primary Key | employee_id |
| Master Data Code | MD-EMPLOYEE |
| Domain | Company Management |
| Database | PostgreSQL |
| Soft Delete | Yes |
| Audit Log | Enabled |

---

# Columns

| No | Column | Type | Length | Null | Default | Index | Description |
|----|--------|------|--------|------|----------|-------|-------------|
| 1 | employee_id | UUID | - | No | UUID | PK | Primary Key |
| 2 | employee_code | VARCHAR | 30 | No | Auto Generate | Unique | Employee Code |
| 3 | company_id | UUID | - | No | - | FK | Company Owner |
| 4 | branch_id | UUID | - | No | - | FK | Branch |
| 5 | department_id | UUID | - | No | - | FK | Department |
| 6 | position_id | UUID | - | No | - | FK | Position |
| 7 | full_name | VARCHAR | 200 | No | - | Yes | Employee Full Name |
| 8 | nickname | VARCHAR | 100 | Yes | NULL | - | Nick Name |
| 9 | gender | VARCHAR | 20 | No | - | Yes | Gender |
|10 | place_of_birth | VARCHAR | 100 | Yes | NULL | - | Place of Birth |
|11 | date_of_birth | DATE | - | Yes | NULL | Yes | Date of Birth |
|12 | religion | VARCHAR | 30 | Yes | NULL | Yes | Religion |
|13 | marital_status | VARCHAR | 30 | Yes | NULL | Yes | Marital Status |
|14 | phone_number | VARCHAR | 30 | Yes | NULL | Yes | Mobile Number |
|15 | email | VARCHAR | 200 | Yes | NULL | Yes | Email Address |
|16 | join_date | DATE | No | CURRENT_DATE | Yes | Join Date |
|17 | resign_date | DATE | Yes | NULL | - | Resign Date |
|18 | employment_status | VARCHAR | 30 | No | Permanent | Yes | Employment Status |
|19 | employee_status | VARCHAR | 30 | No | Active | Yes | Active / Inactive |
|20 | photo_url | TEXT | - | Yes | NULL | - | Employee Photo |
|21 | notes | TEXT | - | Yes | NULL | - | Internal Notes |
|22 | created_at | TIMESTAMP | - | No | NOW() | - | Created Date |
|23 | created_by | UUID | - | No | - | - | Created By |
|24 | updated_at | TIMESTAMP | - | Yes | NULL | - | Updated Date |
|25 | updated_by | UUID | - | Yes | NULL | - | Updated By |
|26 | deleted_at | TIMESTAMP | - | Yes | NULL | - | Soft Delete |
|27 | deleted_by | UUID | - | Yes | NULL | - | Deleted By |

---

# Primary Key

| Column |
|---------|
| employee_id |

---

# Unique Constraints

| Constraint | Columns |
|------------|---------|
| UQ_EMPLOYEE_CODE | employee_code |
| UQ_EMPLOYEE_EMAIL | email (nullable) |

---

# Foreign Keys

| Column | Reference |
|---------|-----------|
| company_id | companies.company_id |
| branch_id | branches.branch_id |
| department_id | departments.department_id |
| position_id | positions.position_id |

---

# Recommended Index

- company_id
- branch_id
- department_id
- position_id
- employee_code
- full_name
- employment_status
- employee_status
- phone_number

---

# Controlled Denormalization

Employee menyimpan:

- company_id
- branch_id
- department_id
- position_id

sesuai AD-033 Hierarchical Foreign Key Policy.

Tujuannya untuk meningkatkan performa:

- Dashboard
- HR Analytics
- Executive Briefing
- AI Workforce Analytics

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

- Workforce Analytics
- Organization Analytics
- Executive Briefing
- AI Talent Recommendation

---

# Related Master Data

- Company
- Branch
- Department
- Position
- User

---

# Related Architecture Decisions

- AD-033 Hierarchical Foreign Key Policy
- AD-038 Security by Design Policy
- AD-044 One Database Per Tenant Policy
- AD-055 Golden Standard Protection Policy
- AD-056 Company Boundary Policy
- AD-057 Reality Driven Standardization

---

# Catatan

Employee merupakan identitas individu dalam organisasi.

Seluruh relasi menggunakan UUID dan Company tetap menjadi Data Owner utama.