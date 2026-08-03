# DEPARTMENT ENTITY RELATIONSHIP DIAGRAM (ERD)

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

Dokumen ini mendefinisikan hubungan (Entity Relationship) Master Data Department dengan Master Data lain dan Business Module pada TIOS (Travel Intelligence Operating System).

ERD menjadi acuan resmi implementasi PostgreSQL, REST API, Flutter, AI Engine, Dashboard, dan Reporting.

---

# Entity

Primary Entity

- Department

Parent Entity

- Branch

Grand Parent Entity

- Company

Child Entity

- Position
- Employee

Reference Entity

- Department Category (Future Master Data)

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

Department merupakan Business Function dalam struktur organisasi.

---

# Business Transaction Relationship

```text
Department
    │
    ├────────► Booking
    │
    ├────────► CRM
    │
    ├────────► Marketing
    │
    ├────────► Finance
    │
    ├────────► Customer Service
    │
    └────────► Operational Activity
```

Department menjadi pusat pelaksanaan fungsi bisnis sesuai bidangnya.

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
    ├────────► Position
    │
    └────────► Employee
```

Company tetap menjadi Data Owner utama.

---

# Cardinality

| Parent | Child | Cardinality |
|----------|--------|-------------|
| Company | Branch | 1 : N |
| Branch | Department | 1 : N |
| Department | Position | 1 : N |
| Department | Employee | 1 : N |

---

# Foreign Key

| Child | Foreign Key |
|---------|-------------|
| Department | company_id |
| Department | branch_id |
| Position | department_id |
| Employee | department_id |

---

# Delete Rule

Company

- Restrict

Branch

- Restrict

Department

- Soft Delete

Department tidak dapat dihapus apabila masih memiliki:

- Position
- Employee

---

# Update Rule

Perubahan:

- Department Name
- Department Head
- Department Status
- Department Description

tidak mengubah:

- department_id
- department_code

Identity Department bersifat permanen.

---

# Integrity Rule

Seluruh relasi menggunakan UUID.

Tidak diperbolehkan menggunakan:

- department_name
- branch_name
- company_name

sebagai Foreign Key.

---

# Controlled Denormalization

Department menyimpan:

- company_id
- branch_id

sesuai AD-033 Hierarchical Foreign Key Policy.

---

# Related Modules

ERD digunakan oleh:

- HR Management
- Booking
- CRM
- Finance
- Marketing
- Dashboard
- AI

---

# AI Readiness

Relasi Department mendukung:

- Organization Analytics
- Department KPI
- Executive Briefing
- AI Organization Intelligence

---

# Related Architecture Decisions

- AD-033 Hierarchical Foreign Key Policy
- AD-038 Security by Design Policy
- AD-044 One Database Per Tenant Policy
- AD-055 Golden Standard Protection Policy
- AD-056 Company Boundary Policy

---

# Catatan

Master Data Department merupakan implementasi Business Function pada struktur organisasi TIOS.

Seluruh relasi wajib mengacu pada Company sebagai Data Owner utama melalui Branch.