# RADIUS

Version : 1.0

Status : APPROVED

Document Code : VDS-008

Category : Radius System

Owner : Enterprise Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

Last Updated : 2026-08-05

---

# Tujuan

Dokumen ini mendefinisikan standar penggunaan Radius pada seluruh produk VENTRA ERP Platform.

Radius digunakan untuk menjaga konsistensi bentuk visual seluruh komponen antarmuka.

---

# Scope

Radius System mencakup:

- Button
- Card
- Dialog
- Bottom Sheet
- Input Field
- Chip
- Avatar
- Image
- Container

---

# Radius Philosophy

Radius memberikan karakter visual yang konsisten dan meningkatkan kenyamanan pengguna.

Radius bukan dekorasi, tetapi bagian dari identitas desain.

---

# Design Principles

Radius mengikuti prinsip:

- Consistency
- Simplicity
- Maintainability
- Reusability
- Scalability

---

# Radius Categories

Kategori Radius:

- None
- Small
- Medium
- Large
- Extra Large
- Full

Seluruh nilai Radius dikelola melalui Design Tokens.

---

# Flutter Mapping

Seluruh Radius digunakan melalui Theme dan Design Tokens.

Implementasi teknis dilakukan pada Flutter Theme tanpa menggunakan nilai hardcoded.

---

# Anti Patterns

Implementasi berikut tidak diperbolehkan:

- Menggunakan radius hardcoded.
- Menggunakan radius berbeda pada komponen yang sejenis.
- Menggunakan radius berlebihan sehingga menghilangkan konsistensi visual.
- Mengubah Radius Token tanpa Architecture Review.

---

# Engineering Governance

Radius System mengikuti:

- Design Philosophy
- Foundation
- Design Tokens
- SSOT
- DoR
- DoD
- DCI
- KML
- Quality Gates

---

# Knowledge Asset

Radius System merupakan Knowledge Asset resmi VENTRA ERP Platform.

---

# Success Metrics

Radius System dianggap berhasil apabila:

- Seluruh komponen menggunakan Radius yang konsisten.
- Tidak ada Radius Hardcoded.
- Seluruh Radius berasal dari Design Tokens.

---

# Related Documents

- foundation.md
- design_tokens.md
- spacing.md
- colors.md

---

# Approval

Radius System merupakan standar resmi penggunaan Radius pada seluruh produk VENTRA ERP Platform.