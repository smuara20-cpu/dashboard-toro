# COUNTRY NOTES

Version : 1.0

---

# Tujuan

Dokumen ini menjelaskan alasan desain (Design Rationale), keputusan arsitektur, dan catatan implementasi Master Data Country.

Dokumen ini digunakan sebagai referensi oleh:

- Solution Architect
- Software Architect
- Product Owner
- Backend Developer
- Flutter Developer
- QA
- AI Engineer

---

# Design Philosophy

Country merupakan Master Data Global.

Country dirancang sebagai Single Source of Truth untuk seluruh data lokasi pada ERP Travel AI Platform.

Seluruh modul wajib menggunakan referensi Country yang sama.

---

# Design Decisions

## DD-001

Country merupakan Global Master.

Country tidak dimiliki oleh Company.

---

## DD-002

Country tidak memiliki company_id.

Hal ini memastikan seluruh Company menggunakan referensi Country yang sama.

---

## DD-003

Seluruh relasi menggunakan country_id.

Nama Country tidak boleh disimpan pada tabel transaksi.

---

## DD-004

Country menggunakan UUID sebagai Primary Key.

UUID dipilih agar:

- aman untuk integrasi API
- aman untuk sinkronisasi data
- mendukung distribusi database
- tidak bergantung pada auto increment

---

## DD-005

Country menggunakan Soft Delete.

Hard Delete tidak diperbolehkan.

---

## DD-006

Country mengikuti standar internasional.

Standar yang digunakan:

- ISO 3166
- ISO 4217
- IANA Timezone
- ITU Dial Code

---

## DD-007

Country menjadi Root Entity untuk seluruh struktur lokasi.

Hierarki lokasi:

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

## DD-008

Country dirancang agar dapat digunakan oleh AI.

AI menggunakan country_id sebagai referensi utama.

---

# Business Considerations

ERP tidak hanya digunakan untuk:

- Umroh
- Haji

Tetapi juga mendukung:

- Wisata Domestik
- Wisata Internasional
- Corporate Travel
- MICE
- Private Trip
- Visa Service

Oleh karena itu Country harus bersifat universal.

---

# Future Considerations

Country dapat dikembangkan dengan informasi tambahan seperti:

- Embassy
- Visa Requirement
- Public Holiday
- Travel Advisory
- Safety Index
- Halal Information
- Prayer Time
- Weather
- Emergency Contact

Dokumen ini hanya mencatat arah pengembangan.

Implementasi dilakukan pada versi berikutnya.

---

# Integration Notes

Country akan digunakan oleh:

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
- Visa
- AI
- Dashboard

---

# Performance Notes

Country merupakan Master Data yang jarang berubah.

Oleh karena itu:

- dapat menggunakan cache
- dapat dipreload saat aplikasi dibuka
- cocok untuk offline cache pada Flutter

---

# Migration Notes

Apabila terjadi perubahan standar ISO, perubahan dilakukan melalui proses migrasi resmi.

Tidak diperbolehkan mengubah data secara langsung di Production Database.

---

# Developer Notes

Developer tidak diperbolehkan:

- menyimpan nama Country pada tabel transaksi
- membuat Country baru dari aplikasi Company
- mengubah ISO tanpa proses review

Developer wajib menggunakan country_id sebagai Foreign Key.

---

# AI Notes

AI hanya memiliki hak baca (Read Only).

AI menggunakan Country sebagai Knowledge Reference.

AI tidak diperbolehkan membuat, mengubah, atau menghapus Master Data Country.

---

# Lessons Learned

Master Data merupakan pondasi seluruh ERP.

Kesalahan desain pada Master Data akan berdampak pada seluruh Business Module.

Oleh karena itu perubahan pada Master Data harus melalui Architecture Review.

---

# Catatan

Dokumen ini dapat diperbarui apabila terdapat keputusan arsitektur baru yang memengaruhi Master Data Country.