# GLOBAL MASTER

Version : 1.0

---

# Tujuan

Global Master merupakan kumpulan Master Data yang digunakan bersama oleh seluruh Company pada ERP Travel AI Platform.

Global Master menjadi referensi utama (Single Source of Truth) yang tidak dimiliki oleh Company tertentu.

---

# Fungsi

Global Master digunakan untuk:

- Standarisasi data
- Konsistensi data
- Mengurangi duplikasi data
- Menjadi referensi seluruh Business Module
- Menjadi referensi AI Agent
- Mendukung SaaS Platform

---

# Karakteristik

Global Master memiliki karakteristik berikut:

- Digunakan oleh seluruh Company.
- Tidak dimiliki Company tertentu.
- Bersifat stabil.
- Jarang berubah.
- Menjadi referensi utama.
- Memiliki kode standar apabila tersedia.

---

# Daftar Global Master

## Location

- Country
- Province
- City
- District
- Village

---

## Reference

- Currency
- Language
- Timezone
- Religion
- Nationality

---

# Pengelolaan

Global Master hanya dapat dikelola oleh Platform Administrator.

Company tidak diperbolehkan mengubah Global Master.

---

# Penggunaan

Global Master digunakan oleh:

- Company
- Branch
- Customer
- Jamaah
- Booking
- Finance
- Package
- Hotel
- Ticket
- Visa
- Dashboard
- AI
- Workflow

---

# Business Rules

- Global Master merupakan Single Source of Truth.
- Company hanya dapat membaca Global Master.
- Perubahan Global Master wajib melalui proses review.
- Seluruh perubahan wajib tercatat pada Audit Log.
- Seluruh Global Master menggunakan Base Entity.
- Seluruh Global Master wajib memiliki Business Rules, Data Dictionary, ERD, dan SQL.

---

# Standar Data

Apabila tersedia standar internasional, maka wajib digunakan.

Contoh:

Country

ISO 3166

Currency

ISO 4217

Language

ISO 639

Timezone

IANA Time Zone Database

---

# Future Expansion

Global Master dirancang untuk mendukung:

- Multi Company
- Multi Country
- Multi Language
- Multi Currency
- AI Recommendation
- AI Analytics
- SaaS Platform