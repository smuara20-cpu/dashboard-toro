# PROVINCE ERD

Version : 1.0

---

# Tujuan

Dokumen ini menjelaskan hubungan (Entity Relationship) Master Data Province dengan seluruh Master Data dan Business Module pada ERP Travel AI Platform.

Dokumen ini menjadi acuan implementasi Foreign Key sebelum pembuatan SQL.

---

# Posisi Province

Province merupakan Child Entity dari Country.

Province merupakan Parent Entity bagi City.

---

# Hierarki Lokasi

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

# Parent Entity

Country

Relationship

Country (1)

↓

Province (N)

---

# Child Entity

City

Relationship

Province (1)

↓

City (N)

---

# Relationship Dengan Master Data

Country

1

↓

N

Province

---

Province

1

↓

N

City

---

# Relationship Dengan Core Module

Province

1

↓

N

Company

(Optional)

---

Province

1

↓

N

Branch

(Optional)

---

# Relationship Dengan Customer Module

Province

1

↓

N

Customer

---

Province

1

↓

N

Jamaah

---

Province

1

↓

N

Emergency Contact

---

# Relationship Dengan Vendor Module

Province

1

↓

N

Vendor

---

Province

1

↓

N

Supplier

---

# Relationship Dengan Hotel Module

Province

1

↓

N

Hotel

---

# Relationship Dengan Airport Module

Province

1

↓

N

Airport

---

# Relationship Dengan AI

Province

↓

AI Knowledge

↓

Regional Recommendation

↓

Travel Analytics

↓

Business Intelligence

---

# Foreign Key

Province

country_id

↓

Country.id

---

City

province_id

↓

Province.id

---

Company

province_id

↓

Province.id

(Optional)

---

Branch

province_id

↓

Province.id

(Optional)

---

Customer

province_id

↓

Province.id

---

Jamaah

province_id

↓

Province.id

---

Vendor

province_id

↓

Province.id

---

Supplier

province_id

↓

Province.id

---

Hotel

province_id

↓

Province.id

---

Airport

province_id

↓

Province.id

---

# Cardinality

| Parent | Child | Relationship |
|----------|--------|--------------|
| Country | Province | 1 : N |
| Province | City | 1 : N |
| Province | Company | 1 : N (Optional) |
| Province | Branch | 1 : N (Optional) |
| Province | Customer | 1 : N |
| Province | Jamaah | 1 : N |
| Province | Vendor | 1 : N |
| Province | Supplier | 1 : N |
| Province | Hotel | 1 : N |
| Province | Airport | 1 : N |

---

# Delete Rule

Province tidak boleh dihapus apabila:

- masih memiliki City
- masih digunakan oleh Company
- masih digunakan oleh Branch
- masih digunakan oleh Customer
- masih digunakan oleh Jamaah
- masih digunakan oleh Vendor
- masih digunakan oleh Supplier
- masih digunakan oleh Hotel
- masih digunakan oleh Airport

---

# Update Rule

Perubahan Nama Province tidak memengaruhi Relationship.

Seluruh relasi menggunakan province_id sebagai Foreign Key.

---

# AI Relationship

AI menggunakan province_id sebagai referensi utama.

AI tidak menggunakan nama Province sebagai referensi utama.

---

# Business Flow

Platform Administrator

↓

Country

↓

Province

↓

City

↓

District

↓

Village

↓

Business Module

---

# Future Expansion

Province dapat memiliki relasi tambahan dengan:

- Regional Office
- Tax Region
- Tourism Region
- Delivery Zone
- Weather Zone
- Disaster Information
- Travel Restriction
- Province Profile

---

# Performance Recommendation

Province merupakan Master Data dengan frekuensi perubahan yang sangat rendah.

Disarankan:

- Cache pada API
- Offline Cache pada Flutter
- Lazy Loading untuk daftar besar
- Index pada country_id
- Index pada name

---

# Catatan

Province merupakan Parent Entity bagi City.

Province wajib menggunakan country_id sebagai Foreign Key.

Seluruh Business Module wajib menggunakan province_id sebagai referensi wilayah administratif tingkat provinsi.