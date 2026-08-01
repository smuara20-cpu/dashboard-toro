# MASTER DATA INVENTORY

Version : 1.0

---

# Tujuan

Master Data Inventory merupakan daftar seluruh Master Data yang digunakan oleh ERP Travel AI Platform.

Dokumen ini menjadi acuan dalam pembangunan Database, API, Flutter, Dashboard, Workflow, AI, dan Reporting.

Seluruh Master Data wajib terdaftar pada dokumen ini sebelum dibuat Business Rules maupun SQL.

---

# Fungsi

Master Data Inventory digunakan untuk:

- Menginventaris seluruh Master Data.
- Menentukan kategori Master Data.
- Menentukan prioritas implementasi.
- Menentukan modul yang menggunakan Master Data.
- Menjadi checklist progres pengembangan.

---

# Kategori Master Data

ERP Travel AI Platform membagi Master Data menjadi tiga kategori.

## 1. Global Master

Digunakan oleh seluruh Company.

Tidak dapat diubah oleh Company.

Contoh:

- Country
- Province
- City
- Currency
- Language
- Religion

---

## 2. System Master

Disediakan oleh Platform.

Dapat diperbarui oleh Super Administrator Platform.

Contoh:

- Airline
- Airport
- Visa Type
- Passport Type

---

## 3. Company Master

Dimiliki masing-masing Company.

Dapat berbeda antar perusahaan.

Contoh:

- Bank
- Payment Method
- Department
- Package Type

---

# Status

| Status | Keterangan |
|---------|------------|
| Planned | Belum dibuat |
| In Progress | Sedang dikerjakan |
| Completed | Sudah selesai |
| Deprecated | Tidak digunakan lagi |

---

# MASTER DATA INVENTORY

| No | Master Data | Category | Digunakan Oleh | Priority | Status |
|----|-------------|----------|----------------|----------|--------|
| 1 | Country | Global | Company, Branch, Customer, Jamaah | High | Planned |
| 2 | Province | Global | Company, Branch, Customer, Jamaah | High | Planned |
| 3 | City | Global | Company, Branch, Customer, Jamaah | High | Planned |
| 4 | District | Global | Company, Branch, Customer, Jamaah | High | Planned |
| 5 | Village | Global | Company, Branch, Customer, Jamaah | High | Planned |
| 6 | Currency | Global | Finance, Booking | High | Planned |
| 7 | Language | Global | System | Medium | Planned |
| 8 | Timezone | Global | Company, System | Medium | Planned |
| 9 | Religion | Global | Customer, Jamaah | Medium | Planned |
| 10 | Nationality | Global | Customer, Jamaah | Medium | Planned |
| 11 | Airline | System | Ticket | Medium | Planned |
| 12 | Airport | System | Ticket | Medium | Planned |
| 13 | Visa Type | System | Travel Requirement | Medium | Planned |
| 14 | Hotel Category | System | Hotel | Low | Planned |
| 15 | Room Type | System | Hotel | Low | Planned |
| 16 | Passport Type | System | Travel Requirement | Low | Planned |
| 17 | Identity Type | System | Customer | Low | Planned |
| 18 | Bank | Company | Finance | High | Planned |
| 19 | Bank Branch | Company | Finance | Medium | Planned |
| 20 | Payment Method | Company | Finance | High | Planned |
| 21 | Payment Channel | Company | Finance | High | Planned |
| 22 | Package Category | Company | Package | Medium | Planned |
| 23 | Package Type | Company | Package | Medium | Planned |
| 24 | Lead Source | Company | CRM | Medium | Planned |
| 25 | Customer Category | Company | CRM | Medium | Planned |
| 26 | Customer Status | Company | CRM | Medium | Planned |
| 27 | Department | Company | User | Medium | Planned |
| 28 | Division | Company | User | Medium | Planned |
| 29 | Position | Company | User | Medium | Planned |
| 30 | Job Title | Company | User | Medium | Planned |
| 31 | Employment Type | Company | User | Low | Planned |
| 32 | Notification Channel | Company | Notification | Medium | Planned |
| 33 | Approval Level | Company | Workflow | Medium | Planned |
| 34 | Document Type | Company | Document | Medium | Planned |
| 35 | Attachment Type | Company | Document | Low | Planned |

---

# Prioritas Implementasi

## Priority High

Master Data yang wajib selesai sebelum Business Module dimulai.

- Country
- Province
- City
- District
- Village
- Currency
- Bank
- Payment Method
- Payment Channel

---

## Priority Medium

Master Data yang dibuat mengikuti kebutuhan modul.

---

## Priority Low

Master Data pendukung.

Dapat dibuat setelah modul utama selesai.

---

# Business Rules

- Seluruh Business Module wajib menggunakan Master Data.
- Tidak diperbolehkan menyimpan data referensi dalam bentuk Text apabila Master Data sudah tersedia.
- Master Data menjadi Single Source of Truth.
- Setiap Master Data wajib memiliki Business Rules, Data Dictionary, ERD, dan SQL.
- Penambahan Master Data baru wajib diperbarui pada Master Data Inventory.

---

# Future Expansion

Master Data Inventory dirancang untuk mendukung:

- Multi Company
- Multi Country
- Multi Currency
- Multi Language
- AI Recommendation
- AI OCR
- Workflow Automation
- SaaS Platform