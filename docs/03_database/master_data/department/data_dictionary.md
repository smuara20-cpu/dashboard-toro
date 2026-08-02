# DEPARTMENT DATA DICTIONARY

Version : 1.0

Status : APPROVED

Master Data Code : MD-DEPARTMENT

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Database Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan struktur Master Data Department yang digunakan oleh PostgreSQL, REST API, Flutter, AI Engine, Dashboard, Reporting, dan seluruh Business Module.

Data Dictionary merupakan Single Source of Truth untuk struktur data Department.

---

# Table Information

| Item | Value |
|------|--------|
| Table Name | departments |
| Primary Key | department_id |
| Master Data Code | MD-DEPARTMENT |
| Domain | Company Management |
| Database | PostgreSQL |
| Soft Delete | Yes |
| Audit Log | Enabled |

---

# Columns

| No | Column | Type | Length | Null | Default | Index | Description |
|----|--------|------|--------|------|----------|-------|-------------|
| 1 | department_id | UUID | - | No | UUID | PK | Primary Key |
| 2 | company_id | UUID | - | No | - | FK | Company Owner (Controlled Denormalization) |
| 3 | branch_id | UUID | - | No | - | FK | Branch |
| 4 | department_code | VARCHAR | 30 | No | - | Unique* | Department Code |
| 5 | department_name | VARCHAR | 200 | No | - | Yes | Department Name |
| 6 | department_category | VARCHAR | 50 | No | General | Yes | Department Category |
| 7 | department_head_employee_id | UUID | - | Yes | NULL | FK | Department Head |
| 8 | department_status | VARCHAR | 30 | No | Draft | Yes | Department Status |
| 9 | description | TEXT | - | Yes | NULL | - | Department Description |
| 10 | sort_order | INTEGER | - | Yes | 0 | Yes | Display Order |
| 11 | created_at | TIMESTAMP | - | No | NOW() | - | Created Date |
| 12 | created_by | UUID | - | No | - | - | Created By |
| 13 | updated_at | TIMESTAMP | - | Yes | NULL | - | Updated Date |
| 14 | updated_by | UUID | - | Yes | NULL | - | Updated By |
| 15 | deleted_at | TIMESTAMP | - | Yes | NULL | - | Soft Delete |
| 16 | deleted_by | UUID | - | Yes | NULL | - | Deleted By |

---

# Primary Key

| Column |
|---------|
| department_id |

---

# Unique Constraints

| Constraint | Columns |
|------------|---------|
| UQ_DEPARTMENT_BRANCH_CODE | branch_id + department_code |

---

# Foreign Keys

| Column | Reference |
|---------|-----------|
| company_id | companies.company_id |
| branch_id | branches.branch_id |
| department_head_employee_id | employees.employee_id |

---

# Recommended Index

- company_id
- branch_id
- department_code
- department_name
- department_category
- department_status
- department_head_employee_id

---

# Controlled Denormalization

Sesuai AD-033 Hierarchical Foreign Key Policy, tabel Department menyimpan:

- company_id
- branch_id

untuk meningkatkan performa:

- Dashboard
- Reporting
- AI Analytics
- Executive Briefing

Company tetap diperoleh secara logis melalui Branch, namun disimpan sebagai referensi untuk optimasi query.

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

- Organization Analytics
- Department Performance
- Executive Briefing
- AI Organization Intelligence

---

# Related Master Data

- Company
- Branch
- Employee

---

# Related Architecture Decisions

- AD-033 Hierarchical Foreign Key Policy
- AD-038 Security by Design Policy
- AD-044 One Database Per Tenant Policy
- AD-055 Golden Standard Protection Policy
- AD-056 Company Boundary Policy

---

# Catatan

Department merupakan Business Function pada struktur organisasi TIOS.

Seluruh relasi menggunakan UUID dan mengacu pada Company sebagai Data Owner utama.