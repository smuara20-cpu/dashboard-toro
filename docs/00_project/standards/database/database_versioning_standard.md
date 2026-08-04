# DATABASE VERSIONING STANDARD

Version : 1.0

Status : APPROVED

Document Code : DBS-004

Category : Database Standard

Owner : Enterprise Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

Last Updated : 2026-08-03

---

# Tujuan

Menentukan standar versioning database.

---

# Format Version

Major.Minor

Contoh:

- 1.0
- 1.1
- 2.0

---

# Major Version

Digunakan apabila terdapat perubahan struktur database yang bersifat breaking change.

---

# Minor Version

Digunakan apabila terdapat penambahan tabel, kolom, index, atau constraint tanpa mengubah kompatibilitas.

---

# Migration

Seluruh perubahan wajib disertai migration script.

---

# Changelog

Seluruh perubahan dicatat pada changelog.md.

---

# Deprecated

Versi lama tidak dihapus.

Status diubah menjadi Deprecated.

---

# Approval

Database Versioning Standard disetujui sebagai standar resmi ERP Travel Intelligence Platform.