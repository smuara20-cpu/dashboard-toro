# TYPOGRAPHY

Version : 1.0

Status : APPROVED

Document Code : VDS-005

Category : Typography System

Owner : Enterprise Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

Last Updated : 2026-08-04

---

# Tujuan

Dokumen ini mendefinisikan standar tipografi yang digunakan pada seluruh produk VENTRA ERP Platform.

Typography System memastikan seluruh teks memiliki hierarki visual yang konsisten, mudah dibaca, mudah dipahami, dan mendukung pengalaman pengguna pada seluruh platform.

Seluruh implementasi tipografi wajib mengacu pada Design Tokens.

---

# Scope

Typography System mencakup:

- Font Family
- Font Size
- Font Weight
- Line Height
- Letter Spacing
- Text Hierarchy
- Responsive Typography
- Accessibility
- Design Tokens
- Flutter Mapping

---

# Typography Philosophy

Tipografi digunakan untuk menyampaikan informasi secara jelas, terstruktur, dan mudah dipahami.

Pemilihan jenis huruf, ukuran, ketebalan, dan jarak harus membantu pengguna menemukan informasi penting dengan cepat.

Tipografi bukan elemen dekoratif, tetapi alat komunikasi utama antarmuka.

---

# Design Principles

Typography mengikuti prinsip:

- Readability
- Clarity
- Consistency
- Accessibility
- Scalability
- Maintainability

---

# Font Family

VENTRA menggunakan keluarga font resmi yang konsisten pada seluruh platform.

Seluruh implementasi harus menggunakan font yang telah ditetapkan pada Design Tokens.

Penggunaan font di luar standar tidak diperbolehkan tanpa Architecture Review.

---

# Typography Hierarchy

Hierarki tipografi digunakan untuk membedakan tingkat kepentingan informasi.

Kategori utama:

- Display
- Heading
- Title
- Subtitle
- Body
- Caption
- Label
- Overline

Nilai ukuran dan berat huruf dikelola melalui Design Tokens.

---

# Font Weight

Kategori Font Weight:

- Light
- Regular
- Medium
- Semi Bold
- Bold

Pemilihan Font Weight harus konsisten sesuai fungsi.

---

# Line Height

Line Height digunakan untuk meningkatkan kenyamanan membaca.

Nilai Line Height harus disesuaikan dengan kategori teks dan dikelola melalui Design Tokens.

---

# Letter Spacing

Letter Spacing digunakan untuk meningkatkan keterbacaan.

Penggunaan Letter Spacing harus konsisten dan tidak berlebihan.

---

# Responsive Typography

Typography harus tetap nyaman dibaca pada:

- Mobile
- Tablet
- Desktop
- Web

Perubahan ukuran layar tidak boleh menghilangkan hierarki informasi.

---

# Accessibility

Typography harus memenuhi prinsip:

- Ukuran teks mudah dibaca.
- Kontras memenuhi standar WCAG.
- Tidak mengandalkan warna sebagai satu-satunya pembeda informasi.
- Mendukung pembesaran teks tanpa merusak tata letak.

---

# Typography Tokens

Seluruh nilai tipografi dikelola melalui Design Tokens.

Kategori token meliputi:

- Font Family
- Font Size
- Font Weight
- Line Height
- Letter Spacing

Implementasi teknis dilakukan melalui Flutter Theme dan platform lain dengan tetap mengacu pada Design Tokens.

---

# Flutter Mapping

Typography digunakan melalui Theme dan Text Style resmi VENTRA.

Seluruh Text Style harus berasal dari Typography Tokens.

Penggunaan nilai ukuran atau berat huruf secara langsung (Hardcoded Value) tidak diperbolehkan.

---

# Engineering Governance

Typography mengikuti:

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

Typography merupakan Knowledge Asset resmi yang menjadi acuan seluruh implementasi teks pada VENTRA ERP Platform.

Seluruh perubahan Typography wajib melalui Architecture Review.

---

# Success Metrics

Typography dianggap berhasil apabila:

- Seluruh aplikasi menggunakan Typography System yang sama.
- Tidak ada Hardcoded Typography.
- Hierarki informasi konsisten.
- Mendukung seluruh platform.
- Memenuhi standar Accessibility.

---

# Related Documents

- README.md
- design_philosophy.md
- foundation.md
- design_tokens.md
- colors.md
- spacing.md
- accessibility.md

---

# Approval

Typography System merupakan standar resmi tipografi pada seluruh produk VENTRA ERP Platform.

Seluruh implementasi tipografi wajib mengacu pada dokumen ini.