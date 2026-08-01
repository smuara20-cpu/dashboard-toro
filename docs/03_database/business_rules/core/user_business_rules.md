# USER BUSINESS RULES

Version : 1.0

---

# Tujuan

User adalah akun yang digunakan untuk mengakses ERP Travel AI.

Setiap User harus berada di bawah satu Company dan satu Branch.

---

# Business Rules

## BR-001

User wajib memiliki Company.

---

## BR-002

User wajib memiliki Branch.

---

## BR-003

User wajib memiliki minimal satu Role.

---

## BR-004

Username harus unik.

---

## BR-005

Email harus unik.

---

## BR-006

Password disimpan dalam bentuk Hash.

Tidak diperbolehkan menyimpan Plain Text Password.

---

## BR-007

User dapat memiliki lebih dari satu Role.

---

## BR-008

User dapat dipindahkan ke Branch lain.

Riwayat perpindahan harus tercatat.

---

## BR-009

User dapat dinonaktifkan.

---

## BR-010

User yang memiliki transaksi tidak boleh dihapus.

---

## BR-011

Semua aktivitas User wajib tercatat pada Audit Log.

---

## BR-012

User dapat menggunakan Multi Factor Authentication (MFA).

---

## BR-013

User dapat memiliki foto profil.

---

## BR-014

User mempunyai status.

Active

Inactive

Suspended

Locked

---

## BR-015

User menggunakan Base Entity.