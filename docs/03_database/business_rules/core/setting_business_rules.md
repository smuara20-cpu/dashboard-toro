# SETTING BUSINESS RULES

Version : 1.0

---

# Tujuan

Setting menyimpan konfigurasi sistem ERP.

Setting digunakan untuk mengatur perilaku aplikasi tanpa mengubah source code.

---

# Business Rules

## BR-001

Setting wajib dimiliki oleh Company.

---

## BR-002

Satu Company dapat memiliki banyak Setting.

---

## BR-003

Setiap Setting memiliki Category.

---

## BR-004

Setiap Setting memiliki Key yang unik dalam Category.

---

## BR-005

Setting dapat berupa:

- String
- Number
- Boolean
- Date
- JSON

---

## BR-006

Perubahan Setting hanya dapat dilakukan oleh User yang memiliki Permission.

---

## BR-007

Perubahan Setting wajib tercatat pada Audit Log.

---

## BR-008

Setting dapat diaktifkan atau dinonaktifkan.

---

## BR-009

Setting menggunakan Base Entity.

---

## BR-010

Perubahan Setting harus langsung diterapkan apabila tidak memerlukan restart sistem.

---

## BR-011

Setting dapat digunakan oleh seluruh modul ERP.

---

## BR-012

AI Agent dapat membaca Setting sesuai Permission yang dimiliki.

---

## BR-013

Setting dapat digunakan sebagai konfigurasi Workflow.

---

## BR-014

Setting dapat digunakan sebagai konfigurasi Dashboard.

---

## BR-015

Setting mendukung pengembangan Multi Company tanpa mengubah struktur database.