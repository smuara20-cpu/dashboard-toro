# CURRENCY ENTITY RELATIONSHIP DIAGRAM (ERD)

Version : 1.0

Status : APPROVED

Master Data Name : Currency

Master Data Code : MD-CURRENCY

Category : Global Master

Domain : Global

Business Owner : Finance Domain

Technical Owner : Platform Engineering

Data Steward : Finance Administrator

Reviewer : Enterprise Architecture Team

Approval : APPROVED

Last Updated : 2026-08-03

---

# Tujuan

Dokumen ini mendefinisikan hubungan (relationship) Master Data Currency dengan entitas lain di dalam sistem.

Currency merupakan Global Master Data yang menjadi referensi resmi seluruh transaksi keuangan.

---

# Entity

Currency

Primary Key

currency_id (UUID)

---

# Relationships

## Package

Relationship

Currency (1) ----- (N) Package

Keterangan

Satu Currency dapat digunakan oleh banyak Package.

---

## Booking

Relationship

Currency (1) ----- (N) Booking

Keterangan

Setiap Booking menggunakan satu Currency.

---

## Invoice

Relationship

Currency (1) ----- (N) Invoice

---

## Payment

Relationship

Currency (1) ----- (N) Payment

---

## Refund

Relationship

Currency (1) ----- (N) Refund

---

## Vendor

Relationship

Currency (1) ----- (N) Vendor

---

## Supplier

Relationship

Currency (1) ----- (N) Supplier

---

## Company

Relationship

Company (1) ----- (1) Default Currency

Keterangan

Setiap Company wajib memiliki satu Default Currency.

---

# Entity Diagram

```text
                Company
                    │
                    │
                    ▼
               Default Currency
                    │
                    ▼
+--------------------------------+
|            Currency            |
+--------------------------------+
| currency_id (PK)               |
| currency_code                  |
| currency_name                  |
| currency_symbol                |
| decimal_digits                 |
| is_default                     |
| status                         |
+--------------------------------+
     │
     ├────────────► Package
     │
     ├────────────► Booking
     │
     ├────────────► Invoice
     │
     ├────────────► Payment
     │
     ├────────────► Refund
     │
     ├────────────► Vendor
     │
     └────────────► Supplier
```

---

# Cardinality

| Entity | Relationship |
|---------|--------------|
| Company | 1 : 1 (Default Currency) |
| Package | 1 : N |
| Booking | 1 : N |
| Invoice | 1 : N |
| Payment | 1 : N |
| Refund | 1 : N |
| Vendor | 1 : N |
| Supplier | 1 : N |

---

# Business Constraints

ERD-001

Currency tidak boleh dihapus apabila telah digunakan oleh transaksi.

---

ERD-002

Currency hanya boleh memiliki satu Currency Code.

---

ERD-003

Setiap Company hanya boleh memiliki satu Default Currency.

---

ERD-004

Exchange Rate bukan bagian dari Entity Currency.

Exchange Rate memiliki Master Data tersendiri.

---

# Related Documents

- business_rules.md
- validation_rules.md
- data_dictionary.md
- business_scenarios.md
- sample_data.md
- security_review.md
- review.md
- notes.md
- changelog.md

---

# Final Review

Relationship pada dokumen ini menjadi acuan seluruh implementasi Database, ORM, API, Dashboard, AI Engine, Reporting, dan Data Warehouse.

---

# Catatan

Perubahan Relationship wajib melalui Architecture Review dan diperbarui pada seluruh dokumentasi terkait.