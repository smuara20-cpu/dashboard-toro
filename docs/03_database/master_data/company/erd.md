# COMPANY ENTITY RELATIONSHIP DIAGRAM (ERD)

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

Dokumen ini mendefinisikan hubungan (Entity Relationship) Master Data Company dengan Master Data lain dan Business Module pada ERP Travel AI Platform.

ERD menjadi acuan resmi implementasi PostgreSQL, REST API, Flutter, AI Engine, dan Dashboard.

---

# Entity

Primary Entity

- Company

Child Entity

- Branch
- Department
- Position
- Employee
- User
- Role
- Permission
- Business Unit
- Office
- Working Calendar
- Holiday Calendar
- Company Settings

Reference Entity

- Country
- Province
- City
- District
- Village

---

# Entity Relationship

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
Company
    │
    ├──────────────┐
    │              │
    ▼              ▼
Branch       Business Unit
    │
    ▼
Department
    │
    ▼
Position
    │
    ▼
Employee
    │
    ▼
User
    │
    ▼
Role
    │
    ▼
Permission

Company
    │
    ├────────────► Office
    │
    ├────────────► Working Calendar
    │
    ├────────────► Holiday Calendar
    │
    └────────────► Company Settings
```

---

# Cardinality

| Parent | Child | Cardinality |
|----------|--------|-------------|
| Country | Company | 1 : N |
| Province | Company | 1 : N |
| City | Company | 1 : N |
| District | Company | 1 : N |
| Village | Company | 1 : N |
| Company | Branch | 1 : N |
| Company | Business Unit | 1 : N |
| Company | Office | 1 : N |
| Company | Department | 1 : N |
| Company | Employee | 1 : N |
| Company | User | 1 : N |
| Company | Role | 1 : N |
| Company | Working Calendar | 1 : N |
| Company | Holiday Calendar | 1 : N |
| Company | Company Settings | 1 : 1 |

---

# Foreign Key

| Child | Foreign Key |
|---------|-------------|
| Company | country_id |
| Company | province_id |
| Company | city_id |
| Company | district_id |
| Company | village_id |
| Branch | company_id |
| Business Unit | company_id |
| Department | company_id |
| Employee | company_id |
| User | company_id |
| Role | company_id |
| Office | company_id |
| Working Calendar | company_id |
| Holiday Calendar | company_id |
| Company Settings | company_id |

---

# Delete Rule

Reference Master Data

Country → Restrict

Province → Restrict

City → Restrict

District → Restrict

Village → Restrict

---

Company

Tidak boleh dihapus apabila masih memiliki:

- Branch
- Employee
- User
- Booking
- Customer
- Finance

Menggunakan Soft Delete.

---

# Update Rule

Perubahan:

- Legal Name
- Brand Name
- Logo
- Company Status

tidak mengubah:

- company_id

Identity Company bersifat permanen.

---

# Integrity Rule

Seluruh relasi wajib menggunakan UUID.

Tidak diperbolehkan menggunakan nama sebagai relasi.

Contoh:

✅ company_id

❌ company_name

---

# Related Modules

ERD ini digunakan oleh:

- Authentication
- Company Management
- Customer Management
- Booking
- CRM
- Finance
- Marketing
- Dashboard
- AI
- Executive Briefing

---

# AI Readiness

Relasi Company dirancang agar mendukung:

- Company Intelligence
- Executive Briefing
- Organization Analytics
- Territory Analytics
- AI Recommendation

---

# Related Architecture Decisions

- AD-033 Hierarchical Foreign Key Policy
- AD-038 Security by Design Policy
- AD-044 One Database Per Tenant Policy
- AD-055 Golden Standard Protection Policy
- AD-056 Company Boundary Policy

---

# Catatan

ERD ini merupakan implementasi teknis dari Domain Model Company Management.

Seluruh perubahan relasi wajib melalui Architecture Review dan Impact Analysis sebelum diterapkan ke Database.