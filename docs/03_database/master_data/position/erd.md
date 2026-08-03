# POSITION ENTITY RELATIONSHIP DIAGRAM (ERD)

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

Dokumen ini mendefinisikan hubungan (Entity Relationship) Master Data Position dengan Master Data lain dan Business Module pada TIOS (Travel Intelligence Operating System).

ERD menjadi acuan resmi implementasi PostgreSQL, REST API, Flutter, AI Engine, Dashboard, dan Reporting.

---

# Entity

Primary Entity

- Position

Parent Entity

- Department

Grand Parent Entity

- Branch
- Company

Child Entity

- Employee

Reference Entity

- Position Level (Future)
- Position Type (Future)
- Approval Level (Future)

---

# Organization Structure

```text
Company
    │
    ▼
Branch
    │
    ▼
Department
    │
    ▼
Position
    │
    ▼
Employee
```

Position merupakan jabatan resmi dalam struktur organisasi.

---

# Reporting Structure

```text
CEO
 │
 ├── Director
 │     │
 │     ├── General Manager
 │     │      │
 │     │      ├── Manager
 │     │      │      │
 │     │      │      ├── Supervisor
 │     │      │      │      │
 │     │      │      │      └── Staff
```

Hierarki dibentuk menggunakan:

- parent_position_id

---

# Ownership Relationship

```text
Company
    │
    ▼
Branch
    │
    ▼
Department
    │
    ▼
Position
    │
    ▼
Employee
```

Company tetap menjadi Data Owner utama.

---

# Cardinality

| Parent | Child | Cardinality |
|----------|--------|-------------|
| Company | Branch | 1 : N |
| Branch | Department | 1 : N |
| Department | Position | 1 : N |
| Position | Employee | 1 : N |

---

# Foreign Key

| Child | Foreign Key |
|---------|-------------|
| Position | company_id |
| Position | branch_id |
| Position | department_id |
| Position | parent_position_id |
| Employee | position_id |

---

# Delete Rule

Company

- Restrict

Branch

- Restrict

Department

- Restrict

Position

- Soft Delete

Position tidak dapat dihapus apabila masih memiliki Employee aktif.

---

# Update Rule

Perubahan:

- Position Name
- Position Type
- Position Level
- Approval Level
- Position Status

tidak mengubah:

- position_id
- position_code

Identity Position bersifat permanen.

---

# Integrity Rule

Seluruh relasi menggunakan UUID.

Tidak diperbolehkan menggunakan:

- position_name
- department_name
- branch_name
- company_name

sebagai Foreign Key.

---

# Controlled Denormalization

Position menyimpan:

- company_id
- branch_id
- department_id

sesuai AD-033 Hierarchical Foreign Key Policy.

---

# Related Modules

ERD digunakan oleh:

- HR Management
- User Management
- Role Management
- Permission Management
- Approval Workflow
- Dashboard
- AI

---

# AI Readiness

Relasi Position mendukung:

- Organization Analytics
- Workforce Planning
- Approval Analytics
- Executive Briefing
- AI Organization Intelligence

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

Master Data Position merupakan fondasi struktur jabatan pada TIOS.

Seluruh relasi wajib mengacu pada Company sebagai Data Owner utama.