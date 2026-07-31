# DOCUMENT CENTER

Version : 1.0

---

# Purpose

Document Center merupakan pusat penyimpanan seluruh dokumen dalam ERP.

Semua modul wajib menggunakan Document Center.

Tidak diperbolehkan membuat upload file sendiri.

---

# Document Source

Dokumen dapat berasal dari:

- Customer
- Customer Service
- Finance
- Tour Leader
- Manager
- AI
- System

---

# Upload Method

Customer maupun Staff dapat memilih:

📷 Ambil Foto

🖼 Pilih dari Galeri

📄 Browse File

---

# Supported File

Image

- JPG
- JPEG
- PNG
- WEBP

Document

- PDF

---

# Document Category

Customer

- KTP
- KK
- NPWP
- Foto

Passport

- Passport

Visa

- Visa

Payment

- Bukti Transfer
- Invoice

Travel

- Ticket
- Boarding Pass
- Hotel Voucher

Medical

- Vaksin
- Surat Dokter

Other

- Dokumen Lain

---

# Storage

Semua file disimpan pada

Supabase Storage

Tidak menggunakan:

- Local Drive
- Google Drive

---

# Security

Semua file menggunakan:

- Signed URL
- Permission
- Audit Log
- Encryption

---

# AI

Semua file dapat diproses oleh AI sesuai permission.

Contoh:

Passport

↓

OCR

↓

Auto Fill

---

Transfer

↓

OCR

↓

Fraud Detection

---

KTP

↓

OCR

↓

Customer Verification

---

Invoice

↓

OCR

↓

Finance Matching

---

# Principle

Upload sekali.

Digunakan seluruh ERP.