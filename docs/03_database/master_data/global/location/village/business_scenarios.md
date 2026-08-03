# VILLAGE BUSINESS SCENARIOS

Version : 1.1

Status : APPROVED

Last Updated : 2026-08-02

Owner : Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini menjelaskan contoh implementasi Master Data Village pada seluruh Business Module ERP Travel AI Platform.

Business Scenario digunakan sebagai acuan implementasi Database, API, Flutter, AI, Dashboard, QA, dan Business Analyst.

---

# Scenario 1

## Registrasi Jamaah

### Actor

Customer Service

### Flow

1. Customer Service membuka Form Jamaah.
2. Memilih Country.
3. Sistem menampilkan Province sesuai Country.
4. Memilih Province.
5. Sistem menampilkan City sesuai Province.
6. Memilih City.
7. Sistem menampilkan District sesuai City.
8. Memilih District.
9. Sistem menampilkan Village sesuai District.
10. Customer Service memilih Village.
11. User mengisi Address Line.
12. Sistem menyimpan seluruh referensi lokasi.
13. Data Jamaah berhasil disimpan.

Status

✅ Valid

---

# Scenario 2

## Registrasi Customer

### Actor

Marketing

### Flow

1. Marketing membuka Form Customer.
2. Memilih Country.
3. Memilih Province.
4. Memilih City.
5. Memilih District.
6. Memilih Village.
7. Mengisi Address Line.
8. Sistem melakukan Hierarchical Validation.
9. Customer berhasil disimpan.

Status

✅ Valid

---

# Scenario 3

## Registrasi Cabang

### Actor

Administrator

### Flow

1. Administrator membuat Cabang baru.
2. Sistem meminta lokasi lengkap.
3. Administrator memilih Village.
4. Sistem otomatis membentuk Canonical Address.
5. Cabang berhasil dibuat.

Status

✅ Valid

---

# Scenario 4

## Smart Lookup Village

### Actor

User

### Flow

1. User mengetik nama Village.
2. Sistem melakukan Smart Lookup.
3. Sistem mencari berdasarkan:
    - Village
    - District
    - City
    - Province
    - Country
    - Postal Code
4. Sistem menampilkan daftar Village yang sesuai.
5. User memilih Village.

Status

✅ Valid

---

# Scenario 5

## Import Official Geographic Data

### Actor

Platform Administrator

### Flow

1. Administrator mengunduh data dari Official Geographic Data Source.
2. Sistem memverifikasi format data.
3. Sistem melakukan validasi hierarki lokasi.
4. Sistem memeriksa data duplikat.
5. Sistem melakukan preview perubahan.
6. Administrator menyetujui proses import.
7. Sistem menyimpan data.
8. Audit Log dibuat.

Status

✅ Approved Import Only

---

# Scenario 6

## AI Geo Intelligence

### Actor

Geo Intelligence Engine

### Flow

1. AI membaca village_id.
2. AI menghubungkan data dengan District, City, Province, dan Country.
3. AI menghitung:
    - Jumlah Jamaah
    - Jumlah Customer
    - Revenue
    - Repeat Customer
4. AI membuat analisis wilayah.
5. Hasil dikirim ke Dashboard.

Status

✅ Read Only

---

# Scenario 7

## Territory Performance

### Actor

CEO Dashboard

### Flow

1. Dashboard membaca seluruh transaksi berdasarkan village_id.
2. Sistem menghitung:
    - Revenue
    - Closing Rate
    - Jumlah Jamaah
    - Repeat Order
3. Dashboard menampilkan Heatmap berdasarkan Village.

Status

✅ Valid

---

# Scenario 8

## Campaign Recommendation

### Actor

AI Marketing Director

### Flow

1. AI membaca performa Village.
2. AI membandingkan:
    - Lead
    - Closing
    - Revenue
    - Cost Per Acquisition
    - ROAS (Return on Ad Spend)
3. AI memberikan rekomendasi wilayah yang layak menjadi target kampanye.

Status

✅ Recommendation Only

---

# Scenario 9

## Executive Briefing

### Actor

Executive Briefing Engine

### Flow

1. Engine membaca performa setiap Village.
2. Sistem membuat ringkasan berdasarkan wilayah terbaik dan wilayah yang membutuhkan perhatian.
3. Ringkasan ditampilkan pada Dashboard dan dikirim sesuai pengaturan Company.

Status

✅ Executive Only

---

# Scenario 10

## Geographic Update

### Actor

Platform Administrator

### Flow

1. Terdapat perubahan wilayah resmi.
2. Administrator mengimpor data terbaru dari Official Geographic Data Source.
3. Sistem menerapkan Geographic Versioning Policy.
4. Sistem menjaga histori transaksi lama.
5. Data baru mulai menggunakan versi wilayah terbaru.

Status

✅ Controlled Update

---

# Integration

Master Data Village digunakan oleh:

- Company
- Branch
- Customer
- Jamaah
- Vendor
- Supplier
- Booking
- CRM
- Finance
- Marketing
- Dashboard
- AI
- Executive Briefing Engine
- Territory Performance Engine

---

# Catatan

Seluruh Business Module wajib menggunakan `village_id` sebagai referensi wilayah administrasi.

Penggunaan nama Village sebagai referensi utama pada tabel transaksi tidak diperbolehkan.

Seluruh data Village harus berasal dari Official Geographic Data Source sesuai AD-045.