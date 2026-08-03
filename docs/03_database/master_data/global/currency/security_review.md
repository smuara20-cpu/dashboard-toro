# CURRENCY SECURITY REVIEW

Version : 1.0

Status : APPROVED

Master Data Name : Currency

Master Data Code : MD-CURRENCY

Category : Global Master

Domain : Global

Business Owner : Finance Domain

Technical Owner : Platform Engineering

Reviewer : Security Architecture Team

Approval : APPROVED

Last Updated : 2026-08-03

---

# Tujuan

Dokumen ini mendefinisikan standar keamanan Master Data Currency agar seluruh transaksi keuangan menggunakan referensi mata uang yang konsisten, aman, dan dapat diaudit.

---

# Security Objectives

Master Data Currency harus menjamin:

- Confidentiality
- Integrity
- Availability
- Traceability
- Auditability
- Company Boundary
- Multi-Tenant Isolation

---

# Access Control

Hak akses mengikuti Role Based Access Control (RBAC).

Role yang diperbolehkan mengelola Currency:

- Owner
- CEO
- Finance Administrator
- Super Administrator

Role lainnya hanya memiliki hak baca sesuai Permission.

---

# Create Currency

Pembuatan Currency baru hanya diperbolehkan apabila:

- Belum terdapat Currency Code yang sama.
- Mengikuti standar ISO 4217.
- Mendapat persetujuan Administrator.

Seluruh proses wajib tercatat pada Audit Log.

---

# Update Currency

Perubahan hanya diperbolehkan pada atribut yang tidak memengaruhi identitas utama Currency.

Contoh:

- Display Name
- Symbol
- Decimal Digits
- Description
- Status

Perubahan Currency Code tidak diperbolehkan apabila telah digunakan pada transaksi.

---

# Delete Policy

Currency tidak boleh dihapus secara fisik (Hard Delete).

Apabila sudah digunakan pada transaksi, Currency hanya dapat:

- Dinonaktifkan (Inactive)
- Diarsipkan (Archived)

Seluruh histori transaksi harus tetap dapat diakses.

---

# Data Integrity

Sistem wajib memastikan:

- Currency Code unik.
- Currency Code mengikuti ISO 4217.
- Hanya satu Default Currency untuk setiap Company.
- Currency yang digunakan transaksi harus berstatus Active.

---

# Company Boundary

Setiap Company hanya dapat menggunakan Currency yang telah diizinkan.

Perubahan konfigurasi Currency pada satu Company tidak boleh memengaruhi Company lain.

---

# Multi Tenant Isolation

Seluruh data Currency harus mengikuti kebijakan isolasi Tenant.

Tenant tidak dapat:

- Melihat konfigurasi Currency Tenant lain.
- Mengubah konfigurasi Currency Tenant lain.
- Mengakses Audit Log Tenant lain.

---

# AI Security

AI hanya memiliki hak:

- Read
- Analytics
- Recommendation

AI tidak diperbolehkan:

- Menambah Currency
- Mengubah Currency
- Menghapus Currency
- Mengubah Default Currency

Kecuali melalui workflow resmi yang telah disetujui.

---

# Audit Log

Aktivitas berikut wajib dicatat:

- Create Currency
- Update Currency
- Change Status
- Change Default Currency
- Import Currency
- Export Currency
- Configuration Change

Audit minimal mencatat:

- User
- Timestamp
- Action
- Old Value
- New Value
- IP Address
- Device

---

# API Security

Seluruh API Currency wajib:

- Authentication
- Authorization
- Rate Limiting
- Audit Logging
- HTTPS Only

Endpoint yang mengubah data wajib menggunakan metode:

- POST
- PUT
- PATCH

---

# Compliance

Master Data Currency harus memenuhi:

- Security by Design
- Least Privilege Principle
- Zero Trust Principle
- Company Boundary
- Audit Trail
- Multi-Tenant Architecture

---

# Related Documents

- business_rules.md
- validation_rules.md
- data_dictionary.md
- business_scenarios.md
- erd.md
- sample_data.md
- review.md
- notes.md
- changelog.md

---

# Final Review

Master Data Currency dinyatakan memenuhi standar keamanan apabila seluruh kontrol keamanan telah diterapkan, seluruh Audit Log aktif, serta tidak ditemukan pelanggaran terhadap Security by Design Policy.

---

# Catatan

Seluruh implementasi Currency pada ERP Travel Platform wajib mengacu pada dokumen ini.