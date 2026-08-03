# COMPANY SECURITY REVIEW

Version : 1.0

Status : APPROVED

Master Data Code : MD-COMPANY

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Security Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan standar keamanan (Security Review) untuk Master Data Company.

Security Review memastikan bahwa seluruh implementasi Database, REST API, Flutter, AI, Dashboard, dan integrasi eksternal memenuhi standar keamanan ERP Travel AI Platform.

---

# Security Objectives

Master Data Company harus menjamin:

- Kerahasiaan (Confidentiality)
- Integritas (Integrity)
- Ketersediaan (Availability)
- Keterlacakan (Traceability)
- Isolasi Tenant (Tenant Isolation)

---

# Access Control

## Read

Diizinkan untuk:

- Owner
- CEO
- Director
- General Manager
- Company Administrator

Sesuai Role dan Permission.

---

## Create

Diizinkan untuk:

- Platform Administrator
- Super Administrator

---

## Update

Diizinkan untuk:

- Company Administrator
- Platform Administrator

Perubahan harus sesuai Permission.

---

## Delete

Physical Delete

❌ Tidak diperbolehkan.

Menggunakan Soft Delete.

---

# Multi-Tenant Isolation

Setiap Company memiliki:

- Database sendiri
- Storage sendiri
- Backup sendiri
- Audit Log sendiri

Tidak diperbolehkan ada akses lintas Tenant.

Mengacu pada AD-044.

---

# Authentication

Seluruh akses wajib melalui Authentication.

Metode yang didukung:

- Email + Password
- OAuth (Future)
- SSO (Future)
- MFA (Future)

---

# Authorization

Hak akses wajib menggunakan:

- Role
- Permission

Tidak diperbolehkan melakukan hardcode hak akses pada aplikasi.

---

# Audit Log

Audit Log wajib mencatat:

- Create Company
- Update Company
- Change Status
- Change Legal Name
- Change Branding
- Change Company Settings

Minimal mencatat:

- User
- Waktu
- IP Address
- Perubahan
- Device (Future)

---

# Sensitive Data

Field berikut dikategorikan sebagai Sensitive Data:

- Tax Identification Number
- Registration Number
- Email
- Phone

Harus mengikuti kebijakan perlindungan data yang berlaku.

---

# Encryption

Seluruh komunikasi wajib menggunakan HTTPS/TLS.

Data sensitif yang disimpan mengikuti kebijakan enkripsi platform.

---

# API Security

REST API wajib menerapkan:

- Authentication
- Authorization
- Input Validation
- Rate Limiting
- Audit Logging

---

# Flutter Security

Flutter Application wajib:

- Tidak menyimpan data sensitif secara hardcode.
- Menggunakan Secure Storage untuk token.
- Menghapus Session saat Logout.
- Mengikuti Session Management Policy.

---

# AI Security

AI hanya memiliki hak:

- Read Only
- Recommendation
- Analytics

AI tidak diperbolehkan:

- Mengubah Company
- Menghapus Company
- Mengubah Permission
- Mengubah Company Status

Kecuali melalui workflow resmi yang disetujui.

---

# Executive Briefing

Executive Briefing hanya dapat diakses oleh:

- Owner
- CEO
- Director
- General Manager

Sesuai Business Rules Executive Briefing.

---

# Logging & Monitoring

Sistem wajib memonitor:

- Login Gagal
- Percobaan Akses Tidak Sah
- Perubahan Data Company
- Aktivitas Administrator

---

# Backup & Recovery

Master Data Company wajib termasuk dalam:

- Daily Backup
- Weekly Backup
- Disaster Recovery Plan

Backup harus dapat dipulihkan (Restore) sesuai Recovery Procedure.

---

# Compliance

Master Data Company harus mendukung:

- Multi-Tenant Security
- Security by Design
- Audit Trail
- Local Regulation Compliance
- Data Protection Policy

---

# Related Architecture Decisions

- AD-038 Security by Design Policy
- AD-044 One Database Per Tenant Policy
- AD-055 Golden Standard Protection Policy
- AD-056 Company Boundary Policy

---

# Security Checklist

| Item | Status |
|------|--------|
| Authentication | ✅ |
| Authorization | ✅ |
| Audit Log | ✅ |
| Tenant Isolation | ✅ |
| Soft Delete | ✅ |
| Encryption | ✅ |
| API Security | ✅ |
| AI Security | ✅ |
| Executive Access | ✅ |

---

# Final Review

Master Data Company dinyatakan memenuhi standar keamanan apabila seluruh checklist telah berstatus APPROVED dan tidak ditemukan pelanggaran terhadap Security by Design Policy.

---

# Catatan

Security Review merupakan dokumen wajib sebelum implementasi Database, REST API, Flutter, AI, dan Dashboard. Seluruh perubahan kebijakan keamanan harus melalui Architecture Review dan Architecture Decision apabila berdampak pada standar keamanan platform.