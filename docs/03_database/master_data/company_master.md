# COMPANY MASTER

Version : 1.0

---

# Tujuan

Company Master merupakan kumpulan Master Data yang dimiliki oleh masing-masing Company.

Data Company Master dapat berbeda antar Company sesuai kebutuhan operasional masing-masing.

---

# Fungsi

Company Master digunakan untuk:

- Menyimpan konfigurasi operasional Company.
- Menjadi referensi Business Module.
- Mendukung Workflow.
- Mendukung Dashboard.
- Mendukung AI Agent.
- Mendukung Multi Company.

---

# Karakteristik

Company Master memiliki karakteristik berikut.

- Dimiliki oleh Company.
- Dapat berbeda antar Company.
- Dikelola oleh Administrator Company.
- Digunakan oleh Business Module.
- Tidak digunakan oleh Company lain.

---

# Daftar Company Master

## Finance

- Bank
- Bank Branch
- Payment Method
- Payment Channel

---

## CRM

- Lead Source
- Customer Category
- Customer Status

---

## Organization

- Department
- Division
- Position
- Job Title
- Employment Type

---

## Travel

- Package Category
- Package Type

---

## System

- Approval Level
- Notification Channel
- Document Type
- Attachment Type

---

# Pengelolaan

Company Master hanya dapat dikelola oleh Administrator Company yang memiliki Permission.

Setiap Company hanya dapat melihat dan mengelola Company Master miliknya sendiri.

---

# Penggunaan

Company Master digunakan oleh:

- CRM
- Customer
- Jamaah
- Booking
- Package
- Finance
- Workflow
- Dashboard
- AI
- Notification

---

# Business Rules

- Seluruh Company Master wajib memiliki company_id.
- Company tidak dapat mengakses Company Master milik Company lain.
- Seluruh perubahan wajib tercatat pada Audit Log.
- Seluruh Company Master menggunakan Base Entity.
- Seluruh Company Master wajib memiliki Business Rules.
- Seluruh Company Master wajib memiliki Data Dictionary.
- Seluruh Company Master wajib memiliki ERD.
- Seluruh Company Master wajib memiliki SQL sebelum implementasi.

---

# Security

Company Master wajib menggunakan Row Level Security (RLS).

Seluruh query harus difilter berdasarkan company_id.

---

# Future Expansion

Company Master dirancang untuk mendukung:

- White Label
- Franchise
- Multi Brand
- AI Recommendation
- Workflow Automation
- SaaS Platform