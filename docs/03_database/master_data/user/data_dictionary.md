# USER DATA DICTIONARY

Version : 1.0

Status : APPROVED

Master Data Code : MD-USER

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Database Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan struktur Master Data User yang digunakan oleh PostgreSQL, REST API, Flutter, Authentication Service, AI Engine, Dashboard, dan seluruh Business Module.

Data Dictionary merupakan Single Source of Truth untuk struktur data User.

---

# Table Information

| Item | Value |
|------|--------|
| Table Name | users |
| Primary Key | user_id |
| Master Data Code | MD-USER |
| Domain | Company Management |
| Database | PostgreSQL |
| Soft Delete | Yes |
| Audit Log | Enabled |

---

# Columns

| No | Column | Type | Length | Null | Default | Index | Description |
|----|--------|------|--------|------|----------|-------|-------------|
| 1 | user_id | UUID | - | No | UUID | PK | Primary Key |
| 2 | employee_id | UUID | - | Yes | NULL | FK | Employee |
| 3 | company_id | UUID | - | No | - | FK | Company Owner |
| 4 | username | VARCHAR | 100 | No | - | Unique | Username |
| 5 | email | VARCHAR | 200 | Yes | NULL | Unique | Login Email |
| 6 | password_hash | TEXT | - | No | - | - | Password Hash |
| 7 | auth_provider | VARCHAR | 50 | No | Local | Yes | Authentication Provider |
| 8 | last_login_at | TIMESTAMP | - | Yes | NULL | Yes | Last Login |
| 9 | failed_login_count | INTEGER | - | No | 0 | - | Failed Login Counter |
|10 | locked_until | TIMESTAMP | - | Yes | NULL | - | Lock Expiration |
|11 | user_status | VARCHAR | 30 | No | Pending | Yes | User Status |
|12 | created_at | TIMESTAMP | - | No | NOW() | - | Created Date |
|13 | created_by | UUID | - | No | - | - | Created By |
|14 | updated_at | TIMESTAMP | - | Yes | NULL | - | Updated Date |
|15 | updated_by | UUID | - | Yes | NULL | - | Updated By |
|16 | deleted_at | TIMESTAMP | - | Yes | NULL | - | Soft Delete |
|17 | deleted_by | UUID | - | Yes | NULL | - | Deleted By |

---

# Primary Key

| Column |
|---------|
| user_id |

---

# Unique Constraints

| Constraint | Columns |
|------------|---------|
| UQ_USER_COMPANY_USERNAME | company_id + username |
| UQ_USER_EMAIL | email |

---

# Foreign Keys

| Column | Reference |
|---------|-----------|
| employee_id | employees.employee_id |
| company_id | companies.company_id |

---

# Recommended Index

- company_id
- employee_id
- username
- email
- user_status
- auth_provider
- last_login_at

---

# Controlled Denormalization

User menyimpan:

- company_id
- employee_id

untuk meningkatkan performa:

- Authentication
- Dashboard
- Audit
- Security Analytics

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

- Login Analytics
- Security Analytics
- Executive Briefing
- AI Security Recommendation

---

# Related Master Data

- Company
- Employee
- Role
- Permission

---

# Related Architecture Decisions

- AD-038 Security by Design Policy
- AD-044 One Database Per Tenant Policy
- AD-055 Golden Standard Protection Policy
- AD-056 Company Boundary Policy
- UAS-001 User Account Separation Standard
- APS-001 Authentication Provider Standard

---

# Catatan

User merupakan identitas digital untuk autentikasi dan otorisasi.

Seluruh relasi menggunakan UUID dan Company tetap menjadi Data Owner utama.