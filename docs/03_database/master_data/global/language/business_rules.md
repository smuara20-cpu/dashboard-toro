# LANGUAGE BUSINESS RULES

Version : 1.0

Status : APPROVED

Master Data Name : Language

Master Data Code : MD-LANGUAGE

Category : Global Master

Domain : Global

Business Owner : Platform Management

Technical Owner : Platform Engineering

Reviewer : Enterprise Architecture Team

Approval : APPROVED

Last Updated : 2026-08-03

---

# Tujuan

Dokumen ini mendefinisikan seluruh aturan bisnis (Business Rules) untuk Master Data Language.

Master Data Language menjadi referensi resmi seluruh bahasa yang digunakan pada ERP Travel Platform.

---

# Scope

Dokumen ini mencakup:

- Struktur Language
- ISO Language Code
- Default Language
- Active Status
- Multi Language Support
- Company Configuration
- AI Language
- Integrasi dengan seluruh modul

---

# Business Rules

## BR-001

Setiap Language wajib memiliki Language Code yang unik.

---

## BR-002

Language Code mengikuti standar ISO 639-1.

Contoh:

- id
- en
- ar
- ja
- zh
- fr

---

## BR-003

Setiap Language wajib memiliki:

- Language Name
- Native Name
- ISO Code
- Status

---

## BR-004

Satu Company hanya memiliki satu Default Language.

---

## BR-005

Company dapat mengaktifkan lebih dari satu Language.

---

## BR-006

Language yang berstatus Inactive tidak dapat dipilih pada konfigurasi Company.

---

## BR-007

Perubahan Language tidak mengubah data historis transaksi.

---

## BR-008

Language digunakan oleh:

- Mobile App
- Web App
- Dashboard
- CRM
- Booking
- Finance
- Notification
- AI

---

## BR-009

AI menggunakan Language sesuai preferensi User atau Company.

---

## BR-010

Hard Delete tidak diperbolehkan.

Gunakan Status Active atau Inactive.

---

# Audit

Perubahan Language wajib tercatat pada Audit Log.

Minimal mencatat:

- User
- Timestamp
- Action
- Old Value
- New Value

---

# Related Modules

- Company
- User
- Customer
- CRM
- Booking
- Dashboard
- Notification
- AI

---

# Final Review

Master Data Language dinyatakan memenuhi Business Rules apabila seluruh aturan di atas diterapkan secara konsisten.

---

# Catatan

Master Data Language merupakan referensi global untuk seluruh fitur multi-bahasa pada ERP Travel Platform.