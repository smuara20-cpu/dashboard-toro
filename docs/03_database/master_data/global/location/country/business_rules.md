# COUNTRY BUSINESS RULES

Version : 1.0

---

# Tujuan

Country merupakan Master Data Global yang menyimpan daftar seluruh negara yang digunakan oleh ERP Travel AI Platform.

Country menjadi referensi utama untuk seluruh data yang berhubungan dengan lokasi.

---

# Business Purpose

Country digunakan oleh:

- Company
- Branch
- Customer
- Jamaah
- Vendor
- Supplier
- Hotel
- Airport
- Booking
- Travel Requirement
- AI Agent

---

# Business Rules

## BR-001

Country merupakan Global Master.

---

## BR-002

Country digunakan bersama oleh seluruh Company.

---

## BR-003

Country tidak memiliki company_id.

---

## BR-004

Country menggunakan standar internasional ISO 3166.

---

## BR-005

Setiap Country wajib memiliki nama resmi.

---

## BR-006

Setiap Country wajib memiliki ISO Alpha-2 Code.

Contoh:

ID

SA

JP

MY

---

## BR-007

Setiap Country wajib memiliki ISO Alpha-3 Code.

Contoh:

IDN

SAU

JPN

MYS

---

## BR-008

ISO Alpha-2 wajib unik.

---

## BR-009

ISO Alpha-3 wajib unik.

---

## BR-010

Nama Country wajib unik.

---

## BR-011

Country tidak boleh dihapus apabila masih digunakan oleh data lain.

---

## BR-012

Country hanya dapat dinonaktifkan.

---

## BR-013

Seluruh perubahan Country wajib tercatat pada Audit Log.

---

## BR-014

Country menggunakan Base Entity.

---

## BR-015

Country hanya dapat dikelola oleh Platform Administrator.

---

## BR-016

Company hanya memiliki hak membaca (Read Only).

---

## BR-017

Country menjadi Single Source of Truth untuk seluruh modul ERP.

---

## BR-018

Seluruh transaksi hanya menyimpan country_id.

Tidak diperbolehkan menyimpan nama Country secara langsung.

---

## BR-019

Country wajib dapat digunakan oleh AI Agent sebagai referensi lokasi.

---

## BR-020

Country wajib mendukung pengembangan Multi Language pada versi berikutnya.

---

# Relasi

Country

↓

Province

↓

City

↓

District

↓

Village

---

Digunakan oleh:

- Company
- Branch
- Customer
- Jamaah
- Vendor
- Supplier
- Hotel
- Airport
- Booking
- Travel Requirement

---

# Soft Delete

Country tidak menggunakan Hard Delete.

Status Country hanya dapat:

- Active
- Inactive

---

# Audit

Menggunakan Base Entity.

---

# Catatan

Country merupakan Master Data Global.

Seluruh modul ERP wajib menggunakan Country sebagai referensi lokasi.