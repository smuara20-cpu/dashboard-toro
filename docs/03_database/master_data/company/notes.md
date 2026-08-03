# COMPANY NOTES

Version : 1.0

Status : APPROVED

Master Data Code : MD-COMPANY

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Enterprise Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini berisi catatan implementasi, keputusan desain, batasan sistem, praktik terbaik (Best Practices), integrasi, serta rencana pengembangan Master Data Company.

Dokumen ini menjadi referensi bagi Business Analyst, Database Engineer, Backend Developer, Flutter Developer, AI Engineer, QA Engineer, DevOps Engineer, dan Architecture Team.

---

# Design Notes

## DN-001

Company merupakan Root Entity pada Domain Company Management.

Seluruh Master Data organisasi wajib memiliki referensi `company_id`.

---

## DN-002

Identity Company bersifat permanen.

Perubahan nama perusahaan tidak mengubah:

- company_id
- company_code

---

## DN-003

Company menggunakan UUID sebagai Primary Key.

UUID digunakan pada seluruh relasi Database, REST API, AI, Dashboard, dan Audit Log.

---

## DN-004

Seluruh transaksi operasional wajib dimiliki oleh satu Company.

Tidak diperbolehkan terdapat transaksi tanpa Company sebagai pemilik data.

---

## DN-005

Company menggunakan konsep Soft Delete.

Physical Delete tidak diperbolehkan.

---

# Architecture Notes

Master Data Company merupakan implementasi dari:

- Domain Company Management
- One Database Per Tenant Policy
- Company Boundary Policy
- Security by Design Policy

Master Data ini menjadi fondasi seluruh Domain operasional.

---

# Performance Notes

Master Data Company harus mendukung:

- Search
- Filtering
- Sorting
- Pagination
- Dashboard Analytics
- Executive Briefing

Seluruh pencarian utama harus menggunakan Index.

---

# Integration Notes

Master Data Company digunakan oleh:

- Branch
- Department
- Position
- Employee
- User
- Role
- Permission
- Customer
- Jamaah
- Booking
- Finance
- Marketing
- Dashboard
- AI Engine

Seluruh integrasi wajib menggunakan `company_id`.

---

# Reference Relationship

Company memiliki hubungan referensi dengan:

- Country
- Province
- City
- District
- Village
- Language (Future)
- Currency (Future)
- Time Zone (Future)

Reference digunakan sebagai referensi data, bukan kepemilikan data.

---

# Ownership Relationship

Company menjadi Owner bagi:

- Branch
- Department
- Position
- Employee
- User
- Role
- Permission
- Office
- Business Unit
- Working Calendar
- Holiday Calendar
- Company Settings

Ownership Relationship menentukan batas data (Data Boundary) pada setiap Tenant.

---

# AI Notes

Master Data Company digunakan oleh:

- AI Company Intelligence
- Executive Briefing Engine
- AI Marketing Director
- Travel Intelligence Engine

AI hanya memiliki hak:

- Read
- Analytics
- Recommendation

AI tidak diperbolehkan mengubah Master Data Company secara langsung.

---

# Executive Intelligence Notes

Executive Briefing menggunakan Master Data Company untuk:

- Company Profile
- Company Status
- Subscription Status
- Organization Summary

Executive Briefing hanya dikirim sesuai konfigurasi Company.

---

# Best Practices

- Gunakan UUID sebagai referensi utama.
- Jangan gunakan Company Name sebagai Foreign Key.
- Hindari hardcode Company Code.
- Seluruh validasi mengacu pada Validation Rules.
- Seluruh perubahan mengacu pada Business Rules.
- Seluruh perubahan penting wajib dicatat pada Audit Log.

---

# Known Limitation

Versi 1.0 belum mendukung:

- Holding Company
- Franchise Management
- Merger History
- Acquisition History
- Historical Organization Structure
- Multiple Legal Entity dalam satu Tenant

Fitur tersebut direncanakan pada versi berikutnya apabila terdapat kebutuhan bisnis.

---

# Future Expansion

Master Data Company dirancang agar siap mendukung:

- Multi Holding Company
- Franchise Network
- Regional Office
- International Company
- AI Organization Analytics
- AI Company Benchmark
- Executive KPI Dashboard
- Enterprise Reporting
- SaaS Platform

---

# Related Architecture Decisions

- AD-038 Security by Design Policy
- AD-044 One Database Per Tenant Policy
- AD-051 Multi-Language User Experience Policy
- AD-052 Cultural Localization Policy
- AD-053 Internationalization First Policy
- AD-054 Configuration Over Customization Policy
- AD-055 Golden Standard Protection Policy
- AD-056 Company Boundary Policy

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

Master Data Company merupakan Golden Master untuk seluruh Master Data pada Domain Company Management.

Seluruh implementasi Database, REST API, Flutter, AI, Dashboard, Reporting, serta Business Module wajib mengacu pada struktur Master Data Company yang telah ditetapkan.