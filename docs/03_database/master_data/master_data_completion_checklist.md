# MASTER DATA COMPLETION CHECKLIST

Version : 1.0

---

# Tujuan

Dokumen ini digunakan untuk memantau progres penyelesaian seluruh Master Data pada ERP Travel AI Platform.

Checklist ini menjadi acuan Architecture Team, Database Engineer, Backend Developer, Flutter Developer, AI Engineer, QA, dan Project Manager untuk memastikan setiap Master Data telah memenuhi Master Data Development Standard (MDS).

Dokumen ini juga berfungsi sebagai alat kontrol kualitas (Quality Control) agar tidak ada dokumen yang terlewat sebelum masuk ke tahap implementasi.

---

# Status

| Simbol | Arti |
|---------|------|
| ⬜ | Belum Dimulai |
| 🟨 | Sedang Dikerjakan |
| ✅ | Selesai |
| 🔄 | Direvisi |
| ⛔ | Ditunda |
| ❌ | Dibatalkan |

---

# Checklist Dokumen

Setiap Master Data wajib memiliki dokumen berikut.

| Dokumen | Wajib |
|----------|--------|
| business_rules.md | ✅ |
| validation_rules.md | ✅ |
| data_dictionary.md | ✅ |
| erd.md | ✅ |
| sample_data.md | ✅ |
| business_scenarios.md | ✅ |
| security_review.md | ✅ |
| notes.md | ✅ |
| review.md | ✅ |
| changelog.md | ✅ |

---

# Progress Global Master Data

## Global Location

| Master Data | BR | VR | DD | ERD | SD | BS | SR | Notes | Review | Change | Status |
|-------------|----|----|----|-----|----|----|----|-------|--------|--------|--------|
| Country | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Province | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| City | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| District | 🟨 | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | 🟨 |
| Village | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

---

## Global Reference

| Master Data | BR | VR | DD | ERD | SD | BS | SR | Notes | Review | Change | Status |
|-------------|----|----|----|-----|----|----|----|-------|--------|--------|--------|
| Currency | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Language | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Timezone | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Religion | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Nationality | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

---

# Progress System Master Data

## Travel

| Master Data | BR | VR | DD | ERD | SD | BS | SR | Notes | Review | Change | Status |
|-------------|----|----|----|-----|----|----|----|-------|--------|--------|--------|
| Airline | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Airport | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Visa Type | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Hotel Category | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Room Type | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

---

## Document

| Master Data | BR | VR | DD | ERD | SD | BS | SR | Notes | Review | Change | Status |
|-------------|----|----|----|-----|----|----|----|-------|--------|--------|--------|
| Passport Type | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Identity Type | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

---

# Progress Company Master Data

## Finance

| Master Data | BR | VR | DD | ERD | SD | BS | SR | Notes | Review | Change | Status |
|-------------|----|----|----|-----|----|----|----|-------|--------|--------|--------|
| Bank | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Bank Branch | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Payment Method | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Payment Channel | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

---

## CRM

| Master Data | BR | VR | DD | ERD | SD | BS | SR | Notes | Review | Change | Status |
|-------------|----|----|----|-----|----|----|----|-------|--------|--------|--------|
| Lead Source | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Customer Category | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Customer Status | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

---

## Organization

| Master Data | BR | VR | DD | ERD | SD | BS | SR | Notes | Review | Change | Status |
|-------------|----|----|----|-----|----|----|----|-------|--------|--------|--------|
| Department | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Division | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Position | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Job Title | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Employment Type | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

---

## Travel

| Master Data | BR | VR | DD | ERD | SD | BS | SR | Notes | Review | Change | Status |
|-------------|----|----|----|-----|----|----|----|-------|--------|--------|--------|
| Package Category | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Package Type | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

---

## System

| Master Data | BR | VR | DD | ERD | SD | BS | SR | Notes | Review | Change | Status |
|-------------|----|----|----|-----|----|----|----|-------|--------|--------|--------|
| Approval Level | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Notification Channel | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Document Type | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Attachment Type | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

---

# Progress Summary

| Kategori | Total | Selesai | Progress |
|----------|-------|----------|----------|
| Global Location | 5 | 3 | 60% |
| Global Reference | 5 | 0 | 0% |
| System Travel | 5 | 0 | 0% |
| System Document | 2 | 0 | 0% |
| Company Finance | 4 | 0 | 0% |
| Company CRM | 3 | 0 | 0% |
| Company Organization | 5 | 0 | 0% |
| Company Travel | 2 | 0 | 0% |
| Company System | 4 | 0 | 0% |

---

# Review Rules

Master Data hanya dapat dinyatakan COMPLETE apabila:

- Seluruh dokumen wajib telah selesai.
- Review berstatus APPROVED.
- Tidak ada Business Rule yang bertentangan.
- Seluruh relasi telah diverifikasi.
- Siap digunakan pada Database.
- Siap digunakan pada API.
- Siap digunakan pada Flutter.
- Siap digunakan pada AI.
- Siap digunakan pada Business Module.

---

# Catatan

Checklist ini digunakan sebagai alat monitoring utama selama fase pengembangan Master Data.

Perubahan status hanya dapat dilakukan setelah melalui proses Review dan Architecture Approval.

Dokumen ini harus selalu diperbarui setiap kali terdapat perubahan status Master Data.