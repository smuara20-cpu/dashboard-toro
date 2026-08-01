# ROLE PERMISSION BUSINESS RULES

Version : 1.0

---

# Tujuan

Role Permission menghubungkan Role dengan Permission.

Role Permission menentukan hak akses yang dimiliki oleh setiap Role.

---

# Business Rules

## BR-001

Role Permission wajib memiliki Company.

---

## BR-002

Role wajib ada sebelum Role Permission dibuat.

---

## BR-003

Permission wajib ada sebelum Role Permission dibuat.

---

## BR-004

Satu Role dapat memiliki banyak Permission.

---

## BR-005

Satu Permission dapat digunakan oleh banyak Role.

---

## BR-006

Role Permission tidak boleh duplikat.

Role yang sama tidak boleh mempunyai Permission yang sama lebih dari satu kali.

---

## BR-007

Role Permission dapat dinonaktifkan.

---

## BR-008

Perubahan Role Permission harus langsung mempengaruhi hak akses User.

---

## BR-009

Semua perubahan wajib tercatat pada Audit Log.

---

## BR-010

Role Permission menggunakan Base Entity.