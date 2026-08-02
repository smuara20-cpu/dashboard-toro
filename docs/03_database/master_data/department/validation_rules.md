# DEPARTMENT VALIDATION RULES

Version : 1.0

Status : APPROVED

Master Data Code : MD-DEPARTMENT

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Business Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan seluruh Validation Rules untuk Master Data Department.

Validation Rules menjadi acuan resmi bagi Database, REST API, Flutter, AI, Dashboard, Import Data, serta Integrasi Eksternal.

Seluruh lapisan sistem wajib menggunakan aturan validasi yang sama (Single Validation Source).

---

# Validation Rules

## VR-001

Department Code wajib diisi.

Status

Required.

---

## VR-002

Department Code wajib unik dalam satu Branch.

Department Code yang sama diperbolehkan pada Branch yang berbeda.

---

## VR-003

Department Code bersifat Immutable.

Tidak dapat diubah setelah Department dibuat.

---

## VR-004

Department Name wajib diisi.

Minimal 3 karakter.

---

## VR-005

Branch wajib dipilih.

Harus berasal dari Master Data Branch.

---

## VR-006

Company diperoleh melalui Branch.

Tidak boleh diinput secara manual.

---

## VR-007

Department Status hanya boleh menggunakan:

- Draft
- Active
- Inactive
- Closed

---

## VR-008

Department Category harus sesuai dengan daftar kategori yang tersedia.

---

## VR-009

Department Head harus merupakan Employee aktif.

---

## VR-010

Department Head harus berada pada Branch yang sama.

---

## VR-011

Department Head harus berada pada Department yang sama.

---

## VR-012

Department berstatus Closed tidak dapat menerima:

- Position baru
- Employee baru

---

## VR-013

Department tidak dapat dihapus apabila masih memiliki:

- Position
- Employee

Gunakan Soft Delete.

---

## VR-014

Perubahan Status wajib tercatat pada Audit Log.

---

## VR-015

Seluruh validasi wajib diterapkan secara konsisten pada:

- Flutter
- REST API
- Business Layer
- Database

---

# Error Message Standard

| Code | Message |
|------|---------|
| DEPT-001 | Department Code is required. |
| DEPT-002 | Department Code already exists. |
| DEPT-003 | Invalid Department Status. |
| DEPT-004 | Invalid Branch. |
| DEPT-005 | Invalid Department Category. |
| DEPT-006 | Invalid Department Head. |
| DEPT-007 | Department cannot be deleted because it is still in use. |

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

- Mengubah Department
- Menghapus Department
- Mengubah Department Status

Kecuali melalui workflow resmi yang telah disetujui.

---

# Related Architecture Decisions

- AD-038 Security by Design Policy
- AD-044 One Database Per Tenant Policy
- AD-055 Golden Standard Protection Policy
- AD-056 Company Boundary Policy

---

# Golden Rule

Tidak boleh terdapat perbedaan aturan validasi antara Database, REST API, Flutter, AI, maupun proses Import Data.

Validation Rules merupakan Single Source of Truth untuk seluruh proses validasi Department.

---

# Catatan

Seluruh perubahan terhadap Validation Rules wajib melalui Architecture Review sebelum diterapkan pada implementasi teknis.