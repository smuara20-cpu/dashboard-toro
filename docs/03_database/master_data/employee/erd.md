# EMPLOYEE ENTITY RELATIONSHIP DIAGRAM (ERD)

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

Dokumen ini mendefinisikan hubungan (Entity Relationship) Master Data Employee dengan Master Data lain dan Business Module pada TIOS (Travel Intelligence Operating System).

ERD menjadi acuan resmi implementasi PostgreSQL, REST API, Flutter, AI Engine, Dashboard, dan Reporting.

---

# Entity

Primary Entity

- Employee

Parent Entity

- Position

Grand Parent Entity

- Department
- Branch
- Company

Reference Entity

- User
- Role
- Employment Profile (Future)
- Personal Profile (Future)
- Certification Profile (Future)

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

Employee merupakan individu yang mengisi Position dalam struktur organisasi.

---

# Profile Architecture

```text
Employee
    │
    ├── Personal Profile
    ├── Employment Profile
    ├── Contact Profile
    ├── Family Profile
    ├── Education Profile
    ├── Certification Profile
    ├── Payroll Profile
    ├── Bank Profile
    └── Emergency Contact
```

Seluruh profile menggunakan `employee_id` sebagai Foreign Key.

---

# Cardinality

| Parent | Child | Cardinality |
|----------|--------|-------------|
| Company | Branch | 1 : N |
| Branch | Department | 1 : N |
| Department | Position | 1 : N |
| Position | Employee | 1 : N |
| Employee | User | 1 : 0..1 |

---

# Foreign Key

| Child | Foreign Key |
|---------|-------------|
| Employee | company_id |
| Employee | branch_id |
| Employee | department_id |
| Employee | position_id |
| User | employee_id |

---

# Delete Rule

Company

- Restrict

Branch

- Restrict

Department

- Restrict

Position

- Restrict

Employee

- Soft Delete

Employee tidak dapat dihapus apabila telah memiliki histori operasional.

---

# Update Rule

Perubahan:

- Branch
- Department
- Position
- Employment Status

tidak mengubah:

- employee_id
- employee_code

Identity Employee bersifat permanen.

---

# Integrity Rule

Seluruh relasi menggunakan UUID.

Tidak diperbolehkan menggunakan:

- full_name
- employee_code

sebagai Foreign Key.

---

# Controlled Denormalization

Employee menyimpan:

- company_id
- branch_id
- department_id
- position_id

sesuai AD-033 Hierarchical Foreign Key Policy.

---

# Related Modules

ERD digunakan oleh:

- HR Management
- Payroll
- Attendance
- Leave
- Booking
- Tour Assignment
- Dashboard
- AI

---

# AI Readiness

Relasi Employee mendukung:

- Workforce Analytics
- Career Analytics
- Executive Briefing
- AI Talent Recommendation

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

Employee merupakan identitas individu dalam organisasi dan menjadi pusat integrasi seluruh modul Human Resource pada TIOS.