# USER ENTITY RELATIONSHIP DIAGRAM (ERD)

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

Dokumen ini mendefinisikan hubungan (Entity Relationship) Master Data User dengan Master Data lain dan Business Module pada TIOS (Travel Intelligence Operating System).

ERD menjadi acuan resmi implementasi PostgreSQL, REST API, Flutter, Authentication Service, AI Engine, Dashboard, dan Reporting.

---

# Entity

Primary Entity

- User

Parent Entity

- Company

Reference Entity

- Employee
- Role
- Permission
- Authentication Provider
- Login Activity
- Trusted Device
- Security Notification

---

# Identity Architecture

```text
Company
    │
    ▼
Employee (0..1)
    │
    ▼
User
    │
    ├── Role
    ├── Permission
    ├── Login Activity
    ├── Trusted Device
    ├── Authentication Provider
    └── Security Notification
```

User merupakan identitas digital yang digunakan untuk mengakses sistem.

---

# Cardinality

| Parent | Child | Cardinality |
|----------|--------|-------------|
| Company | User | 1 : N |
| Employee | User | 1 : 0..1 |
| User | Role | M : N |
| Role | Permission | M : N |
| User | Login Activity | 1 : N |
| User | Trusted Device | 1 : N |
| User | Security Notification | 1 : N |

---

# Foreign Key

| Child | Foreign Key |
|---------|-------------|
| User | company_id |
| User | employee_id |
| Login Activity | user_id |
| Trusted Device | user_id |
| Security Notification | user_id |

---

# Delete Rule

Company

- Restrict

Employee

- Restrict

User

- Soft Delete

Role

- Restrict

Permission

- Restrict

---

# Update Rule

Perubahan:

- Username
- Email
- Password
- Authentication Provider

tidak mengubah:

- user_id

Identity digital bersifat permanen.

---

# Integrity Rule

Seluruh relasi menggunakan UUID.

Tidak diperbolehkan menggunakan:

- username
- email

sebagai Foreign Key.

---

# Controlled Denormalization

User menyimpan:

- company_id
- employee_id

sesuai AD-033 Hierarchical Foreign Key Policy.

---

# Authentication Architecture

User mendukung:

- Local Account
- Google
- Microsoft
- Apple
- LDAP
- SSO

melalui Authentication Provider.

---

# Security Architecture

ERD mendukung:

- Login Activity
- Trusted Device
- OTP
- Session Timeout
- Security Notification
- Concurrent Session
- Risk Based Authentication

---

# AI Readiness

Relasi User mendukung:

- Login Analytics
- Security Analytics
- Executive Briefing
- AI Security Recommendation

---

# Related Modules

- Dashboard
- AI
- Audit Log
- Authentication
- Authorization
- Security Center

---

# Related Architecture Decisions

- AD-038 Security by Design Policy
- AD-044 One Database Per Tenant Policy
- AD-055 Golden Standard Protection Policy
- AD-056 Company Boundary Policy
- UAS-001 User Account Separation Standard
- APS-001 Authentication Provider Standard
- LAS-001 Login Activity Standard

---

# Catatan

Master Data User merupakan pusat identitas digital dan keamanan akses pada TIOS.

Seluruh autentikasi, otorisasi, audit, dan analitik keamanan mengacu pada struktur ini.