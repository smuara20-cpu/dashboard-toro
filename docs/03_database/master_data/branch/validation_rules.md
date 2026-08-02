# BRANCH VALIDATION RULES

Version : 1.0

Status : APPROVED

Master Data Code : MD-BRANCH

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Business Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan seluruh Validation Rules untuk Master Data Branch.

Validation Rules menjadi acuan resmi bagi Database, REST API, Flutter, AI, Dashboard, Import Data, serta Integrasi Eksternal.

Seluruh lapisan sistem wajib menggunakan aturan validasi yang sama (Single Validation Source).

---

# Validation Rules

## VR-001

Branch Code wajib diisi.

Status

Required

---

## VR-002

Branch Code wajib unik dalam satu Company.

Branch Code yang sama diperbolehkan digunakan oleh Company yang berbeda.

---

## VR-003

Branch Code tidak boleh diubah setelah Branch dibuat.

Status

Immutable

---

## VR-004

Branch Name wajib diisi.

Minimal 3 karakter.

---

## VR-005

Company wajib dipilih.

Harus berasal dari Master Data Company.

---

## VR-006

Branch Status hanya boleh menggunakan:

- Draft
- Active
- Inactive
- Closed

---

## VR-007

Country wajib berasal dari Master Data Country.

---

## VR-008

Province harus sesuai dengan Country.

---

## VR-009

City harus sesuai dengan Province.

---

## VR-010

District harus sesuai dengan City.

---

## VR-011

Village harus sesuai dengan District.

---

## VR-012

Alamat wajib menggunakan Canonical Address.

Mengacu pada AD-040 Canonical Address Policy.

---

## VR-013

Postal Code mengikuti standar negara masing-masing.

---

## VR-014

Primary Email harus menggunakan format email yang valid.

---

## VR-015

Primary Phone harus menggunakan format internasional (E.164).

---

## VR-016

Website harus menggunakan format URL yang valid.

---

## VR-017

Branch Manager harus merupakan Employee aktif pada Company yang sama.

---

## VR-018

Branch yang berstatus Closed tidak dapat menerima transaksi baru.

---

## VR-019

Perubahan Status Branch wajib tercatat pada Audit Log.

---

## VR-020

Branch tidak dapat dihapus apabila masih memiliki:

- Department
- Employee
- Booking
- Customer
- Inventory (Future)

Gunakan Soft Delete.

---

## VR-021

Seluruh validasi wajib diterapkan secara konsisten pada:

- Flutter
- REST API
- Business Layer
- Database

---

# Error Message Standard

| Code | Message |
|------|---------|
| BRANCH-001 | Branch Code is required. |
| BRANCH-002 | Branch Code already exists. |
| BRANCH-003 | Invalid Branch Status. |
| BRANCH-004 | Invalid Company. |
| BRANCH-005 | Invalid Email Format. |
| BRANCH-006 | Invalid Phone Number. |
| BRANCH-007 | Invalid Country. |
| BRANCH-008 | Invalid Province. |
| BRANCH-009 | Invalid City. |
| BRANCH-010 | Branch cannot be deleted because it is still in use. |

---

# Validation Layer

Validation dilakukan secara berlapis:

1. Flutter Validation
2. REST API Validation
3. Business Validation
4. Database Constraint

---

# AI Validation

AI hanya dapat:

- Read
- Analytics
- Recommendation

AI tidak diperbolehkan:

- Mengubah Branch
- Menghapus Branch
- Mengubah Status Branch

Kecuali melalui workflow resmi yang telah disetujui.

---

# Related Architecture Decisions

- AD-038 Security by Design Policy
- AD-040 Canonical Address Policy
- AD-044 One Database Per Tenant Policy
- AD-055 Golden Standard Protection Policy
- AD-056 Company Boundary Policy

---

# Golden Rule

Tidak boleh terdapat perbedaan aturan validasi antara Database, REST API, Flutter, AI, maupun proses Import Data.

Validation Rules merupakan Single Source of Truth untuk seluruh proses validasi Branch.

---

# Catatan

Seluruh perubahan terhadap Validation Rules wajib melalui Architecture Review sebelum diterapkan pada implementasi teknis.