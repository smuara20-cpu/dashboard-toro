# NCS-001 — Enterprise Naming Convention Standard

Version : 1.0

Status : APPROVED

Document Code : NCS-001

Category : Governance Standard

Priority : CORE

Owner : Enterprise Architecture Team

Approval : APPROVED

---

# Purpose

Dokumen ini menetapkan standar penamaan yang digunakan di seluruh proyek VENTRA.

Seluruh nama pada Database, API, Flutter, AI, Dashboard, Event, Workflow, Report, Notification, dan Dokumentasi wajib mengikuti standar ini.

Tujuan utama adalah menjaga konsistensi, keterbacaan, dan kemudahan maintenance.

---

# General Principles

- Gunakan nama yang jelas.
- Hindari singkatan yang tidak umum.
- Gunakan istilah bisnis.
- Konsisten di seluruh sistem.
- Satu istilah hanya memiliki satu arti.

---

# Domain Naming

Gunakan:

- CRM
- Booking
- Finance
- Journey
- Document
- AI
- Dashboard
- Notification
- Security
- Integration

Jangan membuat nama domain baru tanpa Architecture Review.

---

# Entity Naming

Gunakan bentuk tunggal.

Contoh:

Customer

Booking

Invoice

Payment

Passport

Visa

Hotel

Ticket

Jangan:

Customers

Bookings

Invoices

---

# Database Table

Gunakan:

snake_case

Contoh:

customer

booking

payment

passport

booking_item

---

# Flutter

Gunakan:

snake_case

Contoh:

customer_detail_page.dart

booking_repository.dart

payment_provider.dart

---

# Dart Class

Gunakan:

PascalCase

Contoh:

Customer

BookingRepository

PaymentService

---

# Variable

Gunakan:

camelCase

Contoh:

customerName

bookingStatus

totalPayment

---

# Constant

Gunakan:

lowerCamelCase dengan prefix yang jelas atau ALL_CAPS bila memang konstanta global yang tidak berubah, sesuai coding standard proyek.

Contoh:

defaultPageSize

maxUploadSizeMb

---

# Event

Gunakan:

Past Tense

Contoh:

BookingConfirmed

PaymentReceived

VisaApproved

---

# Workflow

Gunakan:

Nama Proses

Contoh:

Booking Workflow

Payment Workflow

Departure Workflow

---

# API Endpoint

Gunakan:

plural resource

Contoh:

/customers

/bookings

/payments

---

# AI Prompt

Gunakan:

AIP-XXXX

Contoh:

AIP-0001 Executive Briefing

---

# Standard ID

Gunakan:

PREFIX-XXXX

Contoh:

GAP-001

SIMIO-001

ACE-001

---

# Rules

- Tidak boleh ada dua nama untuk satu konsep bisnis.
- Semua penamaan mengikuti Business Glossary.
- Perubahan nama wajib melalui Architecture Review.

---

# Related Documents

- Project Constitution
- Business Glossary
- Architecture Decision Log
- Flutter Naming Convention

---

# Approval

Dokumen ini merupakan standar resmi penamaan di seluruh proyek VENTRA.