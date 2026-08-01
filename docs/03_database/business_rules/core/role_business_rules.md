# ROLE BUSINESS RULES

Version : 1.0

---

# Tujuan

Role mendefinisikan fungsi pekerjaan pengguna dalam sistem ERP.

Role tidak digunakan untuk Login.

Role digunakan untuk menentukan hak akses melalui Permission.

---

# Business Rules

## BR-001

Role wajib memiliki Company.

---

## BR-002

Role Code wajib unik dalam satu Company.

---

## BR-003

Role Name wajib diisi.

---

## BR-004

Role dapat dimiliki oleh banyak User.

---

## BR-005

User dapat memiliki lebih dari satu Role.

---

## BR-006

Role dapat memiliki banyak Permission.

---

## BR-007

Role dapat dinonaktifkan.

---

## BR-008

Role yang masih digunakan User tidak boleh dihapus.

---

## BR-009

Role yang masih mempunyai Permission tidak boleh dihapus.

---

## BR-010

Role menggunakan Base Entity.

---

## BR-011

Semua perubahan Role wajib tercatat pada Audit Log.

---

## BR-012

Role dapat digunakan oleh Approval Workflow.

---

## BR-013

Role dapat digunakan sebagai Approval Level.

---

## BR-014

Role dapat digunakan sebagai AI Access Level.

---

## BR-015

Role mendukung Multi Company.