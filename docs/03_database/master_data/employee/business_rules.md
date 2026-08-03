# EMPLOYEE BUSINESS RULES

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

Dokumen ini mendefinisikan seluruh Business Rules untuk Master Data Employee.

Employee merupakan individu yang bekerja pada Company dan menjadi bagian dari struktur organisasi.

Employee menjadi dasar bagi User, HR Management, Payroll, Attendance, Leave, KPI, Dashboard, AI, dan seluruh aktivitas operasional.

---

# Business Rules

## BR-001

Setiap Employee wajib memiliki Employee ID yang unik dan permanen.

---

## BR-002

Setiap Employee wajib berada di bawah:

- Company
- Branch
- Department
- Position

---

## BR-003

Employee merupakan identitas individu.

Perubahan Branch, Department, maupun Position tidak mengubah Employee ID.

---

## BR-004

Employee wajib memiliki Full Name.

---

## BR-005

Employee wajib memiliki Employment Status.

Status awal yang didukung:

- Permanent
- Contract
- Probation
- Internship
- Freelance
- Outsourcing
- Consultant

---

## BR-006

Employee wajib memiliki Employment Status aktif sebelum dapat ditugaskan pada proses bisnis.

---

## BR-007

Satu Employee hanya memiliki satu Primary Position.

Secondary Position akan dipertimbangkan pada versi mendatang.

---

## BR-008

Employee dapat memiliki User Account atau tidak.

Employee dan User merupakan entitas yang berbeda.

---

## BR-009

Employee dapat dinonaktifkan tanpa menghapus histori aktivitas.

Menggunakan Soft Delete dan Status Management.

---

## BR-010

Seluruh perubahan organisasi (Branch, Department, Position) wajib tercatat pada Audit Log.

---

## BR-011

Employee tidak dapat dihapus secara fisik apabila telah memiliki histori transaksi.

---

## BR-012

AI hanya dapat membaca data Employee sesuai Company Boundary dan Permission.

---

## BR-013

Executive Briefing dapat menggunakan data Employee untuk analisis organisasi, produktivitas, dan KPI sesuai hak akses.

---

## BR-014

Employee wajib mengikuti Employee Identity Standard (EIS-001).

Employee ID bersifat permanen sepanjang siklus kerja.

---

## BR-015

Seluruh transaksi yang melibatkan Employee tetap dimiliki oleh Company sebagai Data Owner utama.

---

# Business Ownership

Business Owner:

- Company
- HR Manager
- Company Administrator

---

# Related Master Data

- Company
- Branch
- Department
- Position
- User
- Role

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

Employee adalah identitas individu.

User adalah akun login.

Keduanya merupakan entitas yang berbeda dan tidak boleh disatukan.

---

# Catatan

Master Data Employee menjadi fondasi utama bagi seluruh modul Human Resource, Authentication, Authorization, Workflow, Dashboard, dan AI pada TIOS.