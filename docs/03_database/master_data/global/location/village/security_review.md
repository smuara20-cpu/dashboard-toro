# VILLAGE SECURITY REVIEW

Version : 1.1

Status : APPROVED

Last Updated : 2026-08-02

Owner : Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan standar keamanan untuk Master Data Village agar seluruh data wilayah administrasi terlindungi, konsisten, dapat diaudit, dan memenuhi kebutuhan ERP Travel AI Platform.

Dokumen ini menjadi acuan implementasi pada Database, REST API, Flutter, AI Engine, Dashboard, dan seluruh Business Module.

---

# Security Objective

- Menjaga integritas Master Data Village.
- Menjamin hanya data resmi yang digunakan.
- Mencegah perubahan tanpa otorisasi.
- Menjamin seluruh perubahan dapat diaudit.
- Mendukung Multi-Tenant Architecture.
- Mendukung AI yang terpercaya (Trusted AI).

---

# Security Rules

## SR-001

Master Data Village merupakan Global Master Data.

Company tidak diperbolehkan membuat, mengubah, ataupun menghapus data Village.

---

## SR-002

Perubahan hanya dapat dilakukan oleh Platform Administrator atau Role yang memiliki Permission khusus.

---

## SR-003

Seluruh perubahan wajib dicatat pada Audit Log.

Minimal mencatat:

- User
- Role
- Timestamp
- Before
- After
- Reason
- Source

---

## SR-004

Master Data Village hanya boleh berasal dari Official Geographic Data Source sesuai AD-045.

Input manual tidak diperbolehkan, kecuali untuk proses koreksi yang telah disetujui melalui Architecture Review.

---

## SR-005

Seluruh proses Import wajib mengikuti Geographic Import Approval Policy (AD-046).

Tahapan wajib:

1. Upload
2. Validation
3. Preview
4. Approval
5. Commit

---

## SR-006

Seluruh Business Module wajib menggunakan:

- country_id
- province_id
- city_id
- district_id
- village_id

Penggunaan nama wilayah sebagai referensi utama tidak diperbolehkan.

---

## SR-007

API wajib memverifikasi seluruh Hierarchical Validation.

Country

↓

Province

↓

City

↓

District

↓

Village

Apabila tidak valid,

transaksi wajib ditolak.

---

## SR-008

Village yang telah digunakan pada transaksi tidak boleh dihapus.

Status hanya dapat menjadi:

Inactive

---

## SR-009

AI hanya memiliki hak:

Read Only

AI tidak diperbolehkan:

- Create
- Update
- Delete

---

## SR-010

Seluruh komunikasi API wajib menggunakan koneksi terenkripsi (HTTPS/TLS).

---

## SR-011

Seluruh perubahan wilayah harus mengikuti:

- AD-039 Geographic Change Management Policy
- AD-042 Geographic Versioning Policy

---

## SR-012

Setiap perubahan Master Data Village wajib melalui Architecture Review apabila memengaruhi struktur data, Business Rules, atau relasi hierarki.

---

# Multi-Tenant Policy

Setiap Tenant memiliki database sendiri sesuai AD-044.

Namun struktur Master Data Village tetap mengikuti Global Location Standard.

---

# AI Security

AI wajib:

- Menggunakan data resmi.
- Menggunakan relasi yang valid.
- Mengikuti Explainable AI Policy.
- Mengikuti AI Confidence Policy.
- Mengikuti Trusted External Data Policy.

AI tidak diperbolehkan memberikan rekomendasi berdasarkan data Village yang belum tervalidasi.

---

# Audit Requirement

Seluruh perubahan wajib memiliki jejak audit yang dapat ditelusuri.

Minimal mencakup:

- Timestamp
- User
- Role
- Device (jika tersedia)
- IP Address (jika tersedia)
- Before
- After
- Reason
- Import Source (jika berasal dari proses impor)

---

# Security Review Result

Master Data Village memenuhi standar keamanan untuk digunakan pada:

- Database
- REST API
- Flutter
- AI Engine
- Dashboard
- Business Module

Status

✅ APPROVED

---

# Architecture Reference

Security Review mengacu pada:

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

---

# Catatan

Master Data Village merupakan fondasi referensi alamat pada ERP Travel AI Platform.

Seluruh implementasi keamanan wajib mengacu pada dokumen ini agar kualitas data tetap terjaga pada seluruh Tenant.