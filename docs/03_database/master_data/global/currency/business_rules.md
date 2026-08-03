# CURRENCY BUSINESS RULES

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

Master Data Currency digunakan sebagai referensi resmi seluruh mata uang yang digunakan di dalam sistem.

Currency menjadi dasar transaksi keuangan, harga paket, pembayaran, refund, vendor, supplier, laporan keuangan, dan seluruh modul yang membutuhkan identitas mata uang.

Master Data Currency hanya menyimpan identitas mata uang dan tidak menyimpan nilai kurs.

---

# Business Objectives

Master Data Currency harus mampu:

- Menyediakan daftar mata uang resmi.
- Mendukung transaksi Multi Currency.
- Menjadi referensi seluruh modul keuangan.
- Menjamin konsistensi penggunaan mata uang.
- Mendukung ekspansi internasional.
- Mendukung Multi Company.
- Mendukung Multi Tenant.

---

# Business Rules

## BR-001

Setiap Currency harus memiliki kode internasional ISO 4217.

Contoh:

- IDR
- USD
- EUR
- SAR
- JPY

---

## BR-002

Kode Currency bersifat unik.

Tidak diperbolehkan terdapat dua Currency dengan kode yang sama.

---

## BR-003

Currency memiliki Status:

- Active
- Inactive

Currency yang Inactive tidak dapat digunakan pada transaksi baru.

---

## BR-004

Currency yang telah digunakan pada transaksi tidak dapat dihapus.

Status dapat diubah menjadi Inactive.

---

## BR-005

Perubahan nama Currency wajib dicatat pada Audit Trail.

---

## BR-006

Nilai tukar (Exchange Rate) tidak disimpan pada Master Data Currency.

Exchange Rate dikelola oleh Master Data Exchange Rate.

---

## BR-007

Setiap Company wajib memiliki Default Currency.

---

## BR-008

Satu Company dapat menggunakan lebih dari satu Currency.

---

## BR-009

Currency digunakan oleh:

- Package
- Booking
- Invoice
- Payment
- Finance
- Refund
- Vendor
- Supplier
- Dashboard
- Report

---

## BR-010

Currency wajib mendukung simbol resmi.

Contoh:

- Rp
- $
- €
- ﷼
- ¥

---

## BR-011

Currency wajib mendukung jumlah digit desimal.

Contoh:

- IDR → 0
- USD → 2
- EUR → 2
- JPY → 0

---

## BR-012

Currency wajib mendukung format tampilan sesuai standar internasional.

Contoh:

Rp 1.500.000

USD 1,250.50

EUR 980.75

---

## BR-013

Currency tidak memiliki hak akses tersendiri.

Hak akses mengikuti Permission modul Finance.

---

## BR-014

Seluruh perubahan Currency wajib dicatat pada Audit Trail.

---

## BR-015

Currency harus tersedia melalui API untuk seluruh modul yang membutuhkan.

---

# Dependency

Master Data Currency digunakan oleh:

- Package
- Booking
- Payment
- Finance
- Vendor
- Supplier
- Report
- Dashboard
- AI Analytics

---

# Out of Scope

Master Data Currency tidak mengelola:

- Exchange Rate
- Pajak
- Bank
- Payment Gateway

Modul tersebut memiliki Master Data tersendiri.

---

# Related Documents

- validation_rules.md
- data_dictionary.md
- business_scenarios.md
- erd.md
- review.md
- security_review.md
- notes.md
- changelog.md

---

# Final Review

Master Data Currency dinyatakan memenuhi standar apabila seluruh Business Rules telah diimplementasikan dan digunakan secara konsisten oleh seluruh modul yang bergantung pada Currency.

---

# Catatan

Master Data Currency merupakan Global Master Data.

Seluruh modul wajib menggunakan referensi Currency dari Master Data ini dan tidak diperbolehkan membuat daftar mata uang sendiri.