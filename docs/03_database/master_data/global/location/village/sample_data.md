# VILLAGE SAMPLE DATA

Version : 1.1

Status : APPROVED

Last Updated : 2026-08-01

Owner : Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini berisi contoh data (Sample Data) Master Data Village.

Sample Data digunakan sebagai acuan untuk:

- Database Seeder
- Unit Testing
- Integration Testing
- QA Testing
- Demo Environment
- AI Testing

---

# Sample Data

| Country | Province | City | District | Village Code | Village Name | Postal Code | Status |
|----------|----------|------|----------|--------------|--------------|-------------|--------|
| Indonesia | DKI Jakarta | Jakarta Selatan | Setiabudi | STB-KARET-SEMANGGI | Karet Semanggi | 12930 | Active |
| Indonesia | DKI Jakarta | Jakarta Selatan | Tebet | TBT-MENTENG-DALAM | Menteng Dalam | 12870 | Active |
| Indonesia | Jawa Barat | Bandung | Coblong | CBL-DAGO | Dago | 40135 | Active |
| Indonesia | Jawa Barat | Bandung | Coblong | CBL-LEBAK-GEDE | Lebak Gede | 40132 | Active |
| Indonesia | Jawa Barat | Bandung | Sukajadi | SKJ-CIPEDES | Cipedes | 40162 | Active |
| Indonesia | Jawa Tengah | Semarang | Tembalang | TMB-SENDANGMULYO | Sendangmulyo | 50272 | Active |
| Indonesia | Jawa Tengah | Semarang | Banyumanik | BYM-NGESREP | Ngesrep | 50269 | Active |
| Indonesia | DI Yogyakarta | Yogyakarta | Mergangsan | MRG-BRONTOKUSUMAN | Brontokusuman | 55153 | Active |
| Indonesia | Jawa Timur | Surabaya | Gubeng | GBG-AIRLANGGA | Airlangga | 60286 | Active |
| Indonesia | Jawa Timur | Surabaya | Gubeng | GBG-KERTAJAYA | Kertajaya | 60282 | Active |

---

# Sample Lookup

## Berdasarkan Country

```
Indonesia
```

↓

Menampilkan seluruh Province

↓

Seluruh City

↓

Seluruh District

↓

Seluruh Village

---

## Berdasarkan District

```
Coblong
```

↓

Dago

↓

Lebak Gede

---

## Berdasarkan Postal Code

```
40135
```

↓

Dago

---

# API Response Sample

```json
{
  "village_id": "7b55d3af-3b59-48a1-a2b5-55f1454dc3cb",
  "country_id": "country-uuid",
  "province_id": "province-uuid",
  "city_id": "city-uuid",
  "district_id": "district-uuid",
  "village_code": "CBL-DAGO",
  "village_name": "Dago",
  "postal_code": "40135",
  "is_active": true
}
```

---

# Seeder Notes

Sample Data digunakan untuk:

- Development
- QA
- Demo
- AI Testing

Production wajib menggunakan data resmi yang telah diverifikasi.

---

# AI Sample

AI dapat menggunakan Sample Data untuk:

- Intelligent Address Engine
- Geo Search Engine
- Geo Intelligence Engine
- Territory Performance Engine
- Heatmap Simulation
- Dashboard Demo
- AI Recommendation Testing

---

# Canonical Address Sample

```
Country

Indonesia

↓

Province

Jawa Barat

↓

City

Bandung

↓

District

Coblong

↓

Village

Dago

↓

Address

Jl. Ir. H. Juanda No. 50

↓

Postal Code

40135
```

---

# Catatan

Sample Data tidak boleh digunakan sebagai referensi resmi pada Production Environment.

Seluruh data Production harus berasal dari sumber resmi pemerintah atau sumber data yang telah diverifikasi sesuai Geographic Change Management Policy.