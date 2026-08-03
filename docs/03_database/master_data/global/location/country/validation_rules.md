# COUNTRY VALIDATION RULES

Version : 1.0

---

# Tujuan

Dokumen ini menjelaskan seluruh aturan validasi data Country sebelum data disimpan ke database.

Validation Rules digunakan oleh:

- Flutter
- API
- Database
- Import Data
- AI Validation

---

# Validasi Primary Key

## VR-001

id wajib menggunakan UUID.

---

## VR-002

UUID dibuat oleh sistem.

User tidak diperbolehkan mengisi UUID secara manual.

---

# Validasi Country Name

## VR-003

Country Name wajib diisi.

---

## VR-004

Country Name minimal 2 karakter.

---

## VR-005

Country Name maksimal 150 karakter.

---

## VR-006

Country Name harus unik.

---

## VR-007

Country Name tidak boleh hanya berisi angka.

---

## VR-008

Country Name tidak boleh mengandung karakter yang tidak valid.

---

## VR-009

Leading dan trailing whitespace harus dihapus secara otomatis.

---

# Validasi ISO Alpha-2

## VR-010

ISO Alpha-2 wajib diisi.

---

## VR-011

ISO Alpha-2 harus terdiri dari 2 huruf.

Contoh:

ID

SA

JP

US

---

## VR-012

ISO Alpha-2 harus menggunakan huruf kapital.

---

## VR-013

ISO Alpha-2 harus unik.

---

# Validasi ISO Alpha-3

## VR-014

ISO Alpha-3 wajib diisi.

---

## VR-015

ISO Alpha-3 harus terdiri dari 3 huruf.

Contoh:

IDN

SAU

JPN

USA

---

## VR-016

ISO Alpha-3 harus menggunakan huruf kapital.

---

## VR-017

ISO Alpha-3 harus unik.

---

# Validasi Status

## VR-018

Status wajib memiliki nilai.

---

## VR-019

Status hanya boleh memiliki nilai:

- Active
- Inactive

---

# Validasi Audit

## VR-020

created_at diisi otomatis oleh sistem.

---

## VR-021

created_by diisi otomatis berdasarkan User Login.

---

## VR-022

updated_at diperbarui otomatis saat data berubah.

---

## VR-023

updated_by diperbarui otomatis berdasarkan User Login.

---

# Validasi Soft Delete

## VR-024

Country tidak boleh dihapus secara fisik.

---

## VR-025

Penghapusan dilakukan menggunakan Soft Delete.

---

# Validasi Relasi

## VR-026

Country tidak dapat dinonaktifkan apabila masih digunakan oleh data yang bersifat kritikal sesuai kebijakan bisnis.

---

## VR-027

Province wajib mengacu pada Country yang masih aktif.

---

# Validasi Import Data

## VR-028

Data duplikat harus ditolak.

---

## VR-029

Format file import harus sesuai template sistem.

---

## VR-030

Setiap proses import menghasilkan laporan validasi yang berisi:

- Total Data
- Data Berhasil
- Data Gagal
- Alasan Kegagalan

---

# Validasi AI

## VR-031

AI hanya dapat menggunakan Country yang berstatus Active.

---

## VR-032

AI wajib menggunakan country_id sebagai referensi.

Tidak diperbolehkan menggunakan nama Country sebagai referensi utama.

---

# Catatan

Validation Rules merupakan standar validasi untuk seluruh proses Create, Update, Import, dan Integrasi API pada Master Data Country.