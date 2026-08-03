# USER SAMPLE DATA

Version : 1.0

Status : APPROVED

Master Data Code : MD-USER

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Database Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini menyediakan contoh data (Sample Data) untuk Master Data User.

Sample Data digunakan untuk:

- Seeder Database
- REST API Testing
- Flutter Development
- Authentication Testing
- Security Testing
- Dashboard Demo
- AI Testing
- User Acceptance Test (UAT)

Seluruh Sample Data bersifat fiktif dan tidak digunakan sebagai data produksi.

---

# Happy Path

## SD-USER-001

### CEO

| Field | Value |
|--------|-------|
| Username | ceo |
| Email | ceo@torotravel.id |
| Employee | Ahmad Fauzi |
| Role | CEO |
| Auth Provider | Local |
| Status | Active |

---

## SD-USER-002

### Finance

| Field | Value |
|--------|-------|
| Username | finance01 |
| Email | finance01@torotravel.id |
| Employee | Hendra Saputra |
| Role | Finance Manager |
| Auth Provider | Local |
| Status | Active |

---

## SD-USER-003

### Customer Service

| Field | Value |
|--------|-------|
| Username | cs01 |
| Email | cs01@torotravel.id |
| Employee | Siti Rahmawati |
| Role | Customer Service |
| Auth Provider | Local |
| Status | Active |

---

## SD-USER-004

### Tour Leader

| Field | Value |
|--------|-------|
| Username | tl.ahmad |
| Email | tl.ahmad@torotravel.id |
| Employee | Ahmad Fauzi |
| Role | Tour Leader |
| Auth Provider | Local |
| Status | Active |

---

## SD-USER-005

### Jamaah

| Field | Value |
|--------|-------|
| Username | jamaah001 |
| Email | jamaah001@email.com |
| Employee | - |
| Role | Jamaah |
| Auth Provider | Local |
| Status | Active |

---

# Edge Case

## SD-USER-006

User belum terhubung ke Employee.

Expected Result

Valid untuk Jamaah atau Customer Portal.

---

## SD-USER-007

Login menggunakan Google.

Expected Result

Berhasil apabila Provider diaktifkan.

---

## Negative Case

## SD-USER-008

Username duplikat.

Expected Result

Validation Error.

---

## SD-USER-009

Email duplikat.

Expected Result

Validation Error.

---

## SD-USER-010

Login dengan User berstatus Locked.

Expected Result

Login ditolak.

---

# Security Test

- OTP berhasil
- OTP kedaluwarsa (2 menit)
- Trusted Device aktif
- Session Timeout
- Force Logout
- Login dari Device baru
- Login dari Lokasi baru

---

# Performance Test

Benchmark:

- 5.000 User Internal
- 500.000 Jamaah
- 2.000 Login Bersamaan

---

# Seeder Purpose

Digunakan untuk:

- Initial Seeder
- Unit Test
- Integration Test
- Flutter UI Demo
- Security Test
- AI Simulation

---

# AI Usage

AI menggunakan Sample Data hanya untuk:

- Login Analytics
- Security Analytics
- Executive Briefing Simulation

AI tidak menganggap Sample Data sebagai data operasional.

---

# Related Documents

- business_rules.md
- validation_rules.md
- data_dictionary.md
- erd.md

---

# Catatan

Seluruh Sample Data mengikuti Sample ID Standard dan digunakan sebagai acuan resmi pengembangan, pengujian, demonstrasi, dan pelatihan sistem.