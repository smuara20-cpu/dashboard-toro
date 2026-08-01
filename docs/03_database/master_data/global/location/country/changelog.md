# COUNTRY CHANGELOG

Version : 1.0

---

# Tujuan

Dokumen ini mencatat seluruh perubahan yang dilakukan terhadap Master Data Country.

Perubahan meliputi:

- Business Rules
- Validation Rules
- Data Dictionary
- ERD
- Security
- Struktur
- Future Expansion

Dokumen ini menjadi referensi resmi riwayat perubahan Master Data Country.

---

# Version History

| Version | Date | Author | Status | Description |
|----------|------|--------|--------|-------------|
| 1.0 | YYYY-MM-DD | Solution Architect | Released | Initial Release |

---

# Version 1.0

Status

Released

---

## Dokumen

Telah dibuat:

- business_rules.md
- validation_rules.md
- data_dictionary.md
- erd.md
- sample_data.md
- business_scenarios.md
- security_review.md
- notes.md
- review.md

---

## Business Rules

Menetapkan Country sebagai Global Master.

---

## Validation

Menambahkan validasi:

- ISO Alpha-2
- ISO Alpha-3
- Country Name
- Soft Delete

---

## Data Dictionary

Menetapkan struktur tabel Country.

---

## ERD

Menetapkan Country sebagai Root Entity pada Master Data Location.

---

## Security

Menetapkan:

- Read Only untuk Company
- Platform Administrator sebagai pengelola
- Audit Log
- Soft Delete

---

## AI

Menetapkan Country sebagai Knowledge Reference.

AI menggunakan country_id.

---

## Future Expansion

Disiapkan untuk mendukung:

- Embassy
- Currency
- Timezone
- Public Holiday
- Prayer Time
- Visa Requirement
- Travel Advisory
- Country Profile

---

# Change Policy

Seluruh perubahan wajib:

- melalui Architecture Review
- terdokumentasi
- memiliki nomor versi
- memiliki tanggal perubahan
- memiliki penanggung jawab

---

# Semantic Version

Format:

Major.Minor.Patch

Contoh

1.0.0

Perubahan besar.

---

1.1.0

Penambahan fitur.

---

1.1.1

Perbaikan kecil.

---

# Review History

| Version | Reviewer | Status |
|----------|----------|--------|
| 1.0 | Solution Architect | Approved |

---

# Catatan

Country merupakan Master Data pertama yang menjadi template resmi ERP Travel AI Platform.

Seluruh Master Data berikutnya mengikuti standar dokumentasi Country.