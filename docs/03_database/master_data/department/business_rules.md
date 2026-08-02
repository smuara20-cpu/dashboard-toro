# DEPARTMENT BUSINESS RULES

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

Dokumen ini mendefinisikan seluruh Business Rules untuk Master Data Department.

Department merupakan unit fungsi bisnis (Business Function) di bawah Branch dan menjadi dasar pengelompokan Position serta Employee.

---

# Business Rules

## BR-001

Setiap Department wajib memiliki Department ID yang unik dan permanen.

---

## BR-002

Setiap Department wajib berada di bawah satu Branch.

Menggunakan:

branch_id

---

## BR-003

Department secara tidak langsung berada di bawah Company melalui Branch.

Company menjadi Data Owner utama.

---

## BR-004

Department Code wajib unik dalam satu Branch.

Department dengan kode yang sama diperbolehkan pada Branch yang berbeda.

---

## BR-005

Department Name wajib diisi.

---

## BR-006

Department wajib memiliki Status.

Status yang diperbolehkan:

- Draft
- Active
- Inactive
- Closed

---

## BR-007

Department dapat memiliki lebih dari satu Position.

---

## BR-008

Department dapat memiliki lebih dari satu Employee.

---

## BR-009

Department dapat memiliki Department Head.

Department Head harus merupakan Employee aktif pada Department tersebut.

---

## BR-010

Perubahan Status Department wajib tercatat pada Audit Log.

---

## BR-011

Department berstatus Closed tidak dapat menerima Position atau Employee baru.

---

## BR-012

Seluruh transaksi yang berkaitan dengan Department tetap dimiliki oleh Company.

Department merupakan Business Function, bukan Data Owner.

---

## BR-013

AI hanya dapat membaca data Department sesuai Company Boundary.

---

## BR-014

Executive Briefing dapat menampilkan performa setiap Department sesuai hak akses.

---

## BR-015

Department dapat diklasifikasikan berdasarkan Business Function.

Contoh:

- Sales
- Marketing
- Finance
- HR
- IT
- Operation
- Visa
- Ticketing
- Hotel
- Tour Operation

---

# Business Ownership

Business Owner:

- Company
- Branch
- Department Head
- Company Administrator

---

# Related Master Data

- Company
- Branch
- Position
- Employee

---

# Related Architecture Decisions

- AD-038 Security by Design Policy
- AD-044 One Database Per Tenant Policy
- AD-055 Golden Standard Protection Policy
- AD-056 Company Boundary Policy

---

# Golden Rule

Department merupakan Business Function resmi di bawah Branch.

Tidak diperbolehkan terdapat Department tanpa Branch sebagai induk organisasi.

---

# Catatan

Master Data Department menjadi dasar struktur organisasi operasional dan pengelompokan Position serta Employee pada TIOS.