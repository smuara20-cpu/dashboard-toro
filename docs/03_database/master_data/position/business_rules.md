# POSITION BUSINESS RULES

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

Dokumen ini mendefinisikan seluruh Business Rules untuk Master Data Position.

Position merupakan jabatan resmi pada struktur organisasi dan menjadi dasar penempatan Employee, pemberian Role, serta pengelolaan hak akses.

---

# Business Rules

## BR-001

Setiap Position wajib memiliki Position ID yang unik dan permanen.

---

## BR-002

Setiap Position wajib berada di bawah satu Department.

Menggunakan:

department_id

---

## BR-003

Position secara tidak langsung berada di bawah:

- Company
- Branch
- Department

Company menjadi Data Owner utama.

---

## BR-004

Position Code wajib unik dalam satu Department.

Position Code yang sama diperbolehkan pada Department yang berbeda.

---

## BR-005

Position Name wajib diisi.

---

## BR-006

Position wajib memiliki Status.

Status yang diperbolehkan:

- Draft
- Active
- Inactive
- Closed

---

## BR-007

Satu Position dapat ditempati oleh satu atau lebih Employee sesuai kebijakan Company.

---

## BR-008

Seorang Employee hanya dapat memiliki satu Position utama (Primary Position).

Posisi tambahan (Secondary Position) dapat didukung pada versi mendatang.

---

## BR-009

Position dapat memiliki atasan langsung (Parent Position).

Digunakan untuk membentuk struktur pelaporan organisasi.

---

## BR-010

Perubahan Status Position wajib tercatat pada Audit Log.

---

## BR-011

Position berstatus Closed tidak dapat menerima Employee baru.

---

## BR-012

Position tidak menyimpan hak akses secara langsung.

Hak akses diberikan melalui Role dan Permission.

---

## BR-013

Seluruh transaksi tetap dimiliki oleh Company sebagai Data Owner utama.

---

## BR-014

AI hanya dapat membaca data Position sesuai Company Boundary.

---

## BR-015

Executive Briefing dapat menampilkan KPI berdasarkan Position sesuai hak akses.

---

# Business Ownership

Business Owner:

- Company
- Branch
- Department
- HR Manager
- Company Administrator

---

# Related Master Data

- Company
- Branch
- Department
- Employee
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

Position adalah jabatan dalam organisasi.

Position bukan identitas seseorang.

Employee dapat berubah, tetapi Position tetap menjadi bagian dari struktur organisasi.

---

# Catatan

Master Data Position menjadi fondasi bagi Employee Management, Role Management, Permission Management, Workflow Approval, KPI, Dashboard, dan AI Organization Intelligence.