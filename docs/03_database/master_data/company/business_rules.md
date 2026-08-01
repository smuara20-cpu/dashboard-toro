# COMPANY BUSINESS RULES

Version : 1.0

Status : APPROVED

Master Data Code : MD-COMPANY

Domain Code : DOM-002

Last Updated : 2026-08-02

Owner : Business Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan seluruh Business Rules untuk Master Data Company.

Master Data Company merupakan referensi utama identitas perusahaan dalam ERP Travel AI Platform dan menjadi Root Entity pada Domain Company Management.

---

# Business Rules

## BR-001

Setiap Company wajib memiliki Company ID yang unik dan permanen.

Company ID tidak boleh digunakan kembali meskipun Company telah diarsipkan.

---

## BR-002

Setiap Company mewakili satu Tenant sesuai AD-044 One Database Per Tenant Policy.

---

## BR-003

Satu Tenant hanya memiliki satu Company utama.

---

## BR-004

Seluruh Branch wajib berada di bawah satu Company.

---

## BR-005

Seluruh Department wajib berada di bawah Company melalui struktur organisasi yang berlaku.

---

## BR-006

Seluruh Employee wajib memiliki Company Owner.

---

## BR-007

Seluruh User wajib terhubung dengan satu Company.

---

## BR-008

Seluruh transaksi operasional wajib memiliki referensi Company.

Contoh:

- Booking
- Customer
- Jamaah
- Finance
- Marketing
- CRM

---

## BR-009

Status Company terdiri dari:

- Registered
- Verified
- Active
- Suspended
- Archived

---

## BR-010

Perubahan status Company wajib tercatat pada Audit Log.

---

## BR-011

Company yang berstatus Archived tidak dapat membuat transaksi baru.

Data historis tetap dapat diakses sesuai hak akses.

---

## BR-012

Company wajib memiliki minimal satu alamat operasional yang mengacu pada Global Location.

---

## BR-013

Company dapat memiliki lebih dari satu Branch.

---

## BR-014

Company dapat memiliki lebih dari satu Office.

---

## BR-015

Company dapat memiliki lebih dari satu Business Unit.

---

## BR-016

Company wajib memiliki minimal satu Administrator aktif.

---

## BR-017

Perubahan identitas Company (nama legal, NPWP/Tax ID, logo utama) harus tercatat pada Audit Log.

---

## BR-018

Konfigurasi Company berlaku hanya untuk Company tersebut dan tidak boleh memengaruhi Tenant lain.

---

## BR-019

Seluruh data Company harus mendukung Multi-Language dan Configuration Over Customization sesuai AD-051, AD-052, AD-053, dan AD-054.

---

## BR-020

AI hanya dapat mengakses data Company sesuai Permission dan Company Boundary.

Mengacu pada AD-056 Company Boundary Policy.

---

# Business Ownership

Business Owner:

- Owner
- Director
- CEO
- Administrator (sesuai Permission)

---

# Related Master Data

- Branch
- Department
- Position
- Employee
- User
- Role
- Permission
- Office
- Business Unit
- Company Settings

---

# Related Architecture Decisions

- AD-038 Security by Design Policy
- AD-044 One Database Per Tenant Policy
- AD-051 Multi-Language User Experience Policy
- AD-052 Cultural Localization Policy
- AD-053 Internationalization First Policy
- AD-054 Configuration Over Customization Policy
- AD-055 Golden Standard Protection Policy
- AD-056 Company Boundary Policy

---

# Golden Rule

Tidak diperbolehkan ada data operasional tanpa Company sebagai pemilik data.

Company merupakan Root Entity pada Domain Company Management.

---

# Catatan

Master Data Company menjadi referensi utama seluruh data organisasi pada ERP Travel AI Platform dan merupakan fondasi implementasi Multi-Tenant SaaS.