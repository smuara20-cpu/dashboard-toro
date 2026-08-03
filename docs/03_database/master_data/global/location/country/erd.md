# COUNTRY ERD

Version : 1.0

---

# Tujuan

Dokumen ini menjelaskan hubungan (Relationship) antara Master Data Country dengan Master Data lainnya serta seluruh Business Module pada ERP Travel AI Platform.

Dokumen ini menjadi acuan sebelum implementasi SQL Database, Foreign Key, dan API.

---

# Posisi Country

Country merupakan Root Entity pada Master Data Location.

Seluruh struktur lokasi berada di bawah Country.

---

# Hierarki Lokasi

Country
│
└── Province
│
└── City
│
└── District
│
└── Village

---

# Parent Entity

Country merupakan Root Master Data.

Country tidak memiliki Parent.

---

# Child Entity

Country memiliki Child:

- Province

Relationship

Country (1)

↓

Province (N)

---

# Relationship Dengan Master Data

Country

1

↓

N

Province

---

Country

1

↓

N

Airport

---

Country

1

↓

N

Hotel

---

# Relationship Dengan Core Module

Country

1

↓

N

Company

---

Country

1

↓

N

Branch

---

User tidak memiliki relasi langsung dengan Country.

User mengikuti Country melalui Company atau Branch.

---

# Relationship Dengan Customer Module

Country

1

↓

N

Customer

---

Country

1

↓

N

Jamaah

---

Country

1

↓

N

Emergency Contact

---

# Relationship Dengan Vendor Module

Country

1

↓

N

Vendor

---

Country

1

↓

N

Supplier

---

# Relationship Dengan Travel Module

Country

1

↓

N

Package

(Opsional sesuai kebutuhan bisnis)

---

Country

1

↓

N

Travel Requirement

---

Country

1

↓

N

Visa Requirement

---

Country

1

↓

N

Embassy

(Future Expansion)

---

# Relationship Dengan AI

Country

↓

AI Knowledge

↓

Travel Recommendation

↓

Visa Recommendation

↓

Dashboard Analytics

---

# Foreign Key

Province

country_id

↓

Country.id

---

Company

country_id

↓

Country.id

---

Branch

country_id

↓

Country.id

---

Customer

country_id

↓

Country.id

---

Jamaah

country_id

↓

Country.id

---

Vendor

country_id

↓

Country.id

---

Supplier

country_id

↓

Country.id

---

Airport

country_id

↓

Country.id

---

Hotel

country_id

↓

Country.id

---

Travel Requirement

country_id

↓

Country.id

---

# Cardinality

| Parent | Child | Relationship |
|---------|-------|--------------|
| Country | Province | 1 : N |
| Country | Company | 1 : N |
| Country | Branch | 1 : N |
| Country | Customer | 1 : N |
| Country | Jamaah | 1 : N |
| Country | Vendor | 1 : N |
| Country | Supplier | 1 : N |
| Country | Airport | 1 : N |
| Country | Hotel | 1 : N |
| Country | Travel Requirement | 1 : N |

---

# Delete Rule

Country tidak boleh dihapus apabila masih memiliki Child atau masih digunakan oleh Business Module.

Country hanya dapat diubah menjadi Inactive.

---

# Update Rule

Perubahan Nama Country tidak memengaruhi Relationship.

Seluruh relasi menggunakan country_id sebagai Foreign Key.

---

# AI Relationship

AI menggunakan country_id sebagai referensi utama.

AI tidak menggunakan nama Country sebagai Primary Reference.

Hal ini menjaga konsistensi data apabila terjadi perubahan nama Country.

---

# Business Flow

Platform Administrator

↓

Create Country

↓

Create Province

↓

Create City

↓

Create District

↓

Create Village

↓

Digunakan oleh seluruh Business Module

---

# Future Expansion

Country dapat memiliki relasi tambahan dengan:

- Currency
- Timezone
- Language
- Embassy
- Travel Advisory
- Public Holiday
- Prayer Time
- Weather
- Country Profile
- Safety Index
- Halal Information

---

# Catatan

Country merupakan Root Master Data untuk seluruh struktur lokasi.

Seluruh Master Data Location wajib mengacu pada Country.

Seluruh Business Module wajib menggunakan country_id sebagai Foreign Key.

Tidak diperbolehkan menyimpan nama Country secara langsung pada tabel transaksi.