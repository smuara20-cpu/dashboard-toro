# PROJECT GOLDEN RULES

Version : 1.0

---

# Golden Rule 1

## Business First

Seluruh fitur yang dikembangkan harus berangkat dari kebutuhan bisnis.

Pengembangan tidak boleh dilakukan hanya karena teknologi memungkinkan atau karena terlihat menarik.

Sebelum fitur dibuat, harus dapat menjawab pertanyaan:

- Masalah bisnis apa yang diselesaikan?
- Siapa yang mendapatkan manfaat?
- Bagaimana proses bisnis menjadi lebih baik?

Apabila tidak dapat menjawab pertanyaan tersebut, fitur harus ditunda.

---

# Golden Rule 2

## User First

Setiap fitur harus membantu pengguna.

ERP dibuat untuk membantu pekerjaan, bukan menambah beban pekerjaan.

Setiap pengembangan harus mempertimbangkan kebutuhan:

- CEO
- Manager
- Finance
- Marketing
- Customer Service
- Tour Leader
- Jamaah
- Vendor
- Partner

User selalu menjadi prioritas utama.

---

# Golden Rule 3

## Simple First

Fitur boleh kompleks.

Tetapi penggunaan harus tetap sederhana.

Targetnya adalah:

Pengguna baru mampu memahami fungsi utama aplikasi tanpa memerlukan pelatihan yang panjang.

Semakin sedikit klik untuk menyelesaikan pekerjaan, semakin baik.

---

# Golden Rule 4

## Workflow Driven

Seluruh modul harus mengikuti Business Workflow.

Tidak boleh ada modul yang berdiri sendiri.

Contoh:

Lead

↓

Customer

↓

Booking

↓

Payment

↓

Document

↓

Visa

↓

Departure

↓

Tour Leader

↓

After Sales

Workflow menjadi dasar desain seluruh sistem.

---

# Golden Rule 5

## Database First

Database dirancang terlebih dahulu.

Urutan pengembangan wajib mengikuti:

Business Rules

↓

Data Dictionary

↓

SQL

↓

API

↓

Flutter

↓

AI

Tidak diperbolehkan membuat UI sebelum struktur database disetujui.

---

# Golden Rule 6

## Security First

Keamanan merupakan bagian dari desain.

Bukan tambahan di akhir proyek.

Seluruh fitur harus mempertimbangkan:

- Authentication
- Authorization
- Encryption
- Audit Log
- Session
- Access Control
- Data Protection

---

# Golden Rule 7

## AI Ready

Seluruh data harus dapat digunakan oleh AI.

Database harus memiliki struktur yang jelas.

AI harus mampu membaca:

- Customer
- Booking
- Payment
- Dashboard
- Document
- Workflow

tanpa memerlukan perubahan struktur.

---

# Golden Rule 8

## Single Source of Truth

Satu informasi hanya memiliki satu sumber.

Tidak diperbolehkan menduplikasi data.

Contoh:

Country

hanya berasal dari

Country Master.

---

# Golden Rule 9

## Master Data Center

Seluruh data referensi wajib berasal dari Master Data Center.

Tidak diperbolehkan membuat data referensi baru pada tabel transaksi apabila Master Data sudah tersedia.

---

# Golden Rule 10

## Configuration Over Hardcode

Semua konfigurasi sistem harus disimpan pada Setting.

Contoh:

- Prefix Booking
- Prefix Invoice
- Company Logo
- SMTP
- WhatsApp API
- AI Model
- Currency

Tidak boleh di-hardcode pada source code.

---

# Golden Rule 11

## Audit Everything

Seluruh aktivitas penting wajib tercatat.

Minimal mencatat:

- Siapa
- Kapan
- Apa yang diubah
- Nilai lama
- Nilai baru
- Device
- IP Address

Audit menjadi dasar keamanan dan investigasi.

---

# Golden Rule 12

## Cloud Native

Arsitektur harus siap dijalankan pada Cloud.

Sistem tidak bergantung pada komputer lokal.

Seluruh file disimpan menggunakan Cloud Storage.

Seluruh layanan mendukung deployment modern.

---

# Golden Rule 13

## SaaS Ready

ERP harus mendukung:

- Multi Company
- Multi Branch
- Multi User
- Multi Role

Tanpa mengubah struktur database.

---

# Golden Rule 14

## AI Assists, Humans Decide

AI bertugas membantu.

Keputusan akhir tetap berada pada manusia.

Contoh:

AI OCR

↓

AI Fraud Detection

↓

Finance Verification

↓

Approve

AI tidak boleh menggantikan keputusan bisnis yang penting.

---

# Golden Rule 15

## Business Process Over Product Name

ERP dibangun berdasarkan proses bisnis.

Bukan berdasarkan nama produk.

Contoh:

Bukan

Visa Schengen

Tetapi

Travel Requirement

Karena Requirement dapat digunakan oleh seluruh jenis perjalanan.

---

# Golden Rule 16

## Design For Future

Setiap desain harus mempertimbangkan pengembangan minimal lima tahun ke depan.

Tidak membuat desain yang hanya cocok untuk kondisi saat ini.

---

# Golden Rule 17

## User Experience Matters

Aplikasi harus nyaman digunakan.

Target pengguna:

- Usia muda
- Usia produktif
- Lansia

Semua dapat menggunakan aplikasi dengan mudah.

---

# Golden Rule 18

## Mobile First

Seluruh fitur wajib nyaman digunakan pada perangkat mobile.

Interface harus:

- sederhana
- mudah disentuh
- font mudah dibaca
- tombol cukup besar
- tidak membingungkan

---

# Golden Rule 19

## Explainable AI

AI tidak hanya memberikan jawaban.

AI harus mampu menjelaskan alasan dari setiap rekomendasi apabila diminta.

Pengguna tetap dapat memahami dasar pengambilan keputusan AI.

---

# Golden Rule 20

## Every Feature Must Have Purpose

Tidak boleh ada fitur yang dibuat hanya karena menarik.

Setiap fitur harus memiliki manfaat yang jelas.

Jika tidak memberikan manfaat nyata, fitur harus ditunda.

---

# Golden Rule 21

## Delight User

ERP tidak hanya harus benar.

ERP juga harus menyenangkan digunakan.

Contohnya:

- Dashboard yang informatif
- Loading yang cepat
- Animasi seperlunya
- Warna yang nyaman
- Notifikasi yang membantu
- AI yang ramah
- Navigasi yang mudah

Pengguna harus merasa terbantu setiap kali membuka aplikasi.

---

# Golden Rule 22

## Benefit Every Stakeholder

Setiap fitur baru harus memberikan manfaat nyata minimal kepada salah satu pihak berikut:

- Company
- CEO
- Director
- Manager
- Finance
- Marketing
- Customer Service
- Tour Leader
- Jamaah
- Vendor
- Supplier
- Partner

Sebelum fitur dikembangkan, selalu tanyakan:

"Siapa yang memperoleh manfaat?"

Apabila tidak ada pihak yang memperoleh manfaat nyata, fitur tersebut tidak layak dikembangkan.