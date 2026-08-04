# ACTION COMPONENTS

Version : 1.0

Status : APPROVED

Document Code : VCL-ACT-000

Category : Action Components

Owner : Enterprise Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

Last Updated : 2026-08-05

---

# Tujuan

Dokumen ini mendefinisikan standar seluruh Action Components pada VENTRA ERP Platform.

Action Components adalah komponen yang digunakan untuk memicu aksi atau interaksi pengguna terhadap sistem.

Seluruh Action Components wajib mengikuti Enterprise Component Specification (ECS).

---

# Scope

Action Components mencakup:

- Button
- Icon Button
- Floating Action Button
- Segmented Button
- Menu Button

---

# Philosophy

Action Components harus memberikan affordance yang jelas sehingga pengguna memahami bahwa komponen tersebut dapat ditekan atau diaktifkan.

Setiap aksi harus memiliki tujuan yang jelas dan memberikan umpan balik yang sesuai.

---

# UX Principles

Action Components harus:

- Mudah dikenali.
- Mudah dijangkau.
- Konsisten.
- Memberikan feedback yang jelas.
- Tidak menimbulkan kebingungan.

---

# Shared Behavior

Seluruh Action Components memiliki perilaku dasar:

- Enabled
- Disabled
- Hover
- Focus
- Pressed
- Loading
- Success (jika relevan)
- Error (jika relevan)

Perilaku detail setiap komponen dijelaskan pada dokumen masing-masing.

---

# Accessibility

Seluruh Action Components harus:

- Mendukung keyboard navigation.
- Mendukung screen reader.
- Memiliki touch target yang memadai.
- Memiliki focus indicator yang jelas.

---

# Design Tokens

Seluruh Action Components wajib menggunakan:

- Color Tokens
- Typography Tokens
- Radius Tokens
- Spacing Tokens
- Elevation Tokens
- Motion Tokens

---

# Flutter Mapping

Implementasi dilakukan menggunakan komponen Flutter yang telah distandardisasi oleh VENTRA.

Tidak diperbolehkan membuat implementasi di luar standar tanpa Architecture Review.

---

# Anti Patterns

Implementasi berikut tidak diperbolehkan:

- Menggunakan warna yang tidak menunjukkan makna aksi.
- Menggunakan ukuran tombol yang tidak konsisten.
- Menghilangkan feedback ketika ditekan.
- Menggunakan hardcoded values.
- Mengubah perilaku dasar tanpa Architecture Review.

---

# Related Components

- button.md
- icon_button.md
- floating_action_button.md
- segmented_button.md
- menu_button.md

---

# Approval

Action Components merupakan standar resmi seluruh komponen aksi pada VENTRA ERP Platform.