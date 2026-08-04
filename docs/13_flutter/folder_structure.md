# FOLDER STRUCTURE

Version : 1.0

Status : APPROVED

Document Code : FLT-006

Category : Folder Structure

Owner : Enterprise Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

Last Updated : 2026-08-05

---

# Tujuan

Dokumen ini mendefinisikan struktur folder resmi Flutter pada seluruh VENTRA ERP Platform.

Struktur folder dirancang agar konsisten, mudah dipahami, mudah dikembangkan, dan mendukung implementasi Clean Architecture serta Feature First Architecture.

---

# Vision

Membangun struktur project Flutter yang:

- Konsisten
- Modular
- Scalable
- Maintainable
- Reusable
- Mudah dinavigasi

---

# Mission

- Menjadi standar resmi struktur project Flutter.
- Mempermudah onboarding developer.
- Mengurangi inkonsistensi penempatan file.
- Mendukung pertumbuhan aplikasi enterprise.

---

# Scope

Folder Structure mencakup:

- Root Project
- Core Layer
- Shared Layer
- Features
- Assets
- Configuration
- Testing

---

# Folder Philosophy

Struktur folder mengikuti prinsip:

- Feature First
- Modular
- Separation of Concerns
- Reusable
- Single Responsibility

---

# Root Structure

```text
lib/
│
├── app/
├── bootstrap/
├── config/
├── core/
├── shared/
├── features/
└── main.dart
```

---

# App

Folder `app` berisi konfigurasi aplikasi.

Contoh:

- App
- App Router
- App Configuration

---

# Bootstrap

Folder `bootstrap` berisi proses inisialisasi aplikasi.

Contoh:

- Environment
- Dependency Initialization
- Startup Configuration

---

# Config

Folder `config` berisi konfigurasi global.

Contoh:

- Environment
- Flavor
- Constants
- Configuration

---

# Core

Folder `core` berisi fondasi aplikasi.

Contoh:

- Theme
- Design Tokens
- Component Library
- Base Classes
- Common Services
- Error Handling
- Utilities

Core tidak bergantung pada Feature.

---

# Shared

Folder `shared` berisi resource yang dapat digunakan lintas Feature.

Contoh:

- Widgets
- Helpers
- Extensions
- Validators
- Formatters

Shared tidak boleh berisi Business Logic.

---

# Features

Folder `features` berisi seluruh modul bisnis.

Contoh:

- auth
- dashboard
- booking
- crm
- finance
- marketing
- customer
- jamaah
- payment
- report

Setiap Feature bersifat mandiri.

---

# Assets

Seluruh aset mengikuti struktur yang konsisten.

Contoh:

```text
assets/
├── icons/
├── images/
├── illustrations/
├── animations/
├── fonts/
└── translations/
```

---

# Testing

Struktur testing mengikuti struktur source code.

Contoh:

```text
test/
├── unit/
├── widget/
├── integration/
└── golden/
```

---

# Dependency Rules

Aturan dependency:

- Feature menggunakan Core dan Shared.
- Core tidak mengetahui Feature.
- Shared tidak mengandung Business Logic.
- Tidak diperbolehkan Circular Dependency.

---

# Scalability

Struktur folder harus mampu mendukung:

- Penambahan Feature baru.
- Penambahan Component baru.
- Penambahan Platform baru.
- Penambahan Tim Developer.

Tanpa mengubah struktur utama.

---

# Anti Patterns

Implementasi berikut tidak diperbolehkan:

- Folder berdasarkan jenis file untuk seluruh aplikasi.
- Business Logic di dalam Widget.
- Utility yang bergantung pada Feature.
- Circular Dependency.
- Struktur folder yang berbeda antar Feature.

---

# Engineering Governance

Folder Structure mengikuti:

- Flutter Framework
- Flutter Architecture
- Flutter Layer Standard
- Coding Standard
- Naming Convention
- Documentation Driven Development (DDD)

---

# Knowledge Asset

Folder Structure merupakan standar resmi struktur project Flutter pada seluruh VENTRA ERP Platform.

---

# Success Metrics

Folder Structure dianggap berhasil apabila:

- Seluruh Feature menggunakan struktur yang sama.
- Developer dapat menemukan file dengan cepat.
- Tidak terjadi inkonsistensi struktur.
- Struktur tetap stabil saat aplikasi berkembang.

---

# Related Documents

- README.md
- flutter_framework.md
- flutter_architecture.md
- flutter_layer_standard.md
- coding_standard.md
- naming_convention.md
- responsive_design.md
- ../11_ventra_design_system/
- ../12_components/

---

# Approval

Folder Structure merupakan standar resmi struktur project Flutter pada seluruh VENTRA ERP Platform.