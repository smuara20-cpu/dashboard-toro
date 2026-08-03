# BRANCH BUSINESS RULES

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

Dokumen ini mendefinisikan seluruh Business Rules untuk Master Data Branch.

Master Data Branch merupakan representasi kantor operasional perusahaan dan menjadi unit organisasi utama di bawah Company.

---

# Business Rules

## BR-001

Setiap Branch wajib memiliki Branch ID yang unik dan permanen.

---

## BR-002

Setiap Branch wajib berada di bawah satu Company.

Menggunakan:

company_id

---

## BR-003

Branch Code wajib unik dalam satu Company.

Company yang berbeda diperbolehkan menggunakan Branch Code yang sama.

---

## BR-004

Branch Name wajib diisi.

---

## BR-005

Branch dapat memiliki:

- Department
- Employee
- Office
- Customer
- Booking

---

## BR-006

Branch wajib memiliki Status.

Status yang diperbolehkan:

- Draft
- Active
- Inactive
- Closed

---

## BR-007

Branch yang berstatus Closed tidak dapat menerima transaksi baru.

---

## BR-008

Perubahan Status Branch wajib tercatat pada Audit Log.

---

## BR-009

Branch wajib memiliki alamat operasional.

Alamat menggunakan Global Location.

---

## BR-010

Branch dapat memiliki:

- Email
- Telepon
- Website

---

## BR-011

Branch dapat memiliki Branch Manager.

Branch Manager harus merupakan Employee aktif.

---

## BR-012

Satu Employee hanya memiliki satu Branch utama.

Penugasan lintas Branch akan diatur pada modul Assignment (Future).

---

## BR-013

Seluruh transaksi Branch wajib memiliki Company Owner.

---

## BR-014

AI hanya dapat membaca data Branch sesuai Company Boundary.

---

## BR-015

Executive Briefing dapat menampilkan performa setiap Branch sesuai hak akses.

---

# Business Ownership

Business Owner:

- Company
- Branch Manager
- Company Administrator

---

# Related Master Data

- Company
- Department
- Employee
- Office
- Working Calendar

---

# Related Architecture Decisions

- AD-038 Security by Design Policy
- AD-044 One Database Per Tenant Policy
- AD-055 Golden Standard Protection Policy
- AD-056 Company Boundary Policy

---

# Golden Rule

Branch merupakan unit operasional resmi milik Company.

Tidak diperbolehkan terdapat Branch tanpa Company sebagai Owner.

---

# Catatan

Master Data Branch merupakan implementasi pertama dari struktur organisasi di bawah Company dan menjadi dasar seluruh aktivitas operasional cabang pada ERP Travel AI Platform.