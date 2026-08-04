# DESIGN TOKENS

Version : 1.0

Status : APPROVED

Document Code : VDS-003

Category : Design Tokens

Owner : Enterprise Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

Last Updated : 2026-08-04

---

# Tujuan

Design Tokens merupakan representasi teknis dari seluruh keputusan desain pada VENTRA Design System.

Design Tokens menjadi Single Source of Truth (SSOT) untuk seluruh nilai desain yang digunakan oleh Flutter, Web, AI Interface, maupun platform lainnya.

Seluruh komponen wajib menggunakan Design Tokens dan tidak diperbolehkan menggunakan nilai yang ditentukan secara langsung (Hardcoded Values).

---

# Vision

Menyediakan sistem token yang konsisten, reusable, scalable, dan mudah dipelihara untuk seluruh produk VENTRA.

---

# Scope

Design Tokens mencakup:

- Color Tokens
- Typography Tokens
- Spacing Tokens
- Radius Tokens
- Elevation Tokens
- Border Tokens
- Opacity Tokens
- Shadow Tokens
- Icon Tokens
- Motion Tokens
- Duration Tokens
- Breakpoint Tokens
- Z-Index Tokens

---

# Philosophy

Seluruh nilai visual harus direpresentasikan sebagai token.

Perubahan nilai desain hanya dilakukan pada Design Tokens, sehingga seluruh aplikasi akan mengikuti perubahan tersebut secara otomatis.

---

# Token Principles

Design Tokens harus memenuhi prinsip:

- Consistent
- Reusable
- Scalable
- Maintainable
- Platform Independent
- Easy to Extend

---

# Token Hierarchy

Design Tokens dibagi menjadi tiga level.

## Foundation Tokens

Token dasar.

Contoh:

- Primary Blue
- Neutral Gray
- Spacing Base
- Radius Base

---

## Semantic Tokens

Token berdasarkan fungsi.

Contoh:

- Primary Color
- Success Color
- Error Color
- Warning Color
- Surface Color
- Text Primary

---

## Component Tokens

Token khusus komponen.

Contoh:

- Button Background
- Card Radius
- Dialog Shadow
- Navigation Height

---

# Naming Convention

Nama token harus:

- Konsisten.
- Mudah dipahami.
- Tidak bergantung pada platform.
- Tidak menggunakan singkatan yang membingungkan.

Contoh:

```
color.primary

color.success

spacing.md

radius.lg

typography.heading.large
```

---

# Hardcoded Values

Tidak diperbolehkan menggunakan:

```
Color(0xFF123456)

padding: 17

radius: 9

fontSize: 21
```

Seluruh nilai harus berasal dari Design Tokens.

---

# Platform Independence

Design Tokens harus dapat digunakan oleh:

- Flutter
- Web
- Figma
- AI Interface
- Future Platform

---

# Token Categories

VENTRA menggunakan kategori token berikut:

- Colors
- Typography
- Spacing
- Radius
- Border
- Elevation
- Shadow
- Icon Size
- Motion
- Animation Duration
- Breakpoints
- Z-Index

---

# Versioning

Seluruh perubahan Design Tokens wajib:

Review

↓

Architecture Review

↓

Approval

↓

Version Update

↓

Implementation

---

# Relationship

Design Tokens digunakan oleh:

- colors.md
- typography.md
- spacing.md
- grid.md
- radius.md
- elevation.md
- icons.md
- motion.md
- components/
- templates/

---

# Engineering Governance

Design Tokens mengikuti seluruh Engineering Governance VENTRA.

Perubahan token wajib:

- Memenuhi DoR
- Memenuhi DoD
- Mengikuti SSOT
- Melalui Architecture Review
- Memenuhi DCI
- Memenuhi KML
- Lulus Quality Gate

---

# Knowledge Asset

Design Tokens merupakan Knowledge Asset inti yang menjadi dasar seluruh implementasi visual.

Dokumen turunan tidak boleh membuat token baru tanpa melalui proses Architecture Review.

---

# Success Metrics

Design Tokens dinyatakan berhasil apabila:

- Tidak ada Hardcoded Values pada implementasi.
- Seluruh komponen menggunakan Design Tokens.
- Token digunakan secara konsisten di seluruh platform.
- Seluruh perubahan terdokumentasi.
- Seluruh token lulus Quality Gate.

---

# Related Documents

- README.md
- design_philosophy.md
- foundation.md
- colors.md
- typography.md
- spacing.md
- grid.md
- radius.md
- elevation.md
- icons.md
- motion.md

---

# Approval

Design Tokens merupakan standar resmi representasi nilai desain pada VENTRA ERP Platform.

Seluruh implementasi visual wajib menggunakan Design Tokens sebagai Single Source of Truth.