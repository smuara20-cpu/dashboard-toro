# ACCESSIBILITY

Version : 1.0

Status : APPROVED

Document Code : VDS-012

Category : Accessibility

Owner : Enterprise Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

Last Updated : 2026-08-05

---

# Tujuan

Dokumen ini mendefinisikan standar Accessibility pada seluruh produk VENTRA ERP Platform.

Accessibility memastikan seluruh aplikasi dapat digunakan oleh berbagai kelompok pengguna, termasuk pengguna lanjut usia (lansia), pengguna dengan keterbatasan penglihatan, pendengaran, maupun kemampuan motorik.

Accessibility merupakan bagian dari kualitas produk, bukan fitur tambahan.

---

# Scope

Accessibility mencakup:

- Readability
- Color Contrast
- Keyboard Navigation
- Focus Management
- Screen Reader
- Touch Target
- Responsive Layout
- Text Scaling
- Error Feedback
- Accessibility Testing

---

# Accessibility Philosophy

VENTRA percaya bahwa seluruh pengguna memiliki hak yang sama untuk menggunakan aplikasi secara nyaman.

Setiap fitur harus dirancang agar mudah dipahami, mudah dioperasikan, dan mudah diakses.

---

# Design Principles

Accessibility mengikuti prinsip:

- Perceivable
- Operable
- Understandable
- Robust
- Consistency
- Inclusiveness

---

# Readability

Seluruh teks harus:

- Mudah dibaca.
- Memiliki ukuran yang memadai.
- Menggunakan Typography System resmi.
- Memiliki jarak antar baris yang nyaman.

---

# Color Contrast

Seluruh kombinasi warna harus memenuhi standar kontras yang memadai.

Warna tidak boleh menjadi satu-satunya indikator informasi.

---

# Keyboard Navigation

Seluruh fitur yang relevan harus dapat dioperasikan menggunakan keyboard.

Urutan fokus harus logis dan konsisten.

---

# Focus Management

Komponen interaktif harus memiliki indikator fokus yang jelas.

Perpindahan fokus tidak boleh membingungkan pengguna.

---

# Screen Reader

Komponen harus memiliki label yang dapat dibaca oleh Screen Reader.

Ikon tanpa teks harus memiliki deskripsi yang sesuai.

---

# Touch Target

Ukuran area sentuh harus cukup besar agar mudah digunakan pada perangkat layar sentuh.

---

# Text Scaling

Aplikasi harus tetap dapat digunakan ketika pengguna memperbesar ukuran teks.

Layout tidak boleh rusak akibat perubahan skala teks.

---

# Error Feedback

Pesan kesalahan harus:

- Mudah dipahami.
- Menjelaskan penyebab masalah.
- Memberikan solusi apabila memungkinkan.

---

# Flutter Mapping

Accessibility diimplementasikan melalui widget dan konfigurasi Flutter yang mendukung:

- Semantics
- Focus
- Keyboard Navigation
- Text Scaling
- Screen Reader

Seluruh implementasi harus mengikuti Accessibility System.

---

# Anti Patterns

Implementasi berikut tidak diperbolehkan:

- Menggunakan warna sebagai satu-satunya indikator status.
- Menggunakan teks dengan kontras rendah.
- Mengabaikan Screen Reader.
- Menggunakan Touch Target yang terlalu kecil.
- Tidak menyediakan indikator fokus.
- Mengabaikan Text Scaling.
- Mengubah standar Accessibility tanpa Architecture Review.

---

# Engineering Governance

Accessibility mengikuti:

- Design Philosophy
- Foundation
- Design Tokens
- SSOT
- DoR
- DoD
- DCI
- KML
- Quality Gates
- Documentation Dependency Rule (DDR)
- Documentation Layering Rule (DLR)
- Documentation Traceability Matrix (DTM)
- Design System Lifecycle (DSL)

---

# Knowledge Asset

Accessibility merupakan Knowledge Asset resmi yang menjadi acuan seluruh implementasi aksesibilitas pada VENTRA ERP Platform.

---

# Success Metrics

Accessibility dianggap berhasil apabila:

- Seluruh aplikasi memenuhi standar Accessibility yang ditetapkan.
- Seluruh komponen mendukung Screen Reader.
- Seluruh halaman memiliki kontras yang memadai.
- Seluruh komponen interaktif dapat diakses dengan baik.
- Pengguna dapat menggunakan aplikasi dengan nyaman pada berbagai kondisi.

---

# Related Documents

- README.md
- design_philosophy.md
- foundation.md
- colors.md
- typography.md
- spacing.md
- icons.md
- motion.md

---

# Approval

Accessibility merupakan standar resmi aksesibilitas pada seluruh produk VENTRA ERP Platform.