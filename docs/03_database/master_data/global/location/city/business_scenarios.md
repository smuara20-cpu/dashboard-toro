# CITY BUSINESS SCENARIOS

Version : 1.0

---

# Tujuan

Dokumen ini menjelaskan contoh penggunaan (Business Scenarios) Master Data City pada seluruh proses bisnis ERP Travel AI Platform.

Business Scenario digunakan sebagai acuan bagi Business Analyst, Backend Developer, Flutter Developer, QA Tester, dan AI Engineer.

---

# Scenario 1

## Membuat Data Company

### Actor

Administrator

### Flow

1. Administrator membuka Form Company.
2. Memilih Country.
3. Sistem menampilkan Province sesuai Country.
4. Administrator memilih Province.
5. Sistem menampilkan City sesuai Province.
6. Administrator memilih City.
7. Data Company berhasil disimpan.

Status

✅ Valid

---

# Scenario 2

## Registrasi Jamaah

### Actor

Customer Service

### Flow

1. Membuka Form Jamaah.
2. Memilih Country.
3. Memilih Province.
4. Memilih City.
5. Sistem menyimpan city_id.
6. Data Jamaah berhasil dibuat.

Status

✅ Valid

---

# Scenario 3

## Smart Lookup

### Actor

User

### Flow

1. User mengetik nama City.
2. Sistem melakukan pencarian.
3. Menampilkan daftar City yang sesuai.
4. User memilih City.
5. Sistem menyimpan city_id.

Status

✅ Valid

---

# Scenario 4

## API Lookup

### Actor

Backend API

### Flow

1. API menerima parameter Province.
2. API mencari seluruh City berdasarkan Province.
3. API mengembalikan daftar City.
4. Flutter menampilkan hasil.

Status

✅ Valid

---

# Scenario 5

## AI Recommendation

### Actor

AI Engine

### Flow

1. AI membaca city_id.
2. AI menghubungkan dengan Geo Intelligence Engine.
3. AI menghasilkan analisis wilayah.
4. AI menampilkan rekomendasi kepada Dashboard.

Status

✅ Read Only

---

# Scenario 6

## Soft Delete

### Actor

Platform Administrator

### Flow

1. Administrator memilih City.
2. Sistem memeriksa relasi.
3. Jika masih digunakan, penghapusan ditolak.
4. Jika memenuhi syarat, status diubah menjadi Inactive.
5. Audit Log dibuat.

Status

✅ Secure

---

# Integration

Master Data City digunakan oleh:

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
- Hotel
- Airport
- Dashboard
- AI

---

# Catatan

Seluruh Business Module wajib menggunakan `city_id` sebagai referensi wilayah administrasi tingkat kota.

Penggunaan nama City secara langsung pada tabel transaksi tidak diperbolehkan.