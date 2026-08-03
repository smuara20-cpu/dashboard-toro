# USER NOTES

Version : 1.0

Status : APPROVED

Master Data Code : MD-USER

---

# Tujuan

Dokumen ini berisi catatan implementasi, keputusan arsitektur, batasan sistem, dan rencana pengembangan Master Data User.

---

# Design Philosophy

Master Data User merupakan pusat Identity & Access Management (IAM) pada TIOS.

Seluruh proses Authentication, Authorization, Session Management, Security, Audit, dan AI Security mengacu pada modul ini.

---

# Implementation Notes

## UUID

Seluruh User menggunakan UUID.

Username maupun Email dapat berubah.

User ID tidak pernah berubah.

---

## Authentication

Authentication dipisahkan dari Employee.

Seorang Employee dapat memiliki lebih dari satu User apabila Enterprise Mode diaktifkan sesuai AMS-001.

Default:

1 Employee = 1 User.

---

## Session

Idle Session:

- Team Kantor : 2 Jam
- Jamaah : 3 Jam

Warning:

1 menit sebelum Auto Logout.

---

## OTP

OTP berlaku:

2 menit.

Channel:

- WhatsApp
- Email

---

## Trusted Device

Maksimum:

30 hari.

---

## Security Dashboard

Desktop Only.

Role:

- Owner
- CEO
- Super Administrator
- IT Security Administrator

---

## AI

AI hanya memiliki hak:

- Read
- Analyze
- Recommend

AI tidak dapat mengubah data tanpa workflow resmi.

---

## Business Reminder

Reminder dijalankan oleh AI Communication Engine.

Semua template dapat diubah oleh:

- CEO
- Owner
- Administrator yang memiliki hak akses

---

## Muslim Friendly

Terintegrasi dengan:

- Prayer Schedule Engine
- Mosque Recommendation
- Halal Food Recommendation
- Historical Intelligence
- Daily Companion

---

## Future Development

- Biometric Login
- Passkey
- Face ID
- Fingerprint
- Enterprise SSO
- Offline Authentication
- AI Fraud Detection

---

# Catatan

Perubahan terhadap Master Data User wajib melalui Architecture Review Board.