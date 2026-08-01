# VILLAGE NOTES

Version : 1.1

Status : APPROVED

Last Updated : 2026-08-02

Owner : Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini berisi catatan implementasi, keputusan desain, batasan sistem, integrasi, Data Flow, serta rencana pengembangan Master Data Village.

Village merupakan fondasi seluruh referensi alamat operasional pada ERP Travel AI Platform.

---

# Design Notes

## DN-001

Village merupakan level administrasi terakhir pada Global Location.

---

## DN-002

Seluruh transaksi wajib menggunakan:

- country_id
- province_id
- city_id
- district_id
- village_id

sesuai AD-040 Canonical Address Policy.

---

## DN-003

ERP Travel AI Platform menggunakan Controlled Denormalization sesuai AD-033.

Tujuannya untuk meningkatkan performa Dashboard, AI Analytics, Reporting, dan Geo Intelligence.

---

## DN-004

Village menjadi Single Source of Truth seluruh referensi alamat.

Nama Village tidak boleh digunakan sebagai Foreign Key.

---

## DN-005

Identity Village bersifat permanen.

Perubahan nama Village tidak mengubah village_id.

---

## DN-006

Seluruh perubahan wilayah mengikuti:

- Geographic Change Management Policy
- Geographic Versioning Policy
- Geographic Audit Trail Policy

---

# Performance Notes

Village harus mendukung:

- Smart Lookup
- Pagination
- Search
- Filtering
- Sorting
- Dashboard Analytics
- AI Analytics
- Territory Performance
- Heatmap

Seluruh pencarian wajib menggunakan Index.

---

# Integration Notes

Village digunakan oleh:

- Company
- Branch
- Customer
- Jamaah
- Vendor
- Supplier
- Booking
- CRM
- Finance
- Marketing
- Dashboard
- AI
- Executive Briefing
- Territory Performance

---

# AI Notes

Village menjadi sumber data utama bagi:

- Intelligent Address Engine
- Geo Search Engine
- Geo Intelligence Engine
- AI Geo Timeline
- AI Recommendation Engine
- AI Marketing Director
- Executive Briefing Engine

AI hanya memiliki hak Read Only.

Seluruh rekomendasi AI wajib mengikuti Explainable AI Policy dan AI Confidence Policy.

---

# Known Limitation

Versi 1.1 belum mendukung:

- Historical Boundary Visualization
- GIS Polygon
- Multi-language Village Name
- Offline Geographic Dataset
- Automatic Government Synchronization

Fitur tersebut akan dipertimbangkan pada versi berikutnya.

---

# Future Expansion

Village dirancang agar siap mendukung:

- GIS Integration
- Digital Map Integration
- Heatmap Analytics
- Geo Fencing
- AI Geo Timeline
- AI Route Optimization
- AI Territory Expansion
- Multi Country Geographic Dataset

---

# Architecture Decisions

Dokumen ini mengacu pada:

- AD-033 — Hierarchical Foreign Key Policy
- AD-038 — Security by Design Policy
- AD-039 — Geographic Change Management Policy
- AD-040 — Canonical Address Policy
- AD-041 — Hierarchical Validation Policy
- AD-042 — Geographic Versioning Policy
- AD-043 — Geographic Reference Integrity Policy
- AD-044 — One Database Per Tenant Policy
- AD-045 — Official Geographic Data Source Policy
- AD-046 — Geographic Import Approval Policy
- AD-047 — Geographic Audit Trail Policy

---

# Data Flow

```text
                User
                  │
                  ▼
      Flutter / Web Application
                  │
                  ▼
          Authentication
                  │
                  ▼
              REST API
                  │
                  ▼
         Validation Rules
                  │
                  ▼
          Business Rules
                  │
                  ▼
             PostgreSQL
                  │
      ┌───────────┼────────────┬────────────┐
      ▼           ▼            ▼            ▼
 Audit Log   AI Engine   Dashboard   Executive Briefing
```

## Data Flow Description

1. User memilih Village.
2. Flutter atau Web mengirim permintaan ke REST API.
3. Authentication memverifikasi hak akses.
4. Validation Rules memverifikasi seluruh input.
5. Business Rules memverifikasi Hierarchical Validation.
6. Database menyimpan referensi village_id.
7. Audit Log mencatat seluruh perubahan.
8. AI Engine melakukan analisis wilayah.
9. Dashboard dan Executive Briefing menampilkan hasil sesuai Role dan Permission.

---

# Data Consumer

Master Data Village digunakan oleh:

- Authentication
- Company Module
- Branch Module
- Customer Module
- Jamaah Module
- Vendor Module
- Supplier Module
- Booking Module
- CRM Module
- Finance Module
- Marketing Module
- Dashboard Module
- AI Engine
- Executive Briefing Engine
- Reporting Engine

---

# Data Owner

Platform Administrator

---

# Data Steward

Platform Data Administrator

---

# Update Frequency

Master Data Village diperbarui apabila:

- Terdapat perubahan resmi dari pemerintah.
- Terdapat perubahan administrasi wilayah.
- Terdapat Official Geographic Dataset baru.
- Terdapat Architecture Decision (AD).
- Terdapat Architecture Review (AR).

Seluruh perubahan wajib melalui:

- Geographic Import Approval
- Architecture Review
- Audit Trail

---

# Related Documents

Dokumen yang berkaitan:

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

Master Data Village merupakan fondasi seluruh referensi alamat operasional pada ERP Travel AI Platform.

Seluruh Business Module wajib menggunakan village_id sebagai referensi wilayah administrasi resmi.

---

# Document Classification

Classification

Internal

Audience

- Architecture Team
- Database Engineer
- Backend Developer
- Flutter Developer
- AI Engineer
- QA Engineer
- DevOps Engineer
- Project Manager

Dokumen ini tidak diperuntukkan bagi End User.