# DEPARTMENT SECURITY REVIEW

Version : 1.0

Status : APPROVED

Master Data Code : MD-DEPARTMENT

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Security Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan standar keamanan (Security Review) untuk Master Data Department.

Security Review memastikan bahwa seluruh implementasi Database, REST API, Flutter, AI, Dashboard, dan integrasi eksternal memenuhi standar keamanan TIOS (Travel Intelligence Operating System).

---

# Security Objectives

Master Data Department harus menjamin:

- Confidentiality
- Integrity
- Availability
- Traceability
- Company Boundary
- Tenant Isolation

---

# Access Control

## Read

Diizinkan untuk:

- Owner
- CEO
- Director
- General Manager
- Department Head
- Branch Manager
- Company Administrator

Sesuai Role dan Permission.

---

## Create

Diizinkan untuk:

- Company Administrator
- Branch Manager (sesuai Permission)

---

## Update

Diizinkan untuk:

- Company Administrator
- Department Head (sesuai Permission)

---

## Delete

Physical Delete

❌ Tidak diperbolehkan.

Menggunakan Soft Delete.

---

# Company Boundary

Seluruh akses Department wajib berada pada Company yang sama.

Department tidak boleh diakses oleh Company lain.

Mengacu pada AD-056 Company Boundary Policy.

---

# Multi-Tenant Isolation

Department mengikuti Tenant milik Company.

Seluruh data Department berada pada Database Company yang bersangkutan.

---

# Authentication

Seluruh akses wajib melalui Authentication.

Metode yang didukung:

- Email + Password
- OAuth (Future)
- Single Sign-On (Future)
- Multi-Factor Authentication (Future)

---

# Authorization

Hak akses wajib menggunakan:

- Role
- Permission

Department Head tidak otomatis memiliki seluruh hak akses.

Hak akses mengikuti konfigurasi Role.

---

# Audit Log

Audit Log wajib mencatat:

- Create Department
- Update Department
- Change Department Head
- Change Department Status
- Change Department Category

Minimal mencatat:

- User
- Timestamp
- IP Address
- Action

---

# Sensitive Data

Field berikut dikategorikan sebagai sensitif:

- Department Head
- Department Description (jika berisi informasi internal)

Pengelolaan data harus mengikuti Data Protection Policy.

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

Flutter wajib:

- Menggunakan Secure Storage.
- Menghapus Session saat Logout.
- Tidak menyimpan Token secara hardcode.

---

# AI Security

AI hanya memiliki hak:

- Read
- Analytics
- Recommendation

AI tidak diperbolehkan:

- Mengubah Department
- Menghapus Department
- Mengubah Department Status

Kecuali melalui workflow resmi yang telah disetujui.

---

# Executive Briefing

Executive hanya dapat melihat Department sesuai Company Boundary dan hak akses yang diberikan.

---

# Logging & Monitoring

Sistem wajib memonitor:

- Login Gagal
- Perubahan Department
- Perubahan Department Head
- Percobaan akses lintas Company

---

# Backup & Recovery

Department termasuk dalam:

- Daily Backup
- Weekly Backup
- Disaster Recovery Plan

---

# Compliance

Master Data Department harus mendukung:

- Security by Design
- Audit Trail
- Company Boundary
- Multi-Tenant Security
- Data Protection

---

# Related Architecture Decisions

- AD-038 Security by Design Policy
- AD-044 One Database Per Tenant Policy
- AD-055 Golden Standard Protection Policy
- AD-056 Company Boundary Policy
- AD-057 Reality Driven Standardization

---

# Security Checklist

| Item | Status |
|------|--------|
| Authentication | ✅ |
| Authorization | ✅ |
| Audit Log | ✅ |
| Company Boundary | ✅ |
| Tenant Isolation | ✅ |
| Soft Delete | ✅ |
| API Security | ✅ |
| AI Security | ✅ |

---

# Final Review

Master Data Department dinyatakan memenuhi standar keamanan apabila seluruh checklist telah berstatus APPROVED dan tidak ditemukan pelanggaran terhadap Security by Design Policy.

---

# Catatan

Security Review merupakan dokumen wajib sebelum implementasi Database, REST API, Flutter, AI, Dashboard, dan Business Module.

Standar keamanan akan dievaluasi kembali berdasarkan implementasi nyata sesuai AD-057 Reality Driven Standardization.