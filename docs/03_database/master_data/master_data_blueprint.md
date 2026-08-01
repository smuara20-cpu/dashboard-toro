# MASTER DATA BLUEPRINT

Version : 1.0

---

# Tujuan

Master Data Blueprint merupakan daftar seluruh Master Data yang digunakan oleh ERP Travel AI Platform.

Seluruh modul wajib menggunakan Master Data yang telah ditentukan.

Tidak diperbolehkan membuat data referensi baru di luar Master Data Center tanpa melalui proses desain.

---

# Apa itu Master Data?

Master Data adalah data referensi yang digunakan berulang oleh banyak modul.

Contoh:

- Negara
- Bank
- Mata Uang
- Maskapai
- Metode Pembayaran

Master Data bukan data transaksi.

Master Data bukan data operasional.

Master Data bersifat stabil dan digunakan sebagai referensi.

---

# Struktur Master Data Center

MASTER DATA CENTER

↓

Location

↓

Finance

↓

Travel

↓

CRM

↓

Organization

↓

Document

↓

System

↓

Reference

---

# LOCATION

Digunakan oleh:

- Company
- Branch
- Customer
- Jamaah
- Hotel
- Vendor
- Supplier

Tabel:

- Country
- Province
- City
- District
- Village

---

# FINANCE

Digunakan oleh:

- Invoice
- Payment
- Refund
- Journal
- Cash Flow

Tabel:

- Currency
- Bank
- Bank Branch
- Payment Method
- Payment Channel

---

# TRAVEL

Digunakan oleh:

- Package
- Booking
- Hotel
- Ticket
- Visa

Tabel:

- Airline
- Airport
- Hotel Category
- Room Type
- Package Category
- Package Type
- Visa Type
- Ticket Class

---

# CRM

Digunakan oleh:

- Lead
- Customer
- Marketing

Tabel:

- Lead Source
- Customer Category
- Customer Status

---

# ORGANIZATION

Digunakan oleh:

- User
- HR
- Dashboard

Tabel:

- Department
- Division
- Position
- Job Title
- Employment Type

---

# DOCUMENT

Digunakan oleh:

- Document
- Customer
- Jamaah
- OCR AI

Tabel:

- Passport Type
- Identity Type
- Visa Category
- Certificate Type
- Attachment Type

---

# SYSTEM

Digunakan oleh:

- ERP
- AI
- Dashboard
- Notification

Tabel:

- Language
- Timezone
- Notification Channel
- Approval Level
- Gender

---

# REFERENCE

Digunakan oleh seluruh ERP.

Tabel:

- Religion
- Nationality

---

# Business Rules

- Seluruh transaksi wajib menggunakan Master Data.
- Tidak diperbolehkan menyimpan data referensi dalam bentuk Text apabila sudah tersedia Master Data.
- Master Data hanya dapat diubah oleh User yang memiliki Permission.
- Perubahan Master Data wajib tercatat pada Audit Log.
- Master Data menggunakan Base Entity.
- Master Data mendukung Multi Company apabila diperlukan.
- Master Data menjadi sumber referensi bagi AI Agent.

---

# Prioritas Implementasi

Priority 1

- Country
- Province
- City
- District
- Village

Priority 2

- Currency
- Bank
- Payment Method

Priority 3

- Airline
- Airport
- Package Type
- Visa Type

Priority 4

- Customer Category
- Lead Source
- Religion
- Nationality

Priority 5

Seluruh Master Data lainnya.

---

# Future Expansion

Master Data Center dirancang agar dapat mendukung:

- Multi Company
- Multi Country
- Multi Currency
- Multi Language
- AI Recommendation
- AI OCR
- AI Analytics
- Workflow Automation
- SaaS Platform