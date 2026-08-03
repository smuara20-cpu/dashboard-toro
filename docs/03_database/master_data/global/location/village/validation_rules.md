# VILLAGE VALIDATION RULES

Version : 1.1

Status : APPROVED

Last Updated : 2026-08-01

Owner : Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan seluruh Validation Rules untuk Master Data Village.

Validation Rules memastikan kualitas data, konsistensi hierarki lokasi, integritas referensi, dan kesiapan data untuk Database, API, Flutter, AI, Dashboard, serta Business Module.

---

# Validation Objective

Validation bertujuan untuk:

- Menjaga kualitas Master Data.
- Menjamin Hierarchical Integrity.
- Mendukung Canonical Address Policy.
- Mendukung Intelligent Address Engine.
- Mencegah Duplicate Data.
- Menjamin AI menggunakan data yang valid.

---

# Validation Rules

## VR-001

Village Name wajib diisi.

Field

village_name

Status

Required

Error Message

Village Name is required.

---

## VR-002

District wajib dipilih.

Field

district_id

Status

Required

Error Message

District must be selected.

---

## VR-003

City wajib sesuai dengan District.

Jika tidak sesuai,

proses penyimpanan dibatalkan.

---

## VR-004

Province wajib sesuai dengan City.

Jika tidak sesuai,

proses penyimpanan dibatalkan.

---

## VR-005

Country wajib sesuai dengan Province.

Jika tidak sesuai,

proses penyimpanan dibatalkan.

---

## VR-006

Village tidak boleh duplikat dalam District yang sama.

Kombinasi berikut harus unik.

district_id

+

village_name

---

## VR-007

Panjang Village Name.

Minimal

2 karakter.

Maksimal

150 karakter.

---

## VR-008

Village Name tidak boleh mengandung:

- HTML Tag
- JavaScript
- SQL Injection
- Karakter kontrol

---

## VR-009

Postal Code bersifat opsional.

Namun apabila diisi,

harus mengikuti format negara yang bersangkutan.

---

## VR-010

Latitude dan Longitude bersifat opsional.

Namun apabila diisi,

harus berada dalam rentang yang valid.

Latitude

-90 sampai 90

Longitude

-180 sampai 180

---

## VR-011

Village harus mendukung Smart Lookup berdasarkan:

- Village
- District
- City
- Province
- Country
- Postal Code

---

## VR-012

Canonical Address wajib mengikuti struktur:

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

## VR-013

Seluruh perubahan wajib dicatat pada Audit Log.

Minimal mencatat:

- User
- Role
- Timestamp
- Before
- After
- Reason

---

## VR-014

Village yang telah digunakan oleh transaksi tidak boleh dihapus.

Status hanya dapat diubah menjadi:

Inactive

---

## VR-015

Seluruh Validation Rules wajib diterapkan secara konsisten pada:

- Database Constraint
- REST API
- Flutter Form
- Import Data
- Batch Processing

Tidak diperbolehkan terdapat perbedaan validasi antar layer.

---

# Validation Summary

| Item | Status |
|------|--------|
| Required Field | ✅ |
| Hierarchical Validation | ✅ |
| Duplicate Validation | ✅ |
| Canonical Address Validation | ✅ |
| Smart Lookup Validation | ✅ |
| Audit Validation | ✅ |
| Soft Delete Validation | ✅ |

---

# Architecture Reference

Validation Rules mengacu pada:

- AD-033 — Hierarchical Foreign Key Policy
- AD-038 — Security by Design Policy
- AD-039 — Geographic Change Management Policy
- AD-040 — Canonical Address Policy

---

# Catatan

Seluruh Validation Rules wajib diterapkan secara identik pada seluruh komponen ERP Travel AI Platform.

Perubahan Validation Rules hanya dapat dilakukan melalui Architecture Review dan Architecture Decision (AD).