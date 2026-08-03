# DISTRICT SAMPLE DATA

Version : 1.0

---

# Tujuan

Dokumen ini berisi contoh data (Sample Data) Master Data District.

Sample Data digunakan sebagai acuan untuk:

- Database Seeder
- Unit Testing
- Integration Testing
- QA Testing
- Demo Environment
- AI Testing

---

# Sample Data

| Country | Province | City | District Code | District Name | Postal Code | Status |
|----------|----------|------|---------------|---------------|-------------|--------|
| Indonesia | DKI Jakarta | Jakarta Selatan | JKTSEL-KEBAYORAN-BARU | Kebayoran Baru | 12110 | Active |
| Indonesia | DKI Jakarta | Jakarta Selatan | JKTSEL-TEBET | Tebet | 12810 | Active |
| Indonesia | DKI Jakarta | Jakarta Selatan | JKTSEL-PASAR-MINGGU | Pasar Minggu | 12520 | Active |
| Indonesia | Jawa Barat | Bandung | BDG-COBLONG | Coblong | 40132 | Active |
| Indonesia | Jawa Barat | Bandung | BDG-SUKAJADI | Sukajadi | 40162 | Active |
| Indonesia | Jawa Barat | Bandung | BDG-CIBEUNYING-KALER | Cibeunying Kaler | 40122 | Active |
| Indonesia | Jawa Tengah | Semarang | SMG-TEMBALANG | Tembalang | 50275 | Active |
| Indonesia | Jawa Tengah | Semarang | SMG-BANYUMANIK | Banyumanik | 50264 | Active |
| Indonesia | DI Yogyakarta | Yogyakarta | YK-MERGANGSAN | Mergangsan | 55153 | Active |
| Indonesia | Jawa Timur | Surabaya | SBY-GUBENG | Gubeng | 60281 | Active |

---

# Sample Lookup

## Berdasarkan Country

```
Indonesia
```

Hasil

```
Seluruh Province

↓

Seluruh City

↓

District
```

---

## Berdasarkan Province

```
Jawa Barat
```

Hasil

```
Bandung

↓

Coblong

↓

Sukajadi

↓

Cibeunying Kaler
```

---

## Berdasarkan City

```
Bandung
```

Hasil

```
Coblong

Sukajadi

Cibeunying Kaler
```

---

# API Response Sample

```json
{
  "district_id": "9c8f4b2d-81f1-4d8b-a9d8-9b6d87d14d5d",
  "country_id": "country-uuid",
  "province_id": "province-uuid",
  "city_id": "city-uuid",
  "district_code": "BDG-COBLONG",
  "district_name": "Coblong",
  "postal_code": "40132",
  "is_active": true
}
```

---

# Seeder Notes

Sample Data hanya digunakan pada:

- Development
- Testing
- Demo

Production wajib menggunakan data resmi yang telah diverifikasi.

---

# AI Sample

AI dapat menggunakan Sample Data untuk:

- Smart Lookup
- Geo Intelligence Testing
- Territory Performance Simulation
- Dashboard Demo
- AI Recommendation Testing

---

# Catatan

Sample Data tidak boleh digunakan sebagai data referensi resmi pada Production Environment.

Seluruh data Production harus berasal dari sumber resmi dan telah melalui proses validasi.