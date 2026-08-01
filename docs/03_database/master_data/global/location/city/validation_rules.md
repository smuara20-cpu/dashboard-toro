# CITY VALIDATION RULES

Version : 1.0

---

# Tujuan

Dokumen ini mendefinisikan seluruh aturan validasi untuk Master Data City.

Validation dilakukan sebelum data disimpan ke Database.

Seluruh API, Flutter, Import Data, dan AI wajib menggunakan aturan validasi yang sama.

---

# Validation Scope

Validation mencakup:

- Required Field
- Data Type
- Length
- Duplicate
- Foreign Key
- Status
- Soft Delete

---

# Validation Rules

## VR-001

Province wajib dipilih.

Validation

- Required
- Foreign Key harus valid
- Tidak boleh NULL

---

## VR-002

City Name wajib diisi.

Validation

- Required
- Minimal 2 karakter
- Maksimal 150 karakter

---

## VR-003

City Name tidak boleh hanya berisi angka.

Contoh

❌

12345

---

## VR-004

City Name hanya boleh berisi karakter yang valid.

Diperbolehkan:

- Huruf
- Angka
- Spasi
- Titik
- Tanda Hubung
- Apostrof

---

## VR-005

City Name tidak boleh duplikat dalam Province yang sama.

Contoh

Province

Jawa Barat

↓

Bandung

Bandung

❌

---

## VR-006

City Code bersifat opsional.

Apabila diisi:

- Maksimal 20 karakter
- Tidak boleh duplikat dalam Province yang sama.

---

## VR-007

Status wajib memiliki nilai.

Nilai yang diperbolehkan:

- Active
- Inactive

---

## VR-008

City yang masih digunakan oleh District tidak boleh dihapus.

Validation dilakukan sebelum proses Delete.

---

## VR-009

Soft Delete wajib menggunakan deleted_at.

Hard Delete tidak diperbolehkan.

---

## VR-010

created_at dan updated_at dikelola otomatis oleh sistem.

User tidak dapat mengubah nilainya.

---

## VR-011

created_by wajib berasal dari User yang sedang Login.

---

## VR-012

updated_by wajib diperbarui setiap kali terjadi perubahan data.

---

## VR-013

UUID tidak boleh diubah setelah City dibuat.

---

## VR-014

Province harus berstatus Active.

City tidak boleh dibuat pada Province yang sudah Inactive.

---

## VR-015

City Inactive tidak dapat dipilih pada transaksi baru.

Namun tetap dapat ditampilkan pada data historis.

---

## VR-016

City Name harus menggunakan format penulisan yang benar.

Contoh

Bandung

Sydney

Tokyo

Makkah

---

## VR-017

Leading Space dan Trailing Space harus dihapus otomatis.

---

## VR-018

Double Space harus dikonversi menjadi Single Space.

---

## VR-019

Import Data wajib melewati seluruh proses validasi.

Data yang gagal validasi tidak boleh disimpan.

---

## VR-020

AI tidak diperbolehkan melewati Validation Rules.

Seluruh data yang dibuat AI wajib mengikuti aturan validasi yang sama.

---

# Error Message Standard

Contoh

Province wajib dipilih.

City Name wajib diisi.

City sudah terdaftar.

City Code sudah digunakan.

Province sudah tidak aktif.

City tidak dapat dihapus karena masih digunakan oleh District.

---

# Catatan

Validation Rules merupakan standar tunggal.

Seluruh Platform wajib menggunakan aturan validasi yang sama.