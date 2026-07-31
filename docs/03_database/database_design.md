# ERP TRAVEL AI

# DATABASE DESIGN

Version : 1.0

---

# Database

Supabase PostgreSQL

---

# Naming Convention

Semua nama tabel menggunakan

snake_case

Contoh

customer

booking

payment_transaction

hotel_reservation

---

# Primary Key

Semua tabel menggunakan

UUID

Contoh

id UUID PRIMARY KEY

---

# Foreign Key

Semua relasi menggunakan UUID

Contoh

customer_id

booking_id

invoice_id

---

# Timestamp

Semua tabel wajib memiliki

created_at

updated_at

---

# Soft Delete

Semua tabel menggunakan

deleted_at

Data tidak langsung dihapus.

---

# Audit

Semua tabel memiliki

created_by

updated_by

deleted_by

---

# Status

Gunakan Enum

Jangan menggunakan string bebas.

Contoh

BookingStatus

PaymentStatus

InvoiceStatus

VisaStatus

---

# Active Flag

Semua Master Data mempunyai

is_active

---

# Code

Master Data mempunyai

code

Contoh

BANK001

HOTEL001

PKG001

---

# Name

Master Data mempunyai

name

---

# Description

Jika diperlukan

description

---

# Notes

Jika diperlukan

notes

---

# Index

Semua kolom berikut wajib di-index

code

name

customer_id

booking_id

invoice_id

payment_id

created_at

status

---

# File

Semua file menggunakan

Supabase Storage

Database hanya menyimpan

Storage Path

Signed URL

Metadata

---

# Security

Tidak boleh menyimpan

Password

Token

OTP

dalam bentuk Plain Text.

---

# Encryption

Nomor Passport

NIK

Nomor Visa

Nomor Rekening

harus dienkripsi.

---

# Version

Semua perubahan struktur database dicatat pada

decision_log.md