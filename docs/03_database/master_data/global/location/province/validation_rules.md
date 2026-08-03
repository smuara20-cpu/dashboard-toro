# PROVINCE VALIDATION RULES

Version : 1.0

---

# Tujuan

Dokumen ini mendefinisikan seluruh aturan validasi untuk Master Data Province.

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

Country wajib dipilih.

Validation

- Required
- Foreign Key harus valid
- Tidak boleh NULL

---

## VR-002

Province Name wajib diisi.

Validation

- Required
- Minimal 2 karakter
- Maksimal 150 karakter

---

## VR-003

Province Name tidak boleh hanya berisi angka.

Contoh

❌

12345

---

## VR-004

Province Name hanya boleh berisi karakter yang valid.

Diperbolehkan

- Huruf
- Angka
- Spasi
- Titik
- Tanda hubung
- Apostrof

---

## VR-005

Province Name tidak boleh duplikat dalam Country yang sama.

Contoh

Indonesia

- Jawa Barat
- Jawa Barat

❌ Tidak diperbolehkan.

---

## VR-006

Province Code bersifat opsional.

Apabila diisi:

- Maksimal 20 karakter
- Tidak boleh duplikat dalam Country yang sama

---

## VR-007

Status wajib memiliki nilai.

Nilai yang diperbolehkan:

- Active
- Inactive

---

## VR-008

Province yang masih digunakan oleh City tidak boleh dihapus.

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

UUID tidak boleh diubah setelah Province dibuat.

---

## VR-014

Country harus berstatus Active.

Province tidak boleh dibuat pada Country yang sudah Inactive.

---

## VR-015

Province Inactive tidak dapat dipilih pada transaksi baru.

Namun tetap dapat ditampilkan pada data historis.

---

## VR-016

Province Name harus menggunakan format penulisan yang benar.

Contoh

✅

Jawa Barat

New South Wales

Central Java

---

## VR-017

Leading Space dan Trailing Space harus dihapus otomatis.

Contoh

"  Jawa Barat  "

menjadi

"Jawa Barat"

---

## VR-018

Double Space harus dikonversi menjadi Single Space.

Contoh

"New   South   Wales"

menjadi

"New South Wales"

---

## VR-019

Import Data wajib melewati seluruh proses validasi.

Data yang gagal validasi tidak boleh disimpan.

---

## VR-020

AI tidak diperbolehkan melewati proses validasi.

Seluruh data yang dibuat AI wajib mengikuti Validation Rules yang sama.

---

# Error Message Standard

Contoh Error:

Country wajib dipilih.

Province Name wajib diisi.

Province sudah terdaftar.

Province Code sudah digunakan.

Province tidak dapat dihapus karena masih digunakan oleh City.

Country sudah tidak aktif.

---

# Catatan

Validation Rules merupakan standar tunggal.

Seluruh Platform wajib menggunakan aturan validasi yang sama.