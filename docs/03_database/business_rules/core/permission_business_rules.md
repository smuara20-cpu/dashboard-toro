# PERMISSION BUSINESS RULES

Version : 1.0

---

# Tujuan

Permission mendefinisikan hak akses terhadap Resource di dalam sistem ERP.

Permission tidak diberikan langsung kepada User.

Permission diberikan kepada Role.

---

# Business Rules

## BR-001

Permission wajib memiliki Company.

---

## BR-002

Permission Code wajib unik.

---

## BR-003

Permission mempunyai Resource.

---

## BR-004

Permission mempunyai Action.

---

## BR-005

Permission dapat digunakan oleh banyak Role.

---

## BR-006

Permission tidak diberikan langsung kepada User.

---

## BR-007

Permission dapat dinonaktifkan.

---

## BR-008

Permission yang masih digunakan Role tidak boleh dihapus.

---

## BR-009

Permission menggunakan Base Entity.

---

## BR-010

Semua perubahan Permission wajib tercatat pada Audit Log.

---

## BR-011

Permission mendukung API Authorization.

---

## BR-012

Permission mendukung Menu Authorization.

---

## BR-013

Permission mendukung AI Authorization.

---

## BR-014

Permission mendukung Dashboard Authorization.

---

## BR-015

Permission mendukung Workflow Authorization.