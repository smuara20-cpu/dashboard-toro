# CURRENCY BUSINESS SCENARIOS

Version : 1.0

Status : APPROVED

Master Data Name : Currency

Master Data Code : MD-CURRENCY

Category : Global Master

Domain : Global

Business Owner : Finance Domain

Technical Owner : Platform Engineering

Data Steward : Finance Administrator

Reviewer : Enterprise Architecture Team

Approval : APPROVED

Last Updated : 2026-08-03

---

# Tujuan

Dokumen ini menjelaskan contoh penggunaan Master Data Currency pada proses bisnis TIOS.

Seluruh skenario bertujuan memastikan Currency digunakan secara konsisten oleh seluruh modul.

---

# BS-001
## Menambahkan Currency Baru

### Actor

Finance Administrator

### Preconditions

- User memiliki hak akses Master Data Currency.
- Currency belum pernah terdaftar.

### Flow

1. Membuka Master Data Currency.
2. Memilih **Tambah Currency**.
3. Mengisi Currency Code.
4. Mengisi Currency Name.
5. Mengisi Currency Symbol.
6. Menentukan Decimal Digits.
7. Menyimpan data.

### Expected Result

- Currency berhasil dibuat.
- Audit Trail tercatat.
- Currency tersedia untuk seluruh modul.

---

# BS-002
## Menentukan Default Currency Company

### Actor

Company Administrator

### Preconditions

- Minimal terdapat satu Currency aktif.

### Flow

1. Membuka daftar Currency.
2. Memilih salah satu Currency.
3. Menetapkan sebagai Default Currency.

### Expected Result

- Default Currency berubah.
- Hanya satu Default Currency untuk setiap Company.

---

# BS-003
## Menggunakan Currency pada Paket

### Actor

Marketing

### Preconditions

- Currency berstatus Active.

### Flow

1. Membuat Paket.
2. Memilih Currency.
3. Mengisi harga paket.

### Expected Result

- Harga tersimpan menggunakan Currency yang dipilih.

---

# BS-004
## Menggunakan Currency pada Pembayaran

### Actor

Finance

### Preconditions

- Booking telah dibuat.
- Currency tersedia.

### Flow

1. Membuka transaksi pembayaran.
2. Memilih Currency transaksi.
3. Menyimpan pembayaran.

### Expected Result

- Pembayaran menggunakan Currency yang dipilih.
- Nilai transaksi tersimpan secara konsisten.

---

# BS-005
## Menonaktifkan Currency

### Actor

Finance Administrator

### Preconditions

- Currency masih digunakan oleh transaksi lama.

### Flow

1. Membuka Master Data Currency.
2. Mengubah Status menjadi Inactive.

### Expected Result

- Currency tidak dapat digunakan pada transaksi baru.
- Data transaksi lama tetap dapat ditampilkan.

---

# BS-006
## Import Currency

### Actor

System Administrator

### Preconditions

- File import sesuai template.

### Flow

1. Memilih menu Import.
2. Mengunggah file.
3. Sistem melakukan validasi.
4. Sistem menyimpan data valid.

### Expected Result

- Data valid berhasil diimpor.
- Data tidak valid ditolak beserta alasan.

---

# BS-007
## AI Analytics

### Actor

AI Analytics Engine

### Preconditions

- User memiliki hak menggunakan AI Analytics.

### Flow

1. AI membaca transaksi berdasarkan Currency.
2. AI melakukan analisis.
3. AI menghasilkan ringkasan.

### Expected Result

- Tidak ada perubahan Master Data.
- AI hanya melakukan pembacaan dan analisis.

---

# Exception Scenarios

## Currency Code sudah digunakan

Hasil:

Sistem menolak penyimpanan dan menampilkan pesan:

"Currency Code sudah digunakan."

---

## Currency tidak aktif dipilih pada transaksi baru

Hasil:

Sistem menolak transaksi dan meminta pengguna memilih Currency yang masih aktif.

---

## Currency digunakan oleh transaksi lama

Hasil:

Currency tidak dapat dihapus.

Status hanya dapat diubah menjadi Inactive.

---

# Related Documents

- business_rules.md
- validation_rules.md
- data_dictionary.md
- erd.md
- sample_data.md
- security_review.md
- review.md
- notes.md
- changelog.md

---

# Final Review

Seluruh Business Scenario harus dapat direalisasikan melalui antarmuka Web, Mobile, API, maupun Automation Workflow.

---

# Catatan

Business Scenario digunakan sebagai referensi:

- Developer
- QA
- Business Analyst
- Product Owner
- AI Engine

Seluruh perubahan Business Scenario wajib direview sebelum implementasi.