# USER BUSINESS RULES

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

Dokumen ini mendefinisikan seluruh Business Rules untuk Master Data User.

User merupakan identitas digital yang digunakan untuk mengakses TIOS melalui Web, Mobile, REST API, maupun layanan AI.

---

# Business Rules

## BR-001

Setiap User wajib memiliki User ID yang unik dan permanen.

---

## BR-002

User dapat terhubung dengan satu Employee.

Hubungan bersifat:

Employee (1) → User (0..1)

---

## BR-003

Employee dapat bekerja tanpa memiliki User Account.

---

## BR-004

Username wajib unik dalam satu Company.

---

## BR-005

Email Login (jika digunakan) wajib unik.

---

## BR-006

User wajib memiliki Status.

Status yang didukung:

- Pending
- Active
- Suspended
- Locked
- Disabled

---

## BR-007

User wajib memiliki minimal satu Role.

---

## BR-008

Permission diberikan melalui Role.

User tidak diberikan Permission secara langsung, kecuali terdapat mekanisme pengecualian yang telah disetujui dalam kebijakan keamanan.

---

## BR-009

Perubahan Password tidak mengubah User ID.

---

## BR-010

Perubahan Role wajib tercatat pada Audit Log.

---

## BR-011

User yang dinonaktifkan tidak dapat melakukan Login.

Histori aktivitas tetap dipertahankan.

---

## BR-012

User wajib mengikuti Company Boundary.

Tidak boleh mengakses data Company lain.

---

## BR-013

Seluruh aktivitas User wajib dicatat pada Audit Log.

---

## BR-014

Autentikasi mendukung pengembangan bertahap:

- Email + Password
- OAuth (Future)
- SSO (Future)
- MFA (Future)

---

## BR-015

User merupakan identitas digital.

Employee merupakan identitas manusia.

Keduanya tidak boleh disatukan.

---

# Business Ownership

Business Owner:

- Company Administrator
- IT Administrator
- Security Administrator

---

# Related Master Data

- Employee
- Role
- Permission
- Company

---

# Related Architecture Decisions

- AD-038 Security by Design Policy
- AD-044 One Database Per Tenant Policy
- AD-055 Golden Standard Protection Policy
- AD-056 Company Boundary Policy
- UAS-001 User Account Separation Standard

---

# Golden Rule

User digunakan untuk autentikasi dan otorisasi.

User bukan identitas karyawan.

---

# Catatan

Master Data User menjadi fondasi Authentication, Authorization, Audit Log, API Security, AI Access Control, dan seluruh mekanisme keamanan TIOS.