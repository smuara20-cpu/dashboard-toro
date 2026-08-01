# BRANCH BUSINESS RULES

Version : 1.0

---

# Tujuan

Branch merupakan cabang operasional Company.

Setiap transaksi operasional dilakukan melalui Branch.

---

# Business Rules

## BR-001

Branch wajib dimiliki oleh satu Company.

One Company

↓

Many Branch

---

## BR-002

Branch Code wajib unik dalam satu Company.

---

## BR-003

Branch Name wajib diisi.

---

## BR-004

Branch mempunyai alamat.

---

## BR-005

Branch mempunyai nomor telepon.

---

## BR-006

Branch mempunyai email.

---

## BR-007

Branch mempunyai PIC.

---

## BR-008

Branch dapat dinonaktifkan.

---

## BR-009

Branch yang mempunyai Booking tidak boleh dihapus.

---

## BR-010

Branch yang mempunyai Customer tidak boleh dihapus.

---

## BR-011

Branch yang mempunyai Invoice tidak boleh dihapus.

---

## BR-012

Branch yang mempunyai Payment tidak boleh dihapus.

---

## BR-013

Semua transaksi wajib mempunyai branch_id.

---

## BR-014

Satu Branch mempunyai banyak User.

---

## BR-015

Satu Branch mempunyai banyak Customer.

---

## BR-016

Satu Branch mempunyai banyak Booking.

---

## BR-017

Satu Branch mempunyai banyak Invoice.

---

## BR-018

Satu Branch mempunyai banyak Payment.

---

## BR-019

Audit wajib mencatat seluruh perubahan Branch.

---

## BR-020

Branch menggunakan Base Entity.