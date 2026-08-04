# COMPONENT IMPLEMENTATION STANDARD

Version : 1.0

Status : APPROVED

Document Code : VCL-004

Category : Flutter Component Standard

Owner : Enterprise Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

Last Updated : 2026-08-05

---

# Tujuan

Dokumen ini mendefinisikan standar implementasi seluruh Flutter Component pada VENTRA ERP Platform.

Dokumen ini menjadi jembatan antara Component Specification dan implementasi source code.

Seluruh komponen Flutter wajib mengikuti standar ini.

---

# Scope

Standar ini berlaku untuk seluruh komponen Flutter, meliputi:

- Action Components
- Input Components
- Navigation Components
- Display Components
- Feedback Components
- Dashboard Components

---

# Naming Convention

Seluruh komponen Flutter menggunakan prefix:

App

Contoh:

- AppButton
- AppCard
- AppDialog
- AppTextField
- AppDataTable
- AppSearchField
- AppDatePicker
- AppSnackbar

Tidak diperbolehkan membuat nama komponen di luar standar tanpa Architecture Review.

---

# Package Structure

Seluruh komponen ditempatkan pada struktur berikut:

lib/
└──core/
└──presentation/
└──design_system/
└──components/

Kategori komponen mengikuti Component Catalog.

---

# Component Principles

Seluruh komponen harus:

- Reusable
- Stateless apabila memungkinkan
- Configurable
- Testable
- Accessible
- Responsive
- Theme Driven
- Token Driven

---

# Dependency Rules

Komponen hanya boleh bergantung pada:

- Design Tokens
- Theme
- Shared Components
- Flutter SDK

Komponen tidak boleh bergantung pada Feature Module.

---

# Hardcoded Values

Tidak diperbolehkan menggunakan:

- Hardcoded Color
- Hardcoded Font Size
- Hardcoded Padding
- Hardcoded Radius
- Hardcoded Shadow
- Hardcoded Duration

Seluruh nilai berasal dari Design Tokens.

---

# Public API

Setiap komponen harus memiliki API yang:

- Konsisten
- Mudah dipahami
- Tidak berlebihan
- Mendukung Variant
- Mendukung State

---

# Variant

Seluruh Variant menggunakan enum.

Contoh:

ButtonVariant.primary

ButtonVariant.secondary

ButtonVariant.outlined

ButtonVariant.text

---

# State

State mengikuti Component State Standard.

Komponen tidak boleh membuat State baru tanpa Architecture Review.

---

# Accessibility

Seluruh komponen wajib:

- Mendukung Screen Reader
- Mendukung Keyboard Navigation
- Mendukung Focus
- Mendukung Text Scaling

---

# Testing

Setiap komponen minimal memiliki:

- Widget Test
- Golden Test (jika diperlukan)
- Accessibility Test

---

# Documentation

Seluruh implementasi wajib memiliki referensi ke:

- Component ID
- Component Specification
- Design Tokens

---

# Engineering Governance

Component Implementation Standard mengikuti:

- ECS
- CIS
- CIMP
- CSS
- CAS
- CFA
- CVS
- DDR
- DLR
- DTM
- DSL
- SSOT

---

# Knowledge Asset

Component Implementation Standard merupakan Single Source of Truth implementasi Flutter Component.

---

# Related Documents

- component_specification.md
- component_catalog.md
- component_state_standard.md
- actions/button.md
- ../11_ventra_design_system/design_tokens.md

---

# Approval

Seluruh implementasi Flutter Component wajib mengikuti Component Implementation Standard.