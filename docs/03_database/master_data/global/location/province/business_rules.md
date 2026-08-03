# PROVINCE BUSINESS RULES

Version : 1.0

---

# Tujuan

Dokumen ini mendefinisikan seluruh aturan bisnis (Business Rules) untuk Master Data Province.

Province merupakan bagian dari Master Data Global Location dan berada satu tingkat di bawah Country.

Seluruh modul ERP Travel AI Platform wajib menggunakan Province sebagai referensi resmi wilayah administratif tingkat provinsi.

---

# Scope

Dokumen ini mencakup:

- Struktur Province
- Relasi dengan Country
- Penggunaan Province
- Validitas Data
- Status Province
- Soft Delete
- Integrasi dengan modul lain

---

# Business Rules

## BR-001

Province wajib terhubung ke satu Country.

---

## BR-002

Satu Country dapat memiliki banyak Province.

---

## BR-003

Province tidak boleh dibuat tanpa Country.

---

## BR-004

Province menggunakan UUID sebagai Primary Key.

---

## BR-005

Province menggunakan Base Entity.

---

## BR-006

Province wajib memiliki nama resmi.

---

## BR-007

Nama Province harus unik di dalam Country yang sama.

Contoh:

Indonesia
- Jawa Barat
- Jawa Tengah
- Jawa Timur

Tidak boleh terdapat dua "Jawa Barat" pada Country Indonesia.

Namun nama yang sama diperbolehkan apabila berada pada Country yang berbeda sesuai kebutuhan bisnis.

---

## BR-008

Province dapat memiliki kode resmi (Province Code).

Kode mengikuti standar pemerintah atau standar internal perusahaan apabila belum tersedia standar resmi.

---

## BR-009

Province memiliki Status Active dan Inactive.

Province Inactive tidak dapat dipilih pada transaksi baru.

---

## BR-010

Province tidak boleh dihapus apabila masih digunakan oleh City.

---

## BR-011

Province menggunakan Soft Delete.

Hard Delete tidak diperbolehkan.

---

## BR-012

Semua perubahan Province wajib tercatat pada Audit Log.

---

## BR-013

Province hanya dapat dikelola oleh Platform Administrator atau Administrator yang memiliki Permission sesuai kebijakan sistem.

---

## BR-014

Company tidak diperbolehkan membuat Province baru melalui aplikasi operasional.

Master Data Province hanya dikelola melalui proses Master Data Management.

---

## BR-015

Province digunakan sebagai referensi oleh seluruh Company.

Province bukan merupakan data milik Company.

---

## BR-016

Province wajib digunakan sebagai Foreign Key.

Nama Province tidak boleh disimpan langsung pada tabel transaksi.

---

## BR-017

Seluruh City wajib memiliki Province.

Province menjadi Parent Entity bagi City.

---

## BR-018

Province harus mendukung ekspansi internasional.

Struktur Province tidak boleh dibuat khusus hanya untuk Indonesia.

---

## BR-019

Province dapat digunakan oleh AI sebagai Knowledge Reference.

AI hanya memiliki hak Read Only terhadap Master Data Province.

---

## BR-020

Perubahan Province wajib melalui proses Architecture Review apabila berdampak pada struktur Global Location.

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

Province digunakan oleh:

- Company
- Branch
- Customer
- Jamaah
- Vendor
- Supplier
- Hotel
- Airport
- Booking
- Finance
- CRM
- Dashboard
- AI

---

# Future Expansion

Province dapat dikembangkan dengan informasi tambahan seperti:

- Province Code Nasional
- ISO Subdivision Code
- Capital City
- Area
- Population
- Timezone Override
- Regional Office
- Tax Region
- Travel Zone
- Destination Category

---

# Catatan

Province merupakan bagian dari Global Master Data.

Seluruh perubahan terhadap Province akan berdampak pada seluruh struktur lokasi ERP Travel AI Platform.