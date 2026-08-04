# COLORS

Version : 1.0

Status : APPROVED

Document Code : VDS-004

Category : Color System

Owner : Enterprise Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

Last Updated : 2026-08-04

---

# Tujuan

Dokumen ini mendefinisikan standar penggunaan warna pada seluruh produk VENTRA ERP Platform.

Seluruh warna harus digunakan secara konsisten melalui Design Tokens dan tidak diperbolehkan menggunakan nilai warna secara langsung (Hardcoded Color).

---

# Scope

Color System mencakup:

- Brand Colors
- Semantic Colors
- Neutral Colors
- Surface Colors
- Background Colors
- Text Colors
- Border Colors
- Status Colors
- Chart Colors
- Dark Mode
- Accessibility

---

# Color Philosophy

Warna digunakan untuk membantu pengguna memahami informasi, memberikan penekanan visual, dan mempercepat pengambilan keputusan.

Warna bukan sekadar dekorasi.

---

# Design Principles

Color System mengikuti prinsip:

- Consistency
- Accessibility
- Simplicity
- Maintainability
- Scalability

---

# Brand Colors

Brand Colors merupakan identitas visual utama VENTRA.

Kategori:

- Primary
- Secondary
- Accent

Nilai warna dikelola melalui Design Tokens.

---

# Semantic Colors

Semantic Color digunakan berdasarkan makna.

Kategori:

- Primary
- Secondary
- Success
- Warning
- Error
- Information
- Disabled

Semantic Color tidak boleh digunakan di luar fungsi yang telah ditentukan.

---

# Neutral Colors

Neutral Color digunakan untuk:

- Background
- Border
- Divider
- Surface
- Text
- Icon

Kategori:

- White
- Black
- Gray Scale

---

# Surface Colors

Surface digunakan untuk:

- Card
- Dialog
- Sheet
- Drawer
- Dashboard Widget

Surface harus memiliki kontras yang cukup terhadap Background.

---

# Background Colors

Background terdiri dari:

- Primary Background
- Secondary Background
- Page Background

Background tidak boleh mengurangi keterbacaan.

---

# Text Colors

Kategori:

- Primary Text
- Secondary Text
- Disabled Text
- Inverse Text
- Link Text

Seluruh teks wajib memenuhi standar kontras.

---

# Border Colors

Border digunakan untuk:

- Input
- Card
- Divider
- Table
- Dialog

Border tidak boleh lebih dominan daripada konten.

---

# Status Colors

Status menggunakan warna yang konsisten.

Kategori:

- Success
- Warning
- Error
- Information

Penggunaan status harus selalu disertai ikon atau teks, tidak hanya mengandalkan warna.

---

# Chart Colors

Chart menggunakan palet warna yang:

- Konsisten
- Mudah dibedakan
- Ramah terhadap pengguna dengan gangguan penglihatan warna

---

# Dark Mode

Seluruh Color System harus mendukung:

- Light Theme
- Dark Theme

Perubahan tema tidak boleh mengubah makna Semantic Color.

---

# Accessibility

Color System harus memenuhi:

- WCAG Contrast Ratio
- Readability
- Color Blind Friendly
- High Contrast Mode Support

---

# Flutter Mapping

Seluruh warna digunakan melalui Theme dan Design Tokens.

Contoh kategori implementasi:

- Primary Color
- Surface Color
- Error Color
- Outline Color
- Text Color
- Icon Color

Nilai implementasi teknis didefinisikan pada layer Flutter, tetapi harus mengacu pada Design Tokens.

---

# Anti Patterns

Implementasi berikut tidak diperbolehkan:

- Menggunakan hardcoded color (misalnya `Color(0xFF2196F3)`).
- Menggunakan warna di luar Design Tokens.
- Menggunakan Semantic Color tidak sesuai fungsinya.
- Menggunakan Brand Color sebagai Status Color.
- Menggunakan warna yang tidak memenuhi standar kontras (WCAG).
- Menggunakan terlalu banyak warna pada satu halaman.
- Menggunakan warna sebagai satu-satunya indikator status tanpa ikon atau teks.
- Mengubah Color Token tanpa melalui Architecture Review.

# Engineering Governance

Color System mengikuti:

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

Color System merupakan Knowledge Asset yang menjadi acuan seluruh implementasi warna pada VENTRA ERP Platform.

Seluruh perubahan warna wajib melalui Architecture Review.

---

# Success Metrics

Color System dianggap berhasil apabila:

- Seluruh aplikasi menggunakan Color System yang sama.
- Tidak ada Hardcoded Color.
- Seluruh Semantic Color digunakan secara konsisten.
- Mendukung Light dan Dark Theme.
- Memenuhi standar Accessibility.

---

# Related Documents

- README.md
- design_philosophy.md
- foundation.md
- design_tokens.md
- typography.md
- spacing.md
- accessibility.md

---

# Approval

Color System merupakan standar resmi penggunaan warna pada seluruh produk VENTRA ERP Platform.