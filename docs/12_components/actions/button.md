# BUTTON

Version : 1.0

Status : APPROVED

Component ID : VCL-ACT-001

Document Code : VCL-ACT-001

Category : Action Component

Owner : Enterprise Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

Last Updated : 2026-08-05

---

# Tujuan

Button merupakan komponen utama yang digunakan untuk memicu aksi pengguna pada VENTRA ERP Platform.

Button harus memberikan affordance yang jelas, mudah dikenali, dan memberikan umpan balik yang konsisten terhadap setiap interaksi.

Dokumen ini hanya menjelaskan spesifikasi yang bersifat khusus untuk Button. Standar umum mengikuti:

- actions/README.md
- component_specification.md
- component_state_standard.md

---

# Business Usage

Button digunakan untuk:

- Menyimpan data
- Membatalkan aksi
- Menghapus data
- Membuka halaman
- Mengirim formulir
- Menjalankan proses
- Konfirmasi tindakan

---

# UX Principles

Button harus:

- Mudah ditemukan.
- Mudah dipahami.
- Mudah ditekan.
- Memiliki label yang jelas.
- Memberikan feedback visual.

---

# Visual Specification

Button mengikuti:

- Color System
- Typography System
- Radius System
- Elevation System
- Motion System

Seluruh nilai berasal dari Design Tokens.

---

# Component Anatomy

Button terdiri dari:

- Container
- Label
- Leading Icon (opsional)
- Trailing Icon (opsional)
- Loading Indicator (opsional)
- Focus Indicator

Anatomi mengikuti Component Anatomy Standard (CAS).

---

# Variants

Button memiliki varian:

- Primary
- Secondary
- Outlined
- Text
- Tonal
- Danger
- Success
- Icon Only

Variant mengikuti Component Variant Standard (CVS).

---

# States

Button mendukung State berikut:

- Default
- Hover
- Focus
- Pressed
- Disabled
- Loading
- Success
- Error

State mengikuti Component State Standard (CSS).

---

# Properties

Button memiliki properti utama:

- label
- onPressed
- variant
- size
- icon
- enabled
- loading
- fullWidth

Properti tambahan dapat ditambahkan melalui Architecture Review.

---

# Validation Rules

Button harus:

- Memiliki label yang jelas, kecuali Icon Only.
- Tidak boleh menjalankan aksi ketika Disabled.
- Menampilkan Loading State saat proses berlangsung.
- Mencegah double click pada proses yang belum selesai.

---

# Interaction

Button harus:

- Memberikan feedback ketika ditekan.
- Mendukung keyboard navigation.
- Mendukung shortcut apabila diperlukan.
- Mendukung screen reader.

---

# Responsive Behavior

Button harus tetap konsisten pada:

- Mobile
- Tablet
- Desktop
- Web

Ukuran dan spacing mengikuti Design Tokens.

---

# Accessibility

Button harus:

- Memiliki Touch Target yang memadai.
- Mendukung Focus Indicator.
- Mendukung Screen Reader.
- Memenuhi standar kontras warna.

---

# Design Tokens

Button menggunakan:

- Color Tokens
- Typography Tokens
- Radius Tokens
- Spacing Tokens
- Elevation Tokens
- Motion Tokens

Tidak diperbolehkan menggunakan Hardcoded Values.

---

# Flutter Mapping

Implementasi dilakukan menggunakan widget `AppButton`.

Contoh penggunaan:

```dart
AppButton(
  label: 'Simpan',
  variant: ButtonVariant.primary,
  onPressed: () {},
)
```

Seluruh implementasi mengikuti Theme dan Design Tokens.

---

# Anti Patterns

Implementasi berikut tidak diperbolehkan:

- Menggunakan ElevatedButton secara langsung di Feature Module.
- Menggunakan warna hardcoded.
- Menggunakan padding hardcoded.
- Menggunakan radius hardcoded.
- Menggunakan ukuran font hardcoded.
- Menggunakan label yang tidak jelas.
- Menambahkan variant baru tanpa Architecture Review.

---

# Testing Checklist

- [ ] Semua variant tampil sesuai standar.
- [ ] Semua state berfungsi.
- [ ] Mendukung keyboard navigation.
- [ ] Mendukung screen reader.
- [ ] Loading State berjalan dengan benar.
- [ ] Tidak terjadi double click.
- [ ] Menggunakan seluruh Design Tokens.

---

# Related Documents

- actions/README.md
- component_specification.md
- component_state_standard.md
- ../11_ventra_design_system/colors.md
- ../11_ventra_design_system/typography.md
- ../11_ventra_design_system/motion.md

---

# Approval

Button merupakan komponen aksi utama pada VENTRA ERP Platform.

Seluruh implementasi Button wajib mengacu pada dokumen ini.