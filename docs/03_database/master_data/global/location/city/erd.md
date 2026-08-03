# CITY ERD

Version : 1.0

---

# Tujuan

Dokumen ini menjelaskan hubungan (Entity Relationship) Master Data City dengan seluruh Master Data dan Business Module pada ERP Travel AI Platform.

Dokumen ini menjadi acuan implementasi Foreign Key sebelum pembuatan SQL.

---

# Posisi City

City merupakan Child Entity dari Province.

City merupakan Parent Entity bagi District.

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

Province

Relationship

Province (1)

↓

City (N)

---

# Child Entity

District

Relationship

City (1)

↓

District (N)

---

# Relationship Dengan Master Data

Province

1

↓

N

City

---

City

1

↓

N

District

---

# Relationship Dengan Core Module

City

1

↓

N

Company

(Optional)

---

City

1

↓

N

Branch

(Optional)

---

# Relationship Dengan Customer Module

City

1

↓

N

Customer

---

City

1

↓

N

Jamaah

---

City

1

↓

N

Emergency Contact

---

# Relationship Dengan Vendor Module

City

1

↓

N

Vendor

---

City

1

↓

N

Supplier

---

# Relationship Dengan Hotel Module

City

1

↓

N

Hotel

---

# Relationship Dengan Airport Module

City

1

↓

N

Airport

---

# Relationship Dengan AI

City

↓

AI Knowledge

↓

Location Intelligence

↓

Travel Recommendation

↓

Business Intelligence

↓

Geographic Analysis

---

# Foreign Key

City

province_id

↓

Province.id

---

District

city_id

↓

City.id

---

Company

city_id

↓

City.id

(Optional)

---

Branch

city_id

↓

City.id

(Optional)

---

Customer

city_id

↓

City.id

---

Jamaah

city_id

↓

City.id

---

Vendor

city_id

↓

City.id

---

Supplier

city_id

↓

City.id

---

Hotel

city_id

↓

City.id

---

Airport

city_id

↓

City.id

---

# Cardinality

| Parent | Child | Relationship |
|----------|--------|--------------|
| Province | City | 1 : N |
| City | District | 1 : N |
| City | Company | 1 : N (Optional) |
| City | Branch | 1 : N (Optional) |
| City | Customer | 1 : N |
| City | Jamaah | 1 : N |
| City | Vendor | 1 : N |
| City | Supplier | 1 : N |
| City | Hotel | 1 : N |
| City | Airport | 1 : N |

---

# Delete Rule

City tidak boleh dihapus apabila:

- masih memiliki District
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

Perubahan nama City tidak memengaruhi Relationship.

Seluruh relasi menggunakan city_id sebagai Foreign Key.

---

# AI Relationship

AI menggunakan city_id sebagai referensi utama.

AI tidak menggunakan nama City sebagai referensi utama.

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

City dapat memiliki relasi tambahan dengan:

- Postal Code
- Geographic Coordinate
- Google Place ID
- OpenStreetMap ID
- Climate Zone
- Tourism Zone
- Delivery Zone
- Airport Coverage
- Emergency Service Area

---

# Performance Recommendation

City merupakan Master Data dengan frekuensi perubahan rendah.

Disarankan:

- Cache pada API
- Offline Cache pada Flutter
- Lazy Loading
- Index pada province_id
- Index pada name

---

# Catatan

City merupakan Parent Entity bagi District.

Seluruh Business Module wajib menggunakan city_id sebagai referensi wilayah administratif tingkat kota.