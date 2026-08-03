# USER VALIDATION RULES

Version : 1.0

Status : APPROVED

Master Data Code : MD-USER

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Business Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan seluruh Validation Rules untuk Master Data User.

Validation Rules menjadi acuan resmi bagi Database, REST API, Flutter, AI, Dashboard, Authentication Service, serta Integrasi Eksternal.

Seluruh lapisan sistem wajib menggunakan aturan validasi yang sama (Single Validation Source).

---

# Validation Rules

## VR-001

User ID dibuat otomatis oleh sistem.

Bersifat unik dan permanen.

---

## VR-002

Employee harus valid.

Apabila User dihubungkan dengan Employee, maka Employee harus:

- Active
- Tidak dihapus
- Berasal dari Company yang sama

---

## VR-003

Username wajib diisi.

Minimal 4 karakter.

---

## VR-004

Username harus unik dalam satu Company.

---

## VR-005

Email Login (jika digunakan) harus menggunakan format email yang valid.

---

## VR-006

Email Login harus unik.

---

## VR-007

Password wajib memenuhi Password Policy.

Minimal:

- 8 karakter
- Huruf besar
- Huruf kecil
- Angka

Password Policy dapat dikonfigurasi oleh Company.

---

## VR-008

Status User hanya boleh:

- Pending
- Active
- Suspended
- Locked
- Disabled

---

## VR-009

User wajib memiliki minimal satu Role.

---

## VR-010

Role harus berasal dari Company yang sama.

---

## VR-011

Permission diperoleh melalui Role.

Tidak boleh diberikan langsung kepada User tanpa mekanisme pengecualian resmi.

---

## VR-012

User berstatus Disabled atau Locked tidak dapat Login.

---

## VR-013

Perubahan Password wajib tercatat pada Audit Log.

---

## VR-014

Seluruh validasi wajib diterapkan secara konsisten pada:

- Flutter
- REST API
- Business Layer
- Database

---

# Error Message Standard

| Code | Message |
|------|---------|
| USER-001 | Username is required. |
| USER-002 | Username already exists. |
| USER-003 | Invalid email format. |
| USER-004 | Email already exists. |
| USER-005 | Invalid User Status. |
| USER-006 | Employee not found. |
| USER-007 | Password does not meet security policy. |
| USER-008 | User account is locked. |

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
- Security Analytics
- Recommendation

AI tidak diperbolehkan:

- Login
- Mengubah Password
- Mengaktifkan User
- Mengubah Status User

Kecuali melalui workflow resmi yang telah disetujui.

---

# Related Architecture Decisions

- AD-038 Security by Design Policy
- AD-044 One Database Per Tenant Policy
- AD-055 Golden Standard Protection Policy
- AD-056 Company Boundary Policy
- UAS-001 User Account Separation Standard
- LAS-001 Login Activity Standard

---

# Golden Rule

Validation Rules merupakan Single Source of Truth.

Tidak boleh terdapat perbedaan validasi antara Flutter, REST API, Business Layer, Database, maupun Authentication Service.

---

# Catatan

Seluruh perubahan terhadap Validation Rules wajib melalui Architecture Review sebelum diterapkan pada implementasi teknis.