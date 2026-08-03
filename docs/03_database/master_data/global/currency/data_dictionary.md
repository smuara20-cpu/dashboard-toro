# CURRENCY DATA DICTIONARY

Version : 1.0

Status : APPROVED

Master Data Name : Currency

Master Data Code : MD-CURRENCY

Category : Global Master

Domain : Global

Owner : Finance Domain

Reviewer : Enterprise Architecture Team

Approval : APPROVED

Last Updated : 2026-08-03

---

# Tujuan

Dokumen ini mendefinisikan seluruh atribut Master Data Currency yang digunakan oleh sistem.

Seluruh modul wajib menggunakan struktur data yang didefinisikan pada dokumen ini.

---

# Entity

Currency

---

# Primary Key

currency_id

UUID

---

# Attributes

| Field | Type | Required | Description |
|--------|------|----------|-------------|
| currency_id | UUID | Yes | Primary Key |
| currency_code | VARCHAR(3) | Yes | ISO 4217 Currency Code |
| currency_name | VARCHAR(100) | Yes | Nama mata uang |
| currency_symbol | VARCHAR(10) | Yes | Simbol mata uang |
| decimal_digits | INTEGER | Yes | Jumlah digit desimal |
| is_default | BOOLEAN | Yes | Default Currency Company |
| status | ENUM | Yes | Active / Inactive |
| sort_order | INTEGER | No | Urutan tampilan |
| remarks | TEXT | No | Catatan |
| created_at | TIMESTAMP | Yes | Waktu dibuat |
| created_by | UUID | Yes | User pembuat |
| updated_at | TIMESTAMP | No | Waktu terakhir diubah |
| updated_by | UUID | No | User terakhir mengubah |
| deleted_at | TIMESTAMP | No | Soft Delete |
| deleted_by | UUID | No | User penghapus |

---

# Enumeration

## Status

- Active
- Inactive

---

# Constraints

currency_code

- Unique
- 3 karakter
- ISO 4217

currency_name

- Tidak boleh kosong

currency_symbol

- Tidak boleh kosong

decimal_digits

- Nilai yang direkomendasikan:
    - 0
    - 2
    - 3
    - 4

---

# Default Values

| Field | Default |
|--------|----------|
| status | Active |
| is_default | False |
| sort_order | 0 |

---

# Relationships

Currency digunakan oleh:

- Package
- Booking
- Invoice
- Payment
- Refund
- Vendor
- Supplier
- Finance
- Dashboard
- Report

---

# Index Recommendation

- currency_code (Unique)
- currency_name
- status
- is_default

---

# Audit Fields

Seluruh perubahan harus mencatat:

- Created By
- Created At
- Updated By
- Updated At
- Deleted By
- Deleted At

---

# Related Documents

- business_rules.md
- validation_rules.md
- business_scenarios.md
- erd.md
- security_review.md
- review.md
- notes.md
- changelog.md

---

# Final Review

Seluruh atribut wajib digunakan secara konsisten oleh Database, API, Dashboard, Mobile App, AI Engine, Import Data, dan Export Data.

---

# Catatan

Perubahan struktur data hanya dapat dilakukan melalui Architecture Review dan wajib diperbarui pada seluruh dokumentasi terkait.