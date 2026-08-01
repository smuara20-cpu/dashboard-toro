# COMPANY BUSINESS RULES

Version : 1.0

---

# Tujuan

Company merupakan entitas tertinggi pada sistem ERP.

Semua data operasional wajib dimiliki oleh sebuah Company.

ERP mendukung Multi Company.

---

# Business Rules

## BR-001

Company harus mempunyai kode unik.

Contoh

TRAVEL001

TRAVEL002

---

## BR-002

Nama Company wajib diisi.

---

## BR-003

Status Company dapat berupa

- Active
- Inactive
- Suspended

---

## BR-004

Company yang memiliki Branch tidak boleh dihapus.

---

## BR-005

Company yang memiliki User tidak boleh dihapus.

---

## BR-006

Company yang memiliki Booking tidak boleh dihapus.

---

## BR-007

Company yang memiliki Customer tidak boleh dihapus.

---

## BR-008

Company hanya boleh dinonaktifkan.

Tidak boleh dihapus apabila masih memiliki data.

---

## BR-009

Satu Company memiliki banyak Branch.

One To Many

---

## BR-010

Satu Company memiliki banyak User.

One To Many

---

## BR-011

Satu Company memiliki banyak Customer.

One To Many

---

## BR-012

Satu Company memiliki banyak Booking.

One To Many

---

## BR-013

Satu Company memiliki banyak Invoice.

One To Many

---

## BR-014

Semua data Finance wajib memiliki company_id.

---

## BR-015

Semua data CRM wajib memiliki company_id.

---

## BR-016

Semua data Marketing wajib memiliki company_id.

---

## BR-017

Semua data AI wajib memiliki company_id.

---

## BR-018

Company menggunakan Base Entity.

created_at

updated_at

deleted_at

created_by

updated_by

deleted_by

---

## BR-019

Company dapat mempunyai banyak logo.

Namun hanya satu logo aktif.

---

## BR-020

Audit wajib mencatat seluruh perubahan Company.

Insert

Update

Delete

Restore

Status Change