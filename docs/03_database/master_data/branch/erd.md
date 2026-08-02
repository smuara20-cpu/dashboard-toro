# BRANCH ENTITY RELATIONSHIP DIAGRAM (ERD)

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

Dokumen ini mendefinisikan hubungan (Entity Relationship) Master Data Branch dengan Master Data lain dan Business Module pada TIOS (Travel Intelligence Operating System).

ERD menjadi acuan resmi implementasi PostgreSQL, REST API, Flutter, AI Engine, Dashboard, dan Reporting.

---

# Entity

Primary Entity

- Branch

Parent Entity

- Company

Reference Entity

- Country
- Province
- City
- District
- Village

Child Entity

- Department
- Employee
- Office
- Booking
- Customer
- Jamaah
- Inventory (Future)

---

# Reference Relationship

```text
Country
    │
    ▼
Province
    │
    ▼
City
    │
    ▼
District
    │
    ▼
Village
    │
    ▼
Branch
```

Branch menggunakan Global Location sebagai referensi alamat operasional.

---

# Ownership Relationship

```text
Company
    │
    ▼
Branch
    │
    ├────────────► Department
    │
    ├────────────► Employee
    │
    ├────────────► Office
    │
    ├────────────► Booking
    │
    ├────────────► Customer
    │
    ├────────────► Jamaah
    │
    └────────────► Inventory (Future)
```

Branch merupakan unit operasional milik Company.

---

# Cardinality

| Parent | Child | Cardinality |
|----------|--------|-------------|
| Company | Branch | 1 : N |
| Country | Branch | 1 : N |
| Province | Branch | 1 : N |
| City | Branch | 1 : N |
| District | Branch | 1 : N |
| Village | Branch | 1 : N |
| Branch | Department | 1 : N |
| Branch | Employee | 1 : N |
| Branch | Booking | 1 : N |
| Branch | Customer | 1 : N |
| Branch | Jamaah | 1 : N |

---

# Foreign Key

| Child | Foreign Key |
|---------|-------------|
| Branch | company_id |
| Branch | country_id |
| Branch | province_id |
| Branch | city_id |
| Branch | district_id |
| Branch | village_id |
| Department | branch_id |
| Employee | branch_id |
| Booking | branch_id |
| Customer | branch_id |
| Jamaah | branch_id |

---

# Delete Rule

Reference Master Data

- Country → Restrict
- Province → Restrict
- City → Restrict
- District → Restrict
- Village → Restrict

Company

- Restrict

Branch

Menggunakan Soft Delete.

Branch tidak dapat dihapus apabila masih memiliki:

- Department
- Employee
- Booking
- Customer
- Jamaah

---

# Update Rule

Perubahan:

- Branch Name
- Branch Manager
- Branch Status
- Branch Address

tidak mengubah:

- branch_id
- branch_code

Identity Branch bersifat permanen.

---

# Integrity Rule

Seluruh relasi menggunakan UUID.

Tidak diperbolehkan menggunakan:

- branch_name
- company_name

sebagai Foreign Key.

---

# Related Modules

ERD digunakan oleh:

- Company Management
- HR Management
- Booking
- Customer
- Jamaah
- CRM
- Finance
- Dashboard
- AI

---

# AI Readiness

Relasi Branch mendukung:

- Branch Performance Analytics
- Territory Analytics
- Executive Briefing
- AI Recommendation
- Geo Intelligence

---

# Related Architecture Decisions

- AD-033 Hierarchical Foreign Key Policy
- AD-038 Security by Design Policy
- AD-044 One Database Per Tenant Policy
- AD-055 Golden Standard Protection Policy
- AD-056 Company Boundary Policy

---

# Catatan

Master Data Branch merupakan implementasi struktur organisasi tingkat operasional.

Seluruh relasi wajib mengacu pada Company sebagai Data Owner.