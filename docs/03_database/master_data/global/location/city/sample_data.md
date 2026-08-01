# CITY SAMPLE DATA

Version : 1.0

---

# Tujuan

Dokumen ini berisi contoh data City sebagai referensi resmi untuk:

- Database Seeder
- Development
- Testing
- Demo
- API
- AI
- Quality Assurance

Sample Data disusun menggunakan contoh dari beberapa negara untuk memastikan desain Master Data bersifat internasional.

---

# Struktur Sample

| Country | Province | City Code | City | City Type | Capital | Status |
|----------|----------|-----------|------|-----------|---------|--------|

---

# Indonesia

| Country | Province | City Code | City | City Type | Capital | Status |
|----------|----------|-----------|------|-----------|---------|--------|
| Indonesia | DKI Jakarta | JKT | Jakarta | CITY | Ya | Active |
| Indonesia | Jawa Barat | BDG | Bandung | CITY | Ya | Active |
| Indonesia | Jawa Barat | BGR | Bogor | CITY | Tidak | Active |
| Indonesia | Jawa Barat | BKS | Bekasi | CITY | Tidak | Active |
| Indonesia | Jawa Barat | KBB | Bandung Barat | REGENCY | Tidak | Active |
| Indonesia | Jawa Timur | SBY | Surabaya | CITY | Ya | Active |
| Indonesia | Bali | DPS | Denpasar | CITY | Ya | Active |

---

# Saudi Arabia

| Country | Province | City Code | City | City Type | Capital | Status |
|----------|----------|-----------|------|-----------|---------|--------|
| Saudi Arabia | Makkah Region | MKK | Makkah | CITY | Ya | Active |
| Saudi Arabia | Al Madinah Region | MED | Madinah | CITY | Ya | Active |
| Saudi Arabia | Riyadh Region | RUH | Riyadh | CITY | Ya | Active |
| Saudi Arabia | Makkah Region | JED | Jeddah | CITY | Tidak | Active |

---

# Japan

| Country | Province | City Code | City | City Type | Capital | Status |
|----------|----------|-----------|------|-----------|---------|--------|
| Japan | Tokyo | TYO | Tokyo | METROPOLITAN | Ya | Active |
| Japan | Osaka | OSA | Osaka | CITY | Ya | Active |
| Japan | Kyoto | KYO | Kyoto | CITY | Ya | Active |
| Japan | Aichi | NGO | Nagoya | CITY | Ya | Active |

---

# Australia

| Country | Province | City Code | City | City Type | Capital | Status |
|----------|----------|-----------|------|-----------|---------|--------|
| Australia | New South Wales | SYD | Sydney | CITY | Ya | Active |
| Australia | Victoria | MEL | Melbourne | CITY | Ya | Active |
| Australia | Queensland | BNE | Brisbane | CITY | Ya | Active |

---

# Malaysia

| Country | Province | City Code | City | City Type | Capital | Status |
|----------|----------|-----------|------|-----------|---------|--------|
| Malaysia | Selangor | PJY | Petaling Jaya | CITY | Tidak | Active |
| Malaysia | Kuala Lumpur | KUL | Kuala Lumpur | FEDERAL_TERRITORY | Ya | Active |
| Malaysia | Johor | JHB | Johor Bahru | CITY | Ya | Active |

---

# Standar Penulisan

City menggunakan nama resmi yang berlaku pada negara masing-masing.

City Code mengikuti standar resmi apabila tersedia.

City Type mengikuti klasifikasi administratif negara terkait.

---

# Penggunaan

Sample Data digunakan oleh:

- PostgreSQL Seeder
- Supabase Seeder
- Unit Test
- Integration Test
- Flutter Development
- API Development
- AI Training Dataset

---

# Import Rule

Import Data wajib menggunakan template resmi ERP.

Data yang gagal validasi tidak boleh disimpan.

---

# Future Expansion

Sample Data dapat dikembangkan dengan:

- Latitude
- Longitude
- Google Place ID
- OpenStreetMap ID
- Population
- Postal Code
- Timezone
- Climate Zone

---

# Catatan

Sample Data digunakan sebagai referensi resmi selama proses pengembangan.

Implementasi Production menggunakan data Master Data yang telah diverifikasi.