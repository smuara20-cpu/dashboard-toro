# CITY BUSINESS RULES

Version : 1.0

---

# Tujuan

Dokumen ini mendefinisikan seluruh aturan bisnis (Business Rules) untuk Master Data City.

City merupakan bagian dari Master Data Global Location dan berada satu tingkat di bawah Province.

Seluruh modul ERP Travel AI Platform wajib menggunakan City sebagai referensi resmi wilayah administratif tingkat kota/kabupaten.

---

# Scope

Dokumen ini mencakup:

- Struktur City
- Relasi dengan Province
- Penggunaan City
- Validitas Data
- Status City
- Soft Delete
- Integrasi dengan Business Module

---

# Business Rules

## BR-001

City wajib terhubung ke satu Province.

---

## BR-002

Satu Province dapat memiliki banyak City.

---

## BR-003

City tidak boleh dibuat tanpa Province.

---

## BR-004

City menggunakan UUID sebagai Primary Key.

---

## BR-005

City menggunakan Base Entity.

---

## BR-006

City wajib memiliki nama resmi.

---

## BR-007

Nama City harus unik dalam Province yang sama.

Contoh

Province

Jawa Barat

↓

Bandung

Bogor

Bekasi

Tidak boleh terdapat dua "Bandung" dalam Province yang sama.

---

## BR-008

City dapat memiliki kode resmi.

Kode mengikuti standar pemerintah atau standar internal apabila belum tersedia.

---

## BR-009

City memiliki Status:

- Active
- Inactive

City yang Inactive tidak dapat dipilih pada transaksi baru.

---

## BR-010

City tidak boleh dihapus apabila masih memiliki District.

---

## BR-011

City menggunakan Soft Delete.

Hard Delete tidak diperbolehkan.

---

## BR-012

Seluruh perubahan City wajib tercatat pada Audit Log.

---

## BR-013

City hanya dapat dikelola oleh Platform Administrator atau Administrator yang memiliki Permission sesuai kebijakan sistem.

---

## BR-014

Company tidak diperbolehkan membuat City baru melalui aplikasi operasional.

Master Data City hanya dikelola melalui proses Master Data Management.

---

## BR-015

City digunakan sebagai referensi oleh seluruh Company.

City bukan merupakan data milik Company.

---

## BR-016

Seluruh tabel transaksi wajib menggunakan city_id.

Nama City tidak boleh disimpan langsung pada tabel transaksi.

---

## BR-017

Seluruh District wajib memiliki City.

City menjadi Parent Entity bagi District.

---

## BR-018

City harus mendukung ekspansi internasional.

Struktur City tidak boleh dibuat khusus hanya untuk Indonesia.

---

## BR-019

City dapat digunakan oleh AI sebagai Knowledge Reference.

AI hanya memiliki hak Read Only terhadap Master Data City.

---

## BR-020

Perubahan City yang memengaruhi struktur Global Location wajib melalui Architecture Review.

---

# Business Workflow

Country

↓

Province

↓

City

↓

District

↓

Village

---

# Business Impact

City digunakan oleh:

- Company
- Branch
- Customer
- Jamaah
- Booking
- Hotel
- Airport
- Vendor
- Supplier
- CRM
- Finance
- Dashboard
- AI

---

# Future Expansion

City dapat dikembangkan dengan:

- City Type
- Metropolitan Area
- Postal Code
- Latitude
- Longitude
- Timezone Override
- Population
- Area
- Tourism Category
- Smart City Information

---

# Catatan

City merupakan Parent Entity bagi District.

Seluruh perubahan City akan berdampak pada struktur Global Location ERP Travel AI Platform.