# PROVINCE NOTES

Version : 1.0

---

# Tujuan

Dokumen ini menjelaskan alasan desain (Design Rationale), keputusan arsitektur, dan catatan implementasi Master Data Province.

Dokumen ini menjadi referensi resmi apabila dilakukan pengembangan, audit, atau perubahan di masa mendatang.

---

# Design Philosophy

Province merupakan Master Data Global.

Province menjadi penghubung antara Country dan City.

Seluruh modul ERP wajib menggunakan Province sebagai referensi wilayah administratif tingkat provinsi.

---

# Design Decisions

## DD-001

Province merupakan Global Master Data.

Province tidak dimiliki oleh Company.

---

## DD-002

Province wajib memiliki Country.

Province tidak dapat berdiri sendiri.

---

## DD-003

Seluruh relasi menggunakan province_id.

Nama Province tidak boleh disimpan pada tabel transaksi.

---

## DD-004

Province menggunakan UUID sebagai Primary Key.

UUID dipilih agar:

- aman untuk API
- aman untuk sinkronisasi
- mendukung distribusi database
- siap untuk Multi Tenant

---

## DD-005

Province menggunakan Soft Delete.

Hard Delete tidak diperbolehkan.

---

## DD-006

Province mengikuti standar internasional.

Standar yang digunakan apabila tersedia:

- ISO 3166-2
- ISO Subdivision
- Administrative Region Standard

---

## DD-007

Province merupakan Parent Entity bagi City.

Perubahan Province akan berdampak pada seluruh struktur Location.

---

## DD-008

Province dirancang untuk mendukung Travel Operating System.

Bukan hanya digunakan untuk Umroh dan Haji.

Namun juga:

- International Tour
- Domestic Tour
- Corporate Travel
- Visa Service
- MICE
- Cruise

---

## DD-009

Province harus kompatibel dengan arsitektur Multi Tenant.

Master Data tetap bersifat Global.

Data transaksi tetap menjadi milik masing-masing Tenant.

---

## DD-010

Province harus dapat digunakan oleh AI.

AI menggunakan province_id sebagai referensi utama.

AI tidak menggunakan nama Province sebagai identitas utama.

---

# Business Considerations

Province digunakan hampir oleh seluruh Business Module.

Kesalahan pada Master Data Province dapat berdampak pada:

- Customer
- Jamaah
- Booking
- Finance
- Dashboard
- AI
- Reporting

Oleh karena itu perubahan Province harus melalui proses review.

---

# Performance Notes

Province merupakan Master Data dengan frekuensi perubahan sangat rendah.

Disarankan:

- Offline Cache
- API Cache
- Indexed Search
- Lazy Loading

---

# Integration Notes

Province akan digunakan oleh:

- Country
- City
- Company
- Branch
- Customer
- Jamaah
- Vendor
- Supplier
- Hotel
- Airport
- Dashboard
- AI

---

# Developer Notes

Developer tidak diperbolehkan:

- Menyimpan nama Province pada tabel transaksi.
- Membuat Province baru dari aplikasi Company.
- Menghapus Province secara Hard Delete.

Developer wajib menggunakan province_id sebagai Foreign Key.

---

# AI Notes

AI hanya memiliki hak baca (Read Only).

AI menggunakan Province sebagai Knowledge Reference.

AI tidak diperbolehkan mengubah Master Data Province.

---

# Lessons Learned

Province merupakan bagian penting dari struktur Global Location.

Seluruh pengembangan Location harus menjaga konsistensi antara Country, Province, City, District, dan Village.

---

# Catatan

Dokumen ini dapat diperbarui apabila terdapat keputusan arsitektur baru yang memengaruhi Master Data Province.