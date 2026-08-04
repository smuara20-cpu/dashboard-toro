# CODING STANDARD

Version : 1.0

Status : APPROVED

Document Code : FLT-004

Category : Coding Standard

Owner : Enterprise Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

Last Updated : 2026-08-05

---

# Tujuan

Dokumen ini mendefinisikan standar penulisan source code Flutter pada seluruh VENTRA ERP Platform.

Standar ini memastikan seluruh kode memiliki kualitas yang konsisten, mudah dibaca, mudah dipelihara, dan mudah diuji.

---

# Vision

Membangun source code Flutter yang:

- Bersih
- Konsisten
- Modular
- Mudah dipelihara
- Mudah diuji
- Mudah dikembangkan

---

# Mission

- Menyatukan gaya penulisan kode.
- Mengurangi inkonsistensi antar developer.
- Mempermudah Code Review.
- Mempermudah proses maintenance.
- Menjadi standar resmi implementasi Flutter.

---

# Scope

Coding Standard mencakup:

- Struktur source code
- Penamaan
- Widget
- Error Handling
- Asynchronous Programming
- Documentation
- Testing
- Performance
- Clean Code

---

# Coding Philosophy

Seluruh source code harus:

- Readable
- Reusable
- Maintainable
- Testable
- Predictable
- Simple

Kode ditulis agar mudah dipahami oleh developer lain, bukan hanya oleh pembuatnya.

---

# Clean Code Principles

Seluruh implementasi mengikuti prinsip:

- Single Responsibility Principle (SRP)
- Don't Repeat Yourself (DRY)
- Keep It Simple (KISS)
- Separation of Concerns (SoC)
- Composition over Inheritance
- Explicit is Better than Implicit

---

# Widget Guidelines

Widget harus:

- Memiliki satu tanggung jawab.
- Reusable.
- Mudah diuji.
- Tidak mengandung Business Logic.
- Menggunakan Component Library.

---

# Business Logic

Business Logic tidak boleh ditempatkan pada Widget.

Business Logic ditempatkan pada layer yang sesuai dengan Flutter Architecture.

---

# Hardcoded Values

Tidak diperbolehkan menggunakan:

- Hardcoded Color
- Hardcoded Font Size
- Hardcoded Radius
- Hardcoded Padding
- Hardcoded Margin
- Hardcoded Duration
- Hardcoded String yang dapat dikelola secara terpusat

Seluruh nilai harus mengacu pada Design System, Design Tokens, atau konfigurasi yang telah ditetapkan.

---

# Asynchronous Programming

Implementasi asynchronous harus:

- Mudah dipahami.
- Mudah ditangani ketika terjadi error.
- Tidak menyebabkan callback yang kompleks.
- Konsisten pada seluruh aplikasi.

---

# Error Handling

Error harus:

- Ditangani secara konsisten.
- Tidak diabaikan.
- Memberikan informasi yang cukup untuk proses debugging.
- Tidak menampilkan informasi sensitif kepada pengguna.

---

# Documentation

Source code harus memiliki dokumentasi apabila:

- Logika kompleks.
- Algoritma khusus.
- Perhitungan bisnis.
- Integrasi eksternal.

Komentar digunakan untuk menjelaskan alasan (why), bukan menjelaskan hal yang sudah jelas dari kode (what).

---

# Testing

Seluruh source code harus mudah diuji.

Implementasi harus mendukung:

- Unit Test
- Widget Test
- Integration Test

---

# Performance

Implementasi harus memperhatikan:

- Rebuild Widget seminimal mungkin.
- Reuse Component.
- Penggunaan memori yang efisien.
- Rendering yang optimal.

Optimasi dilakukan berdasarkan hasil profiling, bukan asumsi.

---

# Code Review Checklist

Setiap perubahan source code harus memenuhi:

- Mengikuti Flutter Architecture.
- Mengikuti Layer Standard.
- Menggunakan Component Library.
- Menggunakan Design Tokens.
- Tidak terdapat Hardcoded Values.
- Mudah dibaca.
- Mudah diuji.
- Tidak menimbulkan Circular Dependency.

---

# Engineering Governance

Coding Standard mengikuti:

- Flutter Framework
- Flutter Architecture
- Flutter Layer Standard
- Documentation Driven Development (DDD)
- Single Source of Truth (SSOT)
- Definition of Ready (DoR)
- Definition of Done (DoD)

---

# Knowledge Asset

Coding Standard merupakan Knowledge Asset resmi yang menjadi acuan seluruh implementasi source code Flutter pada VENTRA ERP Platform.

---

# Success Metrics

Coding Standard dianggap berhasil apabila:

- Seluruh source code mengikuti standar yang sama.
- Code Review menjadi lebih cepat.
- Source code mudah dipelihara.
- Source code mudah diuji.
- Tidak terjadi inkonsistensi implementasi.

---

# Related Documents

- README.md
- flutter_framework.md
- flutter_architecture.md
- flutter_layer_standard.md
- naming_convention.md
- folder_structure.md
- ../11_ventra_design_system/
- ../12_components/

---

# Approval

Coding Standard merupakan standar resmi penulisan source code Flutter pada seluruh VENTRA ERP Platform.