# MASTER DATA FOLDER STRUCTURE

Version : 2.0

---

# Tujuan

Dokumen ini menjelaskan standar struktur folder untuk seluruh Master Data pada ERP Travel AI Platform.

Seluruh Master Data wajib mengikuti struktur yang sama agar:

- Konsisten
- Mudah dipelihara
- Mudah dikembangkan
- Mudah dipahami oleh Developer
- Mudah digunakan oleh AI
- Mudah diterjemahkan menjadi SQL, API, Flutter, Dashboard, Workflow, dan AI Agent

---

# Struktur Folder Master Data

master_data/

├── global/
│
│   ├── location/
│   │   ├── country/
│   │   ├── province/
│   │   ├── city/
│   │   ├── district/
│   │   └── village/
│   │
│   └── reference/
│       ├── currency/
│       ├── language/
│       ├── timezone/
│       ├── religion/
│       └── nationality/
│
├── system/
│
│   ├── travel/
│   │   ├── airline/
│   │   ├── airport/
│   │   ├── visa_type/
│   │   ├── hotel_category/
│   │   └── room_type/
│   │
│   └── document/
│       ├── passport_type/
│       └── identity_type/
│
└── company/
│
├── finance/
│   ├── bank/
│   ├── bank_branch/
│   ├── payment_method/
│   └── payment_channel/
│
├── crm/
│   ├── lead_source/
│   ├── customer_category/
│   └── customer_status/
│
├── organization/
│   ├── department/
│   ├── division/
│   ├── position/
│   ├── job_title/
│   └── employment_type/
│
├── travel/
│   ├── package_category/
│   └── package_type/
│
└── system/
├── approval_level/
├── notification_channel/
├── document_type/
└── attachment_type/

---

# Standar Isi Setiap Master Data

Setiap Master Data wajib memiliki struktur dokumentasi yang sama.

Contoh:

country/

├── business_rules.md
├── data_dictionary.md
├── erd.md
└── notes.md

---

# Fungsi Setiap Dokumen

## business_rules.md

Berisi aturan bisnis Master Data.

Contoh:

- Data wajib unik.
- Tidak boleh dihapus apabila digunakan transaksi.
- Menggunakan Soft Delete.
- Menggunakan Base Entity.

---

## data_dictionary.md

Berisi struktur tabel database.

Meliputi:

- Overview
- Business Purpose
- Columns
- Relationships
- Index
- Validation
- Security
- Audit
- Future Expansion

---

## erd.md

Berisi relasi antar tabel.

Digunakan sebagai acuan sebelum membuat SQL.

---

## notes.md

Berisi:

- Catatan implementasi
- Keputusan desain
- Referensi bisnis
- Catatan perubahan
- Backlog khusus Master Data

---

# Standar Penamaan Folder

Seluruh folder menggunakan:

snake_case

Contoh:

country

currency

payment_method

visa_type

customer_category

job_title

attachment_type

---

# Standar Penamaan File

Seluruh Master Data menggunakan nama file yang sama.

Contoh:

country/

├── business_rules.md
├── data_dictionary.md
├── erd.md
└── notes.md

currency/

├── business_rules.md
├── data_dictionary.md
├── erd.md
└── notes.md

bank/

├── business_rules.md
├── data_dictionary.md
├── erd.md
└── notes.md

airline/

├── business_rules.md
├── data_dictionary.md
├── erd.md
└── notes.md

Seluruh Master Data wajib menggunakan struktur yang sama.

---

# Standar Pengembangan

Setiap Master Data wajib dibuat dengan urutan berikut.

1. Business Rules

↓

2. Data Dictionary

↓

3. ERD

↓

4. Architecture Review

↓

5. SQL

↓

6. API

↓

7. Flutter

↓

8. AI

↓

9. Testing

↓

10. Production

Tidak diperbolehkan melompati urutan tersebut tanpa Architecture Review.

---

# Standar Kategori

Master Data dibagi menjadi tiga kategori.

## Global Master

Digunakan oleh seluruh Company.

Tidak dapat diubah oleh Company.

Contoh:

- Country
- Province
- City
- Currency
- Language
- Timezone
- Religion
- Nationality

---

## System Master

Disediakan oleh Platform.

Dikelola oleh Super Administrator Platform.

Contoh:

- Airline
- Airport
- Visa Type
- Passport Type
- Hotel Category

---

## Company Master

Dimiliki masing-masing Company.

Dapat berbeda antar perusahaan.

Contoh:

- Bank
- Package Type
- Department
- Payment Method
- Customer Category
- Approval Level

---

# Business Rules

- Seluruh Master Data wajib mengikuti struktur folder ini.
- Seluruh Master Data wajib memiliki Business Rules.
- Seluruh Master Data wajib memiliki Data Dictionary.
- Seluruh Master Data wajib memiliki ERD.
- Seluruh Master Data wajib memiliki Notes.
- Tidak diperbolehkan membuat struktur folder baru tanpa Architecture Review.
- Seluruh Master Data wajib menggunakan Base Entity.
- Seluruh Master Data wajib terdokumentasi sebelum implementasi SQL dimulai.
- Seluruh Master Data wajib menjadi Single Source of Truth.
- Seluruh Master Data wajib dapat digunakan oleh AI Agent.

---

# Catatan

Master Data Folder Structure merupakan standar resmi ERP Travel AI Platform.

Seluruh Master Data yang akan dibuat setelah dokumen ini wajib mengikuti struktur yang telah ditetapkan.

Perubahan struktur hanya dapat dilakukan melalui Architecture Review agar konsistensi sistem tetap terjaga.