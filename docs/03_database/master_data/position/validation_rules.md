# POSITION VALIDATION RULES

Version : 1.0

Status : APPROVED

Master Data Code : MD-POSITION

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Business Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan seluruh Validation Rules untuk Master Data Position.

Validation Rules menjadi acuan resmi bagi Database, REST API, Flutter, AI, Dashboard, Import Data, serta Integrasi Eksternal.

Seluruh lapisan sistem wajib menggunakan aturan validasi yang sama (Single Validation Source).

---

# Validation Rules

## VR-001

Position Code wajib diisi.

Status

Required.

---

## VR-002

Position Code wajib unik dalam satu Department.

Position Code yang sama diperbolehkan pada Department yang berbeda.

---

## VR-003

Position Code bersifat Immutable.

Tidak dapat diubah setelah Position dibuat.

---

## VR-004

Position Name wajib diisi.

Minimal 3 karakter.

---

## VR-005

Department wajib dipilih.

Harus berasal dari Master Data Department.

---

## VR-006

Branch dan Company diperoleh melalui Department.

Tidak boleh diinput secara manual.

---

## VR-007

Position Status hanya boleh menggunakan:

- Draft
- Active
- Inactive
- Closed

---

## VR-008

Parent Position harus berada pada Department yang sama.

---

## VR-009

Position Level (Future) harus mengikuti Position Level Standard apabila fitur telah diaktifkan.

---

## VR-010

Position berstatus Closed tidak dapat menerima Employee baru.

---

## VR-011

Position tidak dapat dihapus apabila masih memiliki Employee aktif.

Gunakan Soft Delete.

---

## VR-012

Perubahan Status wajib tercatat pada Audit Log.

---

## VR-013

Seluruh validasi wajib diterapkan secara konsisten pada:

- Flutter
- REST API
- Business Layer
- Database

---

# Error Message Standard

| Code | Message |
|------|---------|
| POS-001 | Position Code is required. |
| POS-002 | Position Code already exists. |
| POS-003 | Invalid Position Status. |
| POS-004 | Invalid Department. |
| POS-005 | Invalid Parent Position. |
| POS-006 | Position cannot be deleted because it is still in use. |

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

- Mengubah Position
- Menghapus Position
- Mengubah Position Status

Kecuali melalui workflow resmi yang telah disetujui.

---

# Related Architecture Decisions

- AD-033 Hierarchical Foreign Key Policy
- AD-038 Security by Design Policy
- AD-044 One Database Per Tenant Policy
- AD-055 Golden Standard Protection Policy
- AD-056 Company Boundary Policy
- AD-057 Reality Driven Standardization

---

# Golden Rule

Tidak boleh terdapat perbedaan aturan validasi antara Database, REST API, Flutter, AI, maupun proses Import Data.

Validation Rules merupakan Single Source of Truth untuk seluruh proses validasi Position.

---

# Catatan

Seluruh perubahan terhadap Validation Rules wajib melalui Architecture Review sebelum diterapkan pada implementasi teknis.