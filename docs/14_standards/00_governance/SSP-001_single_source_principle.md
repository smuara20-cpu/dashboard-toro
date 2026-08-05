# SSP-001 — Single Source Principle

Version : 1.0

Status : APPROVED

Document Code : SSP-001

Category : Governance Standard

Priority : CORE

Owner : Enterprise Architecture Team

Approval : APPROVED

---

# Purpose

Single Source Principle (SSP) menetapkan bahwa setiap data bisnis pada VENTRA hanya memiliki satu sumber resmi (Single Source of Truth / SSOT).

Seluruh modul wajib menggunakan data dari sumber yang sama dan tidak diperbolehkan membuat salinan data yang menjadi sumber utama.

---

# Philosophy

> Satu Data.
>
> Satu Sumber.
>
> Banyak Pengguna.

---

# Objectives

Penerapan Single Source Principle bertujuan untuk:

- Menghindari duplikasi data.
- Menjaga konsistensi informasi.
- Mempermudah audit.
- Mempermudah integrasi antar domain.
- Mengurangi konflik data.
- Meningkatkan kualitas keputusan bisnis.

---

# Core Principles

## Principle 1

Setiap data memiliki satu Domain Owner.

---

## Principle 2

Setiap data memiliki satu sumber resmi.

---

## Principle 3

Modul lain hanya boleh membaca data melalui Domain Service atau mekanisme integrasi resmi.

---

## Principle 4

Tidak diperbolehkan membuat master data yang sama pada domain berbeda.

---

## Principle 5

Perubahan data hanya dilakukan oleh domain pemilik.

---

# Examples

## Customer

Sumber resmi:

CRM Domain

Bukan:

Finance

Booking

Dashboard

AI

---

## Booking

Sumber resmi:

Booking Domain

---

## Payment

Sumber resmi:

Finance Domain

---

## Passport

Sumber resmi:

Document Domain

---

# AI Integration

AI tidak menjadi sumber data.

AI hanya membaca data resmi dari Domain Service.

AI tidak boleh membuat atau mengubah master data.

---

# Dashboard Integration

Dashboard hanya menampilkan data dari sumber resmi.

Dashboard tidak menyimpan salinan data.

---

# Notification Integration

Notification membaca Business Event dari domain terkait.

Notification tidak menyimpan master data.

---

# Validation Rules

- Tidak boleh ada dua sumber resmi untuk satu jenis data.
- Seluruh referensi data menggunakan Domain Owner.
- Integrasi antar domain wajib menggunakan mekanisme resmi.

---

# Success Criteria

Single Source Principle dianggap berhasil apabila:

- Tidak terjadi duplikasi master data.
- Seluruh modul menggunakan sumber data yang sama.
- Dashboard menampilkan data yang konsisten.
- AI menggunakan data resmi.
- Audit menunjukkan satu sumber data yang jelas.

---

# Related Standards

- GAP-001 — Golden Automation Principle
- SIMIO-001 — Single Input Multiple Intelligence Output
- DOP-001 — Data Owner Principle
- EDA-001 — Enterprise Domain Architecture

---

# Approval

Dokumen ini merupakan standar resmi Single Source Principle pada VENTRA.

Seluruh domain wajib mengikuti prinsip ini.