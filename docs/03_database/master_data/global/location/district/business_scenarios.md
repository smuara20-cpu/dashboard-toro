# DISTRICT BUSINESS SCENARIOS

Version : 1.0

---

# Tujuan

Dokumen ini menjelaskan contoh penggunaan (Business Scenarios) Master Data District pada seluruh proses bisnis ERP Travel AI Platform.

Business Scenario digunakan sebagai acuan bagi Business Analyst, Backend Developer, Flutter Developer, QA Engineer, AI Engineer, dan Architecture Team.

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
7. Sistem menampilkan seluruh District sesuai City.
8. Customer Service memilih District.
9. Sistem menyimpan district_id.
10. Data Jamaah berhasil disimpan.

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
6. Sistem melakukan validasi hierarki lokasi.
7. Customer berhasil disimpan.

Status

✅ Valid

---

# Scenario 3

## Input Data Vendor

### Actor

Administrator

### Flow

1. Administrator membuka Form Vendor.
2. Memilih lokasi Vendor.
3. Sistem melakukan Smart Lookup District.
4. Administrator memilih District.
5. Sistem menyimpan district_id.

Status

✅ Valid

---

# Scenario 4

## Smart Lookup District

### Actor

User

### Flow

1. User mengetik nama District.
2. Sistem mencari berdasarkan:
    - Country
    - Province
    - City
    - District Name
3. Sistem menampilkan daftar District yang sesuai.
4. User memilih District.
5. Sistem menyimpan district_id.

Status

✅ Valid

---

# Scenario 5

## API Lookup District

### Actor

Backend API

### Flow

1. API menerima parameter city_id.
2. API memvalidasi city_id.
3. API mengambil seluruh District yang aktif.
4. API mengembalikan hasil ke Flutter.

Status

✅ Valid

---

# Scenario 6

## AI Territory Analysis

### Actor

AI Geo Intelligence Engine

### Flow

1. AI membaca district_id.
2. AI menghubungkan data dengan City, Province, dan Country.
3. AI menghitung jumlah Customer dan Jamaah.
4. AI membuat analisis wilayah.
5. Hasil dikirim ke Dashboard CEO.

Status

✅ Read Only

---

# Scenario 7

## Territory Performance

### Actor

CEO Dashboard

### Flow

1. Dashboard membaca seluruh transaksi berdasarkan district_id.
2. Sistem menghitung:
    - Jumlah Jamaah
    - Revenue
    - Closing Rate
    - Repeat Customer
3. Dashboard menampilkan performa setiap District.

Status

✅ Valid

---

# Scenario 8

## Campaign Recommendation

### Actor

AI Marketing Director

### Flow

1. AI membaca performa setiap District.
2. AI membandingkan:
    - Lead
    - Closing
    - Revenue
    - Biaya Iklan
3. AI memberikan rekomendasi District yang layak menjadi target Campaign.

Status

✅ Recommendation Only

---

# Scenario 9

## Soft Delete

### Actor

Platform Administrator

### Flow

1. Administrator memilih District.
2. Sistem memeriksa apakah District masih digunakan.
3. Jika masih digunakan, penghapusan ditolak.
4. Jika memenuhi syarat, status District menjadi Inactive.
5. Audit Log dibuat.

Status

✅ Secure

---

# Integration

Master Data District digunakan oleh:

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

---

# Catatan

Seluruh Business Module wajib menggunakan district_id sebagai referensi wilayah administrasi tingkat District.

Penggunaan nama District secara langsung pada tabel transaksi tidak diperbolehkan.