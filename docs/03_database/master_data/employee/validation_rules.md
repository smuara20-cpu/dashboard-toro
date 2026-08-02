# EMPLOYEE VALIDATION RULES

Version : 1.0

Status : APPROVED

Master Data Code : MD-EMPLOYEE

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Business Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan seluruh Validation Rules untuk Master Data Employee.

Validation Rules menjadi acuan resmi bagi Database, REST API, Flutter, AI, Dashboard, Import Data, serta Integrasi Eksternal.

Seluruh lapisan sistem wajib menggunakan aturan validasi yang sama (Single Validation Source).

---

# Validation Rules

## VR-001

Employee ID dibuat otomatis oleh sistem.

Bersifat unik dan permanen sesuai EIS-001 Employee Identity Standard.

---

## VR-002

Full Name wajib diisi.

Minimal 3 karakter.

---

## VR-003

Company, Branch, Department, dan Position wajib dipilih.

Hierarchy harus valid.

---

## VR-004

Branch harus berada di bawah Company yang sama.

---

## VR-005

Department harus berada di bawah Branch yang dipilih.

---

## VR-006

Position harus berada di Department yang dipilih.

---

## VR-007

Employment Status hanya boleh menggunakan:

- Permanent
- Contract
- Probation
- Internship
- Freelance
- Outsourcing
- Consultant

---

## VR-008

Primary Position wajib aktif.

Employee tidak dapat ditempatkan pada Position berstatus Closed.

---

## VR-009

Tanggal bergabung (Join Date) wajib diisi.

Tidak boleh melebihi tanggal saat ini.

---

## VR-010

Tanggal keluar (Resign Date) hanya boleh diisi apabila Employment Status berakhir.

---

## VR-011

Nomor telepon (jika diisi) harus menggunakan format yang valid.

---

## VR-012

Email (jika diisi) harus menggunakan format email yang valid.

---

## VR-013

Employee tidak dapat dihapus apabila masih memiliki:

- User Account
- Approval History
- Booking Assignment
- Audit Log

Gunakan Soft Delete.

---

## VR-014

Seluruh perubahan organisasi wajib dicatat pada Audit Log.

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
| EMP-001 | Full Name is required. |
| EMP-002 | Invalid Company. |
| EMP-003 | Invalid Branch. |
| EMP-004 | Invalid Department. |
| EMP-005 | Invalid Position. |
| EMP-006 | Invalid Employment Status. |
| EMP-007 | Employee cannot be deleted because it is still in use. |
| EMP-008 | Invalid Join Date. |
| EMP-009 | Invalid Email Format. |
| EMP-010 | Invalid Phone Number. |

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

- Mengubah Employee
- Menghapus Employee
- Mengubah Employment Status

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

Validation Rules merupakan Single Source of Truth untuk seluruh proses validasi Employee.

---

# Catatan

Seluruh perubahan terhadap Validation Rules wajib melalui Architecture Review sebelum diterapkan pada implementasi teknis.