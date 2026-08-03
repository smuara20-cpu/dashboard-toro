# USER SECURITY REVIEW

Version : 1.0

Status : APPROVED

Master Data Code : MD-USER

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Security Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan standar keamanan Master Data User sebagai fondasi Identity & Access Management (IAM) pada TIOS.

---

# Security Objectives

Master Data User harus menjamin:

- Authentication
- Authorization
- Confidentiality
- Integrity
- Availability
- Traceability
- Company Boundary
- Multi-Tenant Isolation

---

# Authentication

Metode yang didukung:

- Local Account
- Email + Password
- Google
- Microsoft
- Apple
- LDAP
- Single Sign-On (SSO)

Seluruh metode mengikuti APS-001 Authentication Provider Standard.

---

# Multi Factor Authentication

Didukung melalui:

- OTP WhatsApp
- OTP Email

Ketentuan:

- OTP berlaku **2 menit**
- OTP hanya dapat digunakan satu kali
- OTP otomatis kedaluwarsa setelah digunakan atau melewati batas waktu

---

# Trusted Device

Mengikuti TDS-001.

- Maksimum masa berlaku 30 hari
- Setelah berakhir, OTP wajib dilakukan kembali
- CEO / Super Administrator dapat menghapus Trusted Device kapan saja

---

# Session Security

Mengikuti STS-001.

- Team Kantor : Idle Timeout 2 jam
- User / Jamaah : Idle Timeout 3 jam
- Peringatan 1 menit sebelum Auto Logout
- Auto Logout jika tidak ada aktivitas

---

# Concurrent Session

Mengikuti CAS-001.

Jumlah sesi aktif ditentukan oleh Company dan hanya dapat diubah oleh:

- CEO
- Owner
- Super Administrator

---

# Login Activity

Mengikuti LAS-001 dan LDS-001.

Setiap login mencatat:

- Waktu Login
- Waktu Logout
- Durasi
- Device
- Browser
- Operating System
- IP Address
- Lokasi Login
- Authentication Provider
- Trusted Device Status

---

# Security Notification

Mengikuti SNS-001.

Notifikasi dikirim melalui:

- WhatsApp
- Email
- Notification Center

Untuk aktivitas:

- Login Baru
- Login Berisiko
- Password Diubah
- Force Logout
- Device Baru
- Perubahan Email
- Perubahan Nomor WhatsApp

---

# Dashboard Security

Desktop Only.

Role:

- Owner
- CEO
- Super Administrator
- IT Security Administrator

Dashboard menampilkan:

- Login Team
- Login Jamaah
- Login Gagal
- OTP Gagal
- User Online
- Lokasi Login
- Device Login
- Force Logout
- Security Analytics

---

# Authorization

Hak akses menggunakan:

- User
- Role
- Permission

Permission diberikan melalui Role sesuai UAS-001.

---

# Audit Log

Seluruh aktivitas berikut wajib dicatat:

- Login
- Logout
- OTP
- Password Change
- Device Registration
- Trusted Device Removal
- Delegation
- Force Logout
- Status Change
- Role Change

---

# AI Security

AI hanya memiliki hak:

- Read
- Analytics
- Recommendation

AI tidak dapat:

- Login
- Mengubah Password
- Mengubah Permission
- Mengubah Role
- Mengubah Status User

Kecuali melalui workflow resmi yang telah disetujui.

---

# Compliance

Master Data User harus memenuhi:

- Security by Design
- Company Boundary
- One Database Per Tenant
- Audit Trail
- Personal Data Protection
- Zero Trust Principle

---

# Related Standards

- UAS-001
- APS-001
- LAS-001
- CAS-001
- STS-001
- TDS-001
- LDS-001
- SNS-001
- ADS-001
- ALS-002

---

# Final Review

Master Data User dinyatakan memenuhi standar keamanan apabila seluruh checklist berstatus APPROVED dan tidak ditemukan pelanggaran terhadap Security by Design Policy.

---

# Catatan

Seluruh implementasi Authentication, Authorization, Session Management, AI Security, dan Security Dashboard wajib mengacu pada dokumen ini.