# DISTRICT BUSINESS RULES

Version : 1.0

---

# Tujuan

Master Data District digunakan sebagai referensi wilayah administrasi tingkat kecamatan atau setara di setiap negara.

District menjadi bagian dari struktur Global Location dan berada di bawah City serta di atas Village.

Seluruh modul ERP Travel AI Platform wajib menggunakan Master Data District sebagai referensi wilayah administratif tingkat District.

---

# Business Rules

## BR-001

District wajib berada di bawah satu City yang valid.

Satu District tidak boleh memiliki lebih dari satu City.

---

## BR-002

Satu City dapat memiliki banyak District.

Relasi:

City (1)

↓

District (N)

---

## BR-003

Nama District boleh sama apabila berada pada City yang berbeda.

Contoh:

```
District

Sukajadi

City

Bandung

--------------------

District

Sukajadi

City

Pekanbaru
```

Kedua data tetap valid.

---

## BR-004

Kode District harus unik dalam satu City.

---

## BR-005

District hanya dapat dibuat oleh Platform Administrator.

Company tidak diperbolehkan membuat Master Data District.

---

## BR-006

District yang telah digunakan pada transaksi tidak dapat dihapus.

Status hanya dapat diubah menjadi Inactive (Soft Delete).

---

## BR-007

Perubahan nama District tidak mengubah district_id.

Seluruh relasi tetap menggunakan district_id sebagai Primary Reference.

---

## BR-008

Seluruh Business Module wajib menggunakan district_id, bukan nama District.

---

## BR-009

District harus mendukung Smart Lookup berdasarkan:

- Country
- Province
- City

---

## BR-010

District harus dapat digunakan oleh:

- Customer
- Jamaah
- Company
- Branch
- Vendor
- Supplier
- Booking
- CRM
- Finance
- Marketing
- Dashboard
- AI

---

## BR-011

District wajib mendukung pencarian (Search), penyaringan (Filter), pengurutan (Sorting), dan Pagination melalui API.

---

## BR-012

District merupakan Parent Entity bagi Village.

Village tidak dapat dibuat tanpa District yang valid.

---

## BR-013

Seluruh perubahan Master Data District wajib dicatat pada Audit Log.

---

## BR-014

District merupakan bagian dari Global Master Data.

Seluruh Company menggunakan referensi District yang sama.

---

## BR-015

District harus mendukung pengembangan Geo Intelligence Engine dan Intelligent Address Engine.

---

# Ownership

Master Data District dimiliki oleh Platform.

Company hanya memiliki hak Read.

---

# Business Impact

Master Data District digunakan sebagai referensi utama wilayah administrasi tingkat District pada seluruh ERP Travel AI Platform.

---

# Related Master Data

- Country
- Province
- City
- Village

---

# Status

Approved