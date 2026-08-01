# COMPANY VALIDATION RULES

Version : 1.0

Status : APPROVED

Master Data Code : MD-COMPANY

Domain Code : DOM-002

Last Updated : 2026-08-02

Owner : Business Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan seluruh aturan validasi (Validation Rules) untuk Master Data Company.

Validation diterapkan pada:

- Database
- REST API
- Flutter
- AI
- Import Data
- Integrasi Eksternal

Seluruh lapisan sistem wajib menggunakan aturan validasi yang sama (Single Validation Source).

---

# Validation Rules

## VR-001

Company Code wajib diisi.

Status

Required

---

## VR-002

Company Code harus unik.

Duplicate tidak diperbolehkan.

---

## VR-003

Company Code tidak boleh berubah setelah Company dibuat.

Status

Immutable

---

## VR-004

Legal Company Name wajib diisi.

---

## VR-005

Legal Company Name minimal 3 karakter.

---

## VR-006

Display Name wajib diisi.

---

## VR-007

Country wajib dipilih.

Harus berasal dari Master Data Country.

---

## VR-008

Province/State wajib sesuai dengan Country.

---

## VR-009

City wajib sesuai dengan Province/State.

---

## VR-010

District wajib sesuai dengan City.

---

## VR-011

Village wajib sesuai dengan District.

---

## VR-012

Alamat wajib menggunakan Canonical Address.

Mengacu pada:

AD-040 Canonical Address Policy.

---

## VR-013

Postal Code harus sesuai dengan Country.

Format mengikuti standar masing-masing negara.

---

## VR-014

Default Language wajib berasal dari Master Data Language.

---

## VR-015

Default Currency wajib berasal dari Master Data Currency.

---

## VR-016

Default Time Zone wajib berasal dari Master Data Time Zone.

---

## VR-017

Company Status hanya boleh menggunakan:

- Registered
- Verified
- Active
- Suspended
- Archived

---

## VR-018

Verification Status hanya boleh berubah melalui proses verifikasi resmi.

---

## VR-019

Tax Identification Number bersifat opsional.

Namun apabila diisi, format harus mengikuti aturan negara masing-masing.

---

## VR-020

Business Registration Number bersifat opsional.

Apabila diisi harus unik dalam satu Tenant.

---

## VR-021

Primary Email wajib menggunakan format email yang valid.

---

## VR-022

Primary Phone wajib menggunakan format internasional (E.164).

Contoh:

+6281234567890

---

## VR-023

Website harus menggunakan format URL yang valid.

---

## VR-024

Logo hanya boleh menggunakan format:

- PNG
- JPG
- SVG

---

## VR-025

Ukuran logo maksimal mengikuti konfigurasi Storage Policy.

---

## VR-026

Favicon bersifat opsional.

---

## VR-027

Company tidak boleh dihapus apabila masih memiliki:

- Branch
- Employee
- User
- Booking
- Customer
- Finance

Gunakan Soft Delete sesuai kebijakan sistem.

---

## VR-028

Perubahan Company Status wajib tercatat pada Audit Log.

---

## VR-029

Perubahan Legal Name wajib tercatat pada Audit Log.

---

## VR-030

Seluruh validasi harus diterapkan secara konsisten pada:

- REST API
- Flutter
- Import Data
- AI Service

---

# Error Message Standard

| Code | Message |
|------|---------|
| COMPANY-001 | Company Code is required. |
| COMPANY-002 | Company Code already exists. |
| COMPANY-003 | Invalid Company Status. |
| COMPANY-004 | Invalid Email Format. |
| COMPANY-005 | Invalid Phone Number. |
| COMPANY-006 | Invalid Country. |
| COMPANY-007 | Invalid Province/State. |
| COMPANY-008 | Invalid City. |
| COMPANY-009 | Invalid District. |
| COMPANY-010 | Invalid Village. |
| COMPANY-011 | Invalid Postal Code. |
| COMPANY-012 | Company cannot be deleted because it is still in use. |

---

# Validation Layer

Validation dilakukan secara berlapis:

1. Flutter Validation
2. REST API Validation
3. Business Validation
4. Database Constraint

Seluruh hasil validasi harus konsisten.

---

# AI Validation

AI tidak diperbolehkan:

- Mengubah Company Code.
- Mengubah Company Owner.
- Mengubah Company Status.

AI hanya dapat memberikan rekomendasi sesuai Permission.

---

# Related Architecture Decisions

- AD-038 Security by Design Policy
- AD-040 Canonical Address Policy
- AD-044 One Database Per Tenant Policy
- AD-051 Multi-Language User Experience Policy
- AD-053 Internationalization First Policy
- AD-054 Configuration Over Customization Policy
- AD-056 Company Boundary Policy

---

# Golden Rule

Tidak boleh terdapat perbedaan aturan validasi antara Database, REST API, Flutter, AI, maupun proses Import Data.

Validation Rules merupakan Single Source of Truth untuk seluruh proses validasi Company.

---

# Catatan

Perubahan terhadap Validation Rules wajib melalui Architecture Review dan Architecture Decision apabila memengaruhi proses bisnis.