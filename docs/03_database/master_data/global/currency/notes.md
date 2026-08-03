# CURRENCY NOTES

Version : 1.0

Status : APPROVED

Master Data Name : Currency

Master Data Code : MD-CURRENCY

Category : Global Master

Domain : Global

Business Owner : Finance Domain

Technical Owner : Platform Engineering

Reviewer : Enterprise Architecture Team

Last Updated : 2026-08-03

---

# Tujuan

Dokumen ini berisi catatan implementasi, keputusan arsitektur, rekomendasi pengembangan, serta informasi teknis yang berkaitan dengan Master Data Currency.

Dokumen ini tidak menggantikan Business Rules maupun Data Dictionary.

---

# Implementation Notes

Master Data Currency merupakan referensi utama untuk seluruh transaksi keuangan pada ERP Travel Platform.

Seluruh modul wajib menggunakan referensi Currency yang sama.

Currency tidak boleh dibuat secara lokal oleh masing-masing modul.

---

# Architecture Notes

Currency merupakan bagian dari Global Master Data.

Seluruh transaksi harus mengambil Currency dari Master Data.

Tidak diperbolehkan membuat tabel Currency baru pada modul lain.

---

# Default Currency

Setiap Company wajib memiliki satu Default Currency.

Default Currency digunakan apabila transaksi tidak menentukan Currency secara eksplisit.

Perubahan Default Currency tidak mengubah transaksi yang telah tersimpan sebelumnya.

---

# Exchange Rate

Master Data Currency tidak menyimpan nilai tukar (Exchange Rate).

Exchange Rate dikelola oleh Master Data atau Service terpisah.

Dengan demikian perubahan kurs tidak memengaruhi struktur Master Data Currency.

---

# Integration Notes

Master Data Currency digunakan oleh:

- CRM
- Booking
- Package
- Finance
- Payment
- Vendor
- Supplier
- Hotel
- Ticket
- Visa
- Dashboard
- Report
- AI

Seluruh integrasi menggunakan Currency Code sebagai referensi utama.

---

# Performance Notes

Data Currency relatif kecil dan jarang berubah.

Sistem diperbolehkan menggunakan cache untuk meningkatkan performa pembacaan data.

Cache harus diperbarui secara otomatis apabila terjadi perubahan data Currency.

---

# API Notes

API Currency direkomendasikan menyediakan:

- Get All Currency
- Get Active Currency
- Get Currency By Code

Endpoint perubahan data hanya dapat diakses oleh pengguna yang memiliki hak akses sesuai RBAC.

---

# UI Notes

Currency ditampilkan menggunakan:

- Currency Code
- Currency Name
- Symbol

Pada transaksi, sistem dapat menampilkan simbol mata uang sesuai pengaturan Company.

---

# AI Notes

AI menggunakan Master Data Currency sebagai referensi untuk:

- Analisis transaksi
- Ringkasan keuangan
- Dashboard Insight
- Rekomendasi bisnis

AI tidak diperbolehkan mengubah data Currency.

---

# Future Enhancement

Pengembangan berikut dapat dipertimbangkan:

- Integrasi Exchange Rate otomatis.
- Sinkronisasi dengan layanan kurs resmi.
- Dukungan multi-format tampilan mata uang.
- Riwayat perubahan simbol atau nama Currency.
- Analitik penggunaan Currency per Company.

---

# Best Practice

- Gunakan standar ISO 4217.
- Jangan mengubah Currency Code setelah digunakan.
- Hindari Hard Delete.
- Gunakan Status Active atau Inactive.
- Selalu catat perubahan pada Audit Log.

---

# Related Documents

- business_rules.md
- validation_rules.md
- data_dictionary.md
- business_scenarios.md
- erd.md
- sample_data.md
- security_review.md
- review.md
- changelog.md

---

# Catatan

Master Data Currency merupakan salah satu Global Master Data yang menjadi fondasi seluruh transaksi keuangan pada ERP Travel Platform.

Perubahan terhadap struktur atau kebijakan Currency harus melalui proses Architecture Review dan dicatat pada `changelog.md`.