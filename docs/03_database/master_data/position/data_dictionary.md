# POSITION DATA DICTIONARY

Version : 1.0

Status : APPROVED

Master Data Code : MD-POSITION

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Database Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan struktur Master Data Position yang digunakan oleh PostgreSQL, REST API, Flutter, AI Engine, Dashboard, Reporting, dan seluruh Business Module.

Data Dictionary merupakan Single Source of Truth untuk struktur data Position.

---

# Table Information

| Item | Value |
|------|--------|
| Table Name | positions |
| Primary Key | position_id |
| Master Data Code | MD-POSITION |
| Domain | Company Management |
| Database | PostgreSQL |
| Soft Delete | Yes |
| Audit Log | Enabled |

---

# Columns

| No | Column | Type | Length | Null | Default | Index | Description |
|----|--------|------|--------|------|----------|-------|-------------|
| 1 | position_id | UUID | - | No | UUID | PK | Primary Key |
| 2 | company_id | UUID | - | No | - | FK | Company Owner (Controlled Denormalization) |
| 3 | branch_id | UUID | - | No | - | FK | Branch |
| 4 | department_id | UUID | - | No | - | FK | Department |
| 5 | parent_position_id | UUID | - | Yes | NULL | FK | Parent Position |
| 6 | position_code | VARCHAR | 30 | No | - | Unique* | Position Code |
| 7 | position_name | VARCHAR | 200 | No | - | Yes | Position Name |
| 8 | position_type | VARCHAR | 50 | Yes | NULL | Yes | Position Type (Future Standard) |
| 9 | position_level | VARCHAR | 20 | Yes | NULL | Yes | Position Level (Future Standard) |
| 10 | max_employee | INTEGER | - | Yes | 1 | - | Maximum Employee |
| 11 | position_status | VARCHAR | 30 | No | Draft | Yes | Position Status |
| 12 | description | TEXT | - | Yes | NULL | - | Position Description |
| 13 | sort_order | INTEGER | - | Yes | 0 | Yes | Display Order |
| 14 | created_at | TIMESTAMP | - | No | NOW() | - | Created Date |
| 15 | created_by | UUID | - | No | - | - | Created By |
| 16 | updated_at | TIMESTAMP | - | Yes | NULL | - | Updated Date |
| 17 | updated_by | UUID | - | Yes | NULL | - | Updated By |
| 18 | deleted_at | TIMESTAMP | - | Yes | NULL | - | Soft Delete |
| 19 | deleted_by | UUID | - | Yes | NULL | - | Deleted By |

---

# Primary Key

| Column |
|---------|
| position_id |

---

# Unique Constraints

| Constraint | Columns |
|------------|---------|
| UQ_POSITION_DEPARTMENT_CODE | department_id + position_code |

---

# Foreign Keys

| Column | Reference |
|---------|-----------|
| company_id | companies.company_id |
| branch_id | branches.branch_id |
| department_id | departments.department_id |
| parent_position_id | positions.position_id |

---

# Recommended Index

- company_id
- branch_id
- department_id
- position_code
- position_name
- position_status
- parent_position_id
- position_level
- position_type

---

# Controlled Denormalization

Sesuai AD-033 Hierarchical Foreign Key Policy, tabel Position menyimpan:

- company_id
- branch_id
- department_id

untuk meningkatkan performa:

- Dashboard
- Reporting
- AI Analytics
- Executive Briefing

---

# Organization Hierarchy

Position mendukung struktur organisasi bertingkat melalui:

- parent_position_id

Contoh:

CEO

↓

Director

↓

General Manager

↓

Manager

↓

Supervisor

↓

Staff

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
- Position KPI
- Executive Briefing
- AI Workforce Intelligence
- Approval Workflow

---

# Related Master Data

- Company
- Branch
- Department
- Employee
- Role

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

Position merupakan jabatan resmi dalam struktur organisasi.

Seluruh relasi menggunakan UUID dan mengacu pada Company sebagai Data Owner utama.