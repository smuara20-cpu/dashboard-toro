# SYSTEM MASTER

Version : 1.0

---

# Tujuan

System Master merupakan kumpulan Master Data yang disediakan oleh Platform ERP Travel AI.

System Master digunakan bersama oleh seluruh Company dan dikelola oleh Platform Administrator.

---

# Fungsi

System Master digunakan untuk:

- Menyediakan referensi operasional.
- Menjaga konsistensi data.
- Mengurangi duplikasi data.
- Mendukung Business Module.
- Mendukung AI Agent.
- Mendukung SaaS Platform.

---

# Karakteristik

System Master memiliki karakteristik berikut.

- Digunakan oleh seluruh Company.
- Dikelola oleh Platform Administrator.
- Tidak dimiliki oleh Company tertentu.
- Dapat bertambah seiring perkembangan bisnis.
- Menjadi referensi operasional ERP.

---

# Daftar System Master

## Travel

- Airline
- Airport
- Visa Type
- Hotel Category
- Room Type

---

## Document

- Passport Type
- Identity Type

---

# Pengelolaan

System Master hanya dapat ditambah, diubah, atau dinonaktifkan oleh Platform Administrator.

Company tidak diperbolehkan mengubah data System Master.

---

# Penggunaan

System Master digunakan oleh:

- Package
- Booking
- Ticket
- Hotel
- Visa
- Customer
- Document
- AI
- Dashboard

---

# Business Rules

- System Master merupakan referensi operasional ERP.
- Company hanya memiliki hak membaca.
- Seluruh perubahan wajib melalui proses review.
- Seluruh perubahan wajib tercatat pada Audit Log.
- Seluruh System Master menggunakan Base Entity.
- Seluruh System Master wajib memiliki Business Rules.
- Seluruh System Master wajib memiliki Data Dictionary.
- Seluruh System Master wajib memiliki ERD.
- Seluruh System Master wajib memiliki SQL sebelum implementasi.

---

# Standar Data

Apabila tersedia standar internasional, maka standar tersebut harus digunakan.

Contoh:

Airport

- IATA Code
- ICAO Code

Airline

- IATA Airline Code
- ICAO Airline Code

Timezone

- IANA Time Zone Database

---

# Future Expansion

System Master dirancang untuk mendukung:

- AI Recommendation
- AI Travel Assistant
- Dynamic Travel Requirement
- API Integration
- SaaS Platform