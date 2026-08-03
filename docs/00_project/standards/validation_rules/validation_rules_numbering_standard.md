# VALIDATION RULES NUMBERING STANDARD

Version : 1.0

Status : APPROVED

Document Code : VRS-002

Category : Validation Rules Standard

Owner : Enterprise Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

Last Updated : 2026-08-03

---

# Tujuan

Dokumen ini mendefinisikan standar penomoran Validation Rules agar seluruh aturan validasi memiliki identitas yang unik, konsisten, mudah dicari, dan mudah direferensikan.

---

# Format Penomoran

Validation Rule menggunakan format:

VR-XXX

Contoh:

- VR-001
- VR-002
- VR-003

Nomor harus unik dalam satu dokumen Validation Rules.

---

# Penulisan

Setiap Validation Rule menggunakan format:

## VR-001

Nama Validation

Deskripsi Validation.

---

Contoh:

## VR-001

Company Name Mandatory

Company Name wajib diisi.

---

## VR-002

Company Code Unique

Company Code tidak boleh sama dengan Company lain.

---

## VR-003

Email Format

Email harus menggunakan format email yang valid.

---

# Penambahan Validation

Validation baru ditambahkan menggunakan nomor berikutnya.

Contoh:

VR-001

VR-002

VR-003

VR-004

Tidak diperbolehkan menggunakan:

VR-001A

VR-001B

VR-002.1

---

# Penghapusan Validation

Nomor Validation Rule yang pernah digunakan tidak boleh digunakan kembali.

Apabila Validation dihapus, nomor tetap dianggap pernah digunakan.

---

# Referensi

Validation Rule dapat direferensikan pada dokumen lain menggunakan kode:

VR-004

VR-018

VR-125

---

# Compliance

Seluruh Validation Rules wajib mengikuti standar penomoran ini.

---

# Related Documents

- validation_rules_documentation_standard.md
- validation_rules_review_standard.md
- validation_rules_versioning_standard.md

---

# Approval

Validation Rules Numbering Standard disetujui sebagai standar resmi ERP Travel Intelligence Platform.