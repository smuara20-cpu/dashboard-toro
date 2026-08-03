# COMPANY MANAGEMENT DOMAIN MODEL

Version : 1.0

Status : APPROVED

Domain Code : DOM-002

Last Updated : 2026-08-02

Owner : Business Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan Domain Model Company Management.

Domain Model menjelaskan hubungan antar Business Entity sebelum diterjemahkan menjadi Database, API, maupun Flutter.

Domain Model merupakan representasi bisnis, bukan struktur tabel database.

---

# Domain Entities

Domain Company Management terdiri dari Business Entity berikut:

- Company
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
- Company Branding
- Subscription
- License
- Company Settings

---

# Entity Relationship

```text
Company
│
├── Branch
│
├── Department
│     │
│     └── Position
│
├── Employee
│      │
│      └── User
│
├── Role
│      │
│      └── Permission
│
├── Business Unit
│
├── Office
│
├── Working Calendar
│
├── Holiday Calendar
│
├── Branding
│
├── Subscription
│
├── License
│
└── Company Settings
```

---

# Domain Ownership

Company merupakan Root Entity.

Seluruh Business Entity pada Domain Company Management dimiliki oleh Company.

Tidak diperbolehkan terdapat Business Entity tanpa Company sebagai Owner.

Mengacu pada:

- AD-044 One Database Per Tenant Policy
- AD-056 Company Boundary Policy

---

# Aggregate Boundary

Aggregate Root:

- Company

Child Entity:

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
- Branding
- Subscription
- License
- Company Settings

---

# Domain Rules

- Company wajib ada sebelum Branch dibuat.
- Branch wajib berada pada satu Company.
- Department wajib berada pada satu Branch.
- Position berada pada satu Department.
- Employee berada pada satu Company.
- User terhubung dengan Employee.
- Role dapat digunakan oleh banyak User.
- Permission diberikan melalui Role.

---

# Domain Lifecycle

Company

↓

Branch

↓

Department

↓

Position

↓

Employee

↓

User

↓

Role

↓

Permission

↓

Operational

---

# External Dependency

Domain ini menggunakan:

- Global Location
- Authentication
- Notification
- Audit Log

---

# Used By

Domain ini digunakan oleh:

- Customer & Jamaah
- Product Management
- Booking
- Finance
- Marketing
- Dashboard
- AI Intelligence
- Executive Intelligence

---

# AI Readiness

Domain Model mendukung:

- AI Company Intelligence
- Executive Briefing
- Organization Analytics
- Organization Recommendation

AI hanya memiliki hak akses sesuai Permission.

---

# Future Expansion

Domain ini dirancang agar siap mendukung:

- Multi Holding Company
- Franchise
- Regional Office
- International Branch
- Matrix Organization
- AI Organization Structure
- Organization Performance Analytics

---

# Catatan

Domain Model merupakan acuan utama sebelum menyusun Master Data, Data Dictionary, ERD, REST API, Flutter, dan AI.