# DEPARTMENT NOTES

Version : 1.0

Status : APPROVED

Master Data Code : MD-DEPARTMENT

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Enterprise Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini berisi catatan implementasi, keputusan desain, batasan sistem, praktik terbaik (Best Practices), integrasi, serta rencana pengembangan Master Data Department.

Dokumen ini menjadi referensi bagi Business Analyst, Database Engineer, Backend Developer, Flutter Developer, AI Engineer, QA Engineer, DevOps Engineer, dan Architecture Team.

---

# Design Notes

## DN-001

Department merupakan Business Function resmi pada struktur organisasi TIOS.

Department menjadi penghubung antara struktur organisasi dan proses bisnis.

---

## DN-002

Setiap Department wajib berada di bawah satu Branch.

Data Owner utama tetap Company.

---

## DN-003

Identity Department bersifat permanen.

Perubahan:

- Department Name
- Department Head
- Department Category
- Department Description

tidak mengubah:

- department_id
- department_code

---

## DN-004

Department menggunakan UUID sebagai Primary Key.

Seluruh relasi menggunakan UUID.

---

## DN-005

Department menggunakan Soft Delete.

Physical Delete tidak diperbolehkan.

---

# Architecture Notes

Master Data Department merupakan implementasi dari:

- Company Management Domain
- Organization Structure
- Business Function Architecture
- Company Boundary Policy
- Security by Design Policy

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

Department merupakan Business Function, bukan Data Owner.

---

# Business Function

Contoh Department:

- Sales
- Marketing
- Finance
- Accounting
- HR
- IT
- Legal
- Procurement
- Customer Service
- Visa
- Ticketing
- Hotel Reservation
- Tour Operation
- Umrah Operation
- Hajj Operation

Daftar tersebut dapat berkembang sesuai kebutuhan perusahaan.

---

# Performance Notes

Master Data Department harus mendukung:

- Search
- Filtering
- Sorting
- Pagination
- Organization Analytics
- Department KPI
- Executive Briefing

Seluruh pencarian utama wajib menggunakan Index.

---

# Integration Notes

Master Data Department digunakan oleh:

- Position
- Employee
- HR
- Booking
- CRM
- Finance
- Marketing
- Dashboard
- AI Engine

Seluruh integrasi wajib menggunakan:

- department_id
- branch_id
- company_id

---

# Controlled Denormalization

Department menyimpan:

- company_id
- branch_id

sesuai AD-033 Hierarchical Foreign Key Policy.

Hal ini dilakukan untuk meningkatkan performa Dashboard, Reporting, AI Analytics, dan Executive Briefing.

---

# AI Notes

Master Data Department digunakan oleh:

- AI Organization Intelligence
- AI Workforce Analytics
- Executive Briefing Engine
- Department Performance Analytics

AI hanya memiliki hak:

- Read
- Analytics
- Recommendation

---

# Best Practices

- Gunakan UUID sebagai Foreign Key.
- Jangan gunakan Department Name sebagai relasi.
- Gunakan Department Category secara konsisten.
- Seluruh perubahan penting wajib dicatat pada Audit Log.
- Seluruh implementasi harus mengikuti Company Boundary Policy.

---

# Known Limitation

Versi 1.0 belum mendukung:

- Matrix Organization
- Cross Department Assignment
- Temporary Department
- Department Merge History
- Department Split History

---

# Future Expansion

Master Data Department dirancang agar siap mendukung:

- Department Category Master Data
- Matrix Organization
- Shared Services
- AI Workforce Planning
- AI Organization Benchmark
- Department KPI Dashboard
- Enterprise Reporting

---

# Related Architecture Decisions

- AD-033 Hierarchical Foreign Key Policy
- AD-038 Security by Design Policy
- AD-044 One Database Per Tenant Policy
- AD-055 Golden Standard Protection Policy
- AD-056 Company Boundary Policy
- AD-057 Reality Driven Standardization

---

# Cross References

| Reference | Description |
|-----------|-------------|
| BR-003 | Company sebagai Data Owner |
| BR-009 | Department Head |
| BR-015 | Department Category |
| VR-006 | Company melalui Branch |
| VR-012 | Department Closed |
| BS-DEPARTMENT-001 | Membuat Department |
| BS-DEPARTMENT-004 | Menutup Department |
| SR-001 | Hak akses Department |

---

# Related Documents

- business_rules.md
- validation_rules.md
- data_dictionary.md
- erd.md
- sample_data.md
- business_scenarios.md
- security_review.md
- review.md
- changelog.md

---

# Catatan

Master Data Department merupakan Golden Template ketiga pada Domain Company Management.

Seluruh implementasi Database, REST API, Flutter, AI, Dashboard, serta Business Module wajib mengacu pada struktur Master Data Department yang telah ditetapkan.