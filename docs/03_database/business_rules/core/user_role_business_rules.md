# USER ROLE BUSINESS RULES

Version : 1.0

---

# Tujuan

User Role menghubungkan User dengan Role.

User dapat memiliki satu atau lebih Role.

User Role merupakan implementasi Role Based Access Control (RBAC) pada ERP Travel AI.

---

# Business Rules

## BR-001

User Role wajib memiliki Company.

---

## BR-002

User wajib sudah terdaftar sebelum User Role dibuat.

---

## BR-003

Role wajib sudah terdaftar sebelum User Role dibuat.

---

## BR-004

Satu User dapat memiliki satu atau lebih Role.

---

## BR-005

Satu Role dapat dimiliki oleh satu atau lebih User.

---

## BR-006

User Role tidak boleh duplikat.

Kombinasi Company, User, dan Role harus unik.

---

## BR-007

Setiap User wajib memiliki minimal satu Role yang berstatus aktif.

---

## BR-008

User dapat memiliki satu Default Role.

Default Role digunakan saat Login apabila User tidak memilih Role lain.

---

## BR-009

Apabila User memiliki lebih dari satu Role aktif, User dapat memilih Active Role saat Login.

Apabila User hanya memiliki satu Role aktif, sistem langsung menggunakan Role tersebut.

---

## BR-010

Perubahan User Role harus langsung memperbarui hak akses User sesuai Active Role.

---

## BR-011

Semua perubahan User Role wajib tercatat pada Audit Log.

---

## BR-012

User Role menggunakan Base Entity.

---

## BR-013

Role hanya dapat diberikan kepada User oleh Administrator yang memiliki Permission untuk mengelola User Role.

---

## BR-014

User hanya dapat mengganti Active Role ke Role yang telah dimilikinya dan masih berstatus aktif.

---

## BR-015

Perubahan Active Role tidak mengubah daftar Role yang dimiliki User.

Perubahan hanya mengubah Role yang sedang digunakan.

---

## BR-016

Perubahan Active Role harus memperbarui:

- Hak Akses
- Dashboard
- Menu
- Workflow
- Notification
- AI Context

secara otomatis.

---

## BR-017

Setiap perubahan Active Role wajib tercatat pada Audit Log.

Audit minimal mencatat:

- User
- Role Sebelumnya
- Role Baru
- Waktu Perubahan
- Device
- IP Address

---

## BR-018

User yang hanya memiliki satu Role aktif tidak perlu memilih Role saat Login.

Sistem langsung menggunakan Default Role atau satu-satunya Role aktif yang dimiliki.

---

## BR-019

Role yang berstatus Inactive, Suspended, atau Deleted tidak boleh digunakan sebagai Active Role.

---

## BR-020

Apabila seluruh Role User berstatus tidak aktif, User tidak dapat mengakses sistem.

---

## BR-021

Perubahan daftar Role milik User tidak mengubah histori transaksi yang telah dibuat sebelumnya.

Seluruh transaksi tetap mengacu pada Role yang aktif pada saat transaksi dilakukan.

---

## BR-022

Pergantian Active Role tidak memerlukan proses Logout.

Perubahan dilakukan dalam satu Session yang sama.

---

## BR-023

Setelah Active Role berubah, sistem wajib melakukan validasi ulang terhadap seluruh Permission sebelum User dapat melanjutkan aktivitas.

---

## BR-024

Setiap Session hanya memiliki satu Active Role.

Seluruh Dashboard, Menu, Workflow, AI, dan Permission menggunakan Active Role tersebut.

---

## BR-025

User Role mendukung pengembangan fitur berikut tanpa mengubah struktur database:

- Multi Role
- Dynamic Role
- Temporary Role
- Delegation Role
- Scheduled Role
- Branch Based Role
- Department Based Role