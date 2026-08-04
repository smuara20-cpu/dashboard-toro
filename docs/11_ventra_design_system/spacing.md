# SPACING

Version : 1.0

Status : APPROVED

Document Code : VDS-006

Category : Spacing System

Owner : Enterprise Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

Last Updated : 2026-08-04

---

# Tujuan

Dokumen ini mendefinisikan standar penggunaan spacing pada seluruh produk VENTRA ERP Platform.

Spacing digunakan untuk menciptakan tata letak yang konsisten, mudah dibaca, nyaman digunakan, dan memiliki hierarki visual yang jelas.

Seluruh implementasi spacing wajib menggunakan Design Tokens.

---

# Scope

Spacing System mencakup:

- Margin
- Padding
- Gap
- Section Spacing
- Layout Spacing
- Component Spacing
- Responsive Spacing
- Design Tokens
- Flutter Mapping

---

# Spacing Philosophy

Spacing bukan ruang kosong.

Spacing adalah alat untuk mengelompokkan informasi, mengurangi kepadatan visual, dan meningkatkan keterbacaan.

Penggunaan spacing yang konsisten membuat antarmuka lebih profesional dan mudah dipahami.

---

# Design Principles

Spacing mengikuti prinsip:

- Consistency
- Simplicity
- Readability
- Scalability
- Maintainability

---

# Spacing Categories

Kategori spacing meliputi:

- Extra Small (XS)
- Small (S)
- Medium (M)
- Large (L)
- Extra Large (XL)
- Double Extra Large (2XL)

Nilai spacing dikelola melalui Design Tokens.

---

# Margin

Margin digunakan untuk memberikan jarak antar komponen.

Margin tidak boleh ditentukan menggunakan nilai hardcoded.

---

# Padding

Padding digunakan untuk memberikan ruang di dalam komponen.

Padding harus mengikuti standar Design Tokens.

---

# Gap

Gap digunakan untuk mengatur jarak antar item dalam layout seperti:

- Row
- Column
- Grid
- List

---

# Section Spacing

Section digunakan untuk memisahkan kelompok informasi.

Setiap section harus memiliki jarak yang konsisten.

---

# Responsive Spacing

Spacing harus dapat menyesuaikan berbagai ukuran layar:

- Mobile
- Tablet
- Desktop
- Web

Perubahan ukuran layar tidak boleh menghilangkan ritme visual.

---

# Design Tokens

Seluruh nilai spacing berasal dari Design Tokens.

Kategori token meliputi:

- spacing.xs
- spacing.s
- spacing.m
- spacing.l
- spacing.xl
- spacing.2xl

Nilai detail dikelola melalui token resmi.

---

# Flutter Mapping

Spacing diimplementasikan melalui Design Tokens.

Contoh penggunaan:

- Padding
- Margin
- SizedBox
- Gap
- Sliver Padding

Tidak diperbolehkan menggunakan nilai spacing secara langsung.

---

# Anti Patterns

Implementasi berikut tidak diperbolehkan:

- Menggunakan hardcoded spacing (misalnya `padding: 17`).
- Menggunakan Margin atau Padding di luar Design Tokens.
- Menggunakan spacing berbeda untuk komponen yang memiliki fungsi sama.
- Menggunakan spacing terlalu rapat sehingga mengurangi keterbacaan.
- Menggunakan spacing terlalu besar sehingga memutus alur visual.
- Menghilangkan White Space yang diperlukan.
- Mengubah Spacing Token tanpa melalui Architecture Review.

# Engineering Governance

Spacing mengikuti:

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

Spacing merupakan Knowledge Asset resmi yang menjadi acuan seluruh pengaturan jarak pada VENTRA ERP Platform.

Seluruh perubahan spacing wajib melalui Architecture Review.

---

# Success Metrics

Spacing dianggap berhasil apabila:

- Seluruh aplikasi menggunakan spacing yang konsisten.
- Tidak ada hardcoded spacing.
- Layout mudah dibaca.
- White space terjaga.
- Mendukung seluruh platform.

---

# Related Documents

- README.md
- design_philosophy.md
- foundation.md
- design_tokens.md
- typography.md
- grid.md
- radius.md

---

# Approval

Spacing System merupakan standar resmi pengaturan jarak pada seluruh produk VENTRA ERP Platform.

Seluruh implementasi spacing wajib mengacu pada dokumen ini.