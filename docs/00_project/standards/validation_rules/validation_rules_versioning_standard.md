# VALIDATION RULES VERSIONING STANDARD

Version : 1.0

Status : APPROVED

Document Code : VRS-004

Category : Validation Rules Standard

Owner : Enterprise Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

Last Updated : 2026-08-03

---

# Tujuan

Dokumen ini mendefinisikan standar versioning untuk seluruh dokumen Validation Rules agar perubahan dapat ditelusuri secara historis.

---

# Format Version

Format versi:

Major.Minor

Contoh:

- 1.0
- 1.1
- 1.2
- 2.0

---

# Aturan Perubahan

## Major Version

Digunakan apabila terjadi perubahan besar terhadap konsep atau struktur Validation Rules.

Contoh:

1.0 → 2.0

---

## Minor Version

Digunakan apabila terjadi:

- Penambahan Validation Rule.
- Perbaikan deskripsi.
- Klarifikasi aturan.
- Koreksi kesalahan penulisan.

Contoh:

1.0 → 1.1

---

# Changelog

Setiap perubahan wajib dicatat pada:

changelog.md

Minimal mencakup:

- Tanggal
- Versi
- Ringkasan Perubahan
- Author
- Reviewer

---

# Deprecated

Validation Rules yang sudah tidak digunakan tidak dihapus.

Status diubah menjadi:

Deprecated

---

# Compliance

Seluruh perubahan Validation Rules wajib mengikuti standar versioning ini.

---

# Related Documents

- changelog.md
- validation_rules_documentation_standard.md

---

# Approval

Validation Rules Versioning Standard disetujui sebagai standar resmi ERP Travel Intelligence Platform.