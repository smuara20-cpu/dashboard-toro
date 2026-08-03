# COUNTRY BUSINESS SCENARIOS

Version : 1.0

---

# Tujuan

Dokumen ini menjelaskan contoh penggunaan Master Data Country pada proses bisnis ERP Travel AI Platform.

Business Scenario digunakan sebagai referensi bagi:

- Product Owner
- Business Analyst
- Backend Developer
- Flutter Developer
- QA
- AI Agent
- Technical Writer

---

# Scenario 1

## Platform Administrator Menambahkan Country Baru

Actor

Platform Administrator

Flow

Login

↓

Master Data

↓

Location

↓

Country

↓

Create Country

↓

Isi Data

↓

Save

Result

Country dapat digunakan oleh seluruh Company.

---

# Scenario 2

## Company Membuat Branch

Actor

Administrator Company

Flow

Company

↓

Create Branch

↓

Pilih Country

↓

Indonesia

↓

Save

Result

Branch menggunakan Country yang valid.

---

# Scenario 3

## Customer Registrasi

Actor

Customer

Flow

Register

↓

Pilih Country

↓

Indonesia

↓

Save

Result

Customer memiliki referensi Country yang valid.

---

# Scenario 4

## Jamaah Membuat Booking Umroh

Actor

Customer

Flow

Booking

↓

Isi Data Jamaah

↓

Pilih Nationality

↓

Indonesia

↓

Upload Dokumen

↓

Submit

Result

Data Jamaah menggunakan Country yang valid.

---

# Scenario 5

## Pembuatan Visa

Actor

Visa Officer

Flow

Booking

↓

Visa Process

↓

Country

↓

Saudi Arabia

↓

Generate Visa Checklist

Result

Sistem menentukan kebutuhan dokumen berdasarkan Country.

---

# Scenario 6

## AI Memberikan Rekomendasi

Actor

AI Travel Assistant

Flow

Customer

↓

Memilih Tujuan

↓

Japan

↓

AI membaca Country

↓

Menampilkan:

- Mata Uang
- Timezone
- Visa
- Travel Advisory

Result

AI memberikan rekomendasi berdasarkan Country.

---

# Scenario 7

## Dashboard Analytics

Actor

CEO

Flow

Dashboard

↓

Booking

↓

Group by Country

↓

Analytics

Result

CEO mengetahui distribusi negara tujuan pelanggan.

---

# Scenario 8

## Finance

Actor

Finance

Flow

Invoice

↓

Customer Country

↓

Currency

↓

Generate Invoice

Result

Invoice dapat menyesuaikan kebutuhan lintas negara apabila diaktifkan.

---

# Scenario 9

## Hotel Reservation

Actor

Hotel Staff

Flow

Booking

↓

Hotel

↓

Guest Nationality

↓

Country

↓

Check In

Result

Data tamu sesuai standar internasional.

---

# Scenario 10

## Airport Manifest

Actor

Tour Leader

Flow

Manifest

↓

Passenger

↓

Nationality

↓

Country

↓

Export PDF

Result

Manifest mengikuti standar maskapai.

---

# Business Impact

Country digunakan oleh hampir seluruh modul ERP.

Kesalahan pada Master Data Country akan berdampak pada:

- Customer
- Jamaah
- Booking
- Visa
- Finance
- Hotel
- Dashboard
- AI
- Reporting

---

# Integration

Country terintegrasi dengan:

- Province
- City
- District
- Village
- Currency
- Timezone
- Nationality
- Visa
- Travel Requirement
- Airport
- Hotel
- AI

---

# Catatan

Country merupakan salah satu Master Data paling kritikal dalam ERP.

Seluruh proses bisnis wajib menggunakan referensi Country yang valid.