# ERP TRAVEL AI

# DATA DICTIONARY DOCUMENTATION STANDARD

Version : 1.0

---

# 1. Tujuan

Dokumen ini menjadi standar penulisan seluruh Data Dictionary pada ERP Travel AI.

Seluruh tabel database wajib mengikuti format yang sama agar mudah dipahami, dikembangkan, dan dipelihara.

---

# 2. Ruang Lingkup

Standar ini berlaku untuk seluruh domain.

- Core
- Customer
- Jamaah
- Booking
- Package
- Finance
- Document
- Hotel
- Ticket
- Visa
- CRM
- Marketing
- Dashboard
- AI
- Notification

---

# 3. Struktur Dokumen

Setiap tabel wajib memiliki urutan berikut.

1. Overview

2. Business Purpose

3. Business Rules

4. Workflow

5. Table Information

6. Primary Key

7. Foreign Keys

8. Columns

9. Relationships

10. Constraints

11. Index

12. Unique

13. Security

14. Validation

15. Audit

16. Soft Delete

17. Business Scenario

18. Future Expansion

---

# 4. Penamaan File

Gunakan snake_case.

Contoh

company.md

branch.md

booking.md

invoice.md

payment_transaction.md

hotel_reservation.md

---

# 5. Penamaan Tabel

Gunakan snake_case.

Contoh

company

booking

booking_passenger

payment_transaction

hotel_room

---

# 6. Penamaan Kolom

Gunakan snake_case.

Contoh

company_id

customer_id

created_at

updated_at

booking_date

passport_number

---

# 7. Primary Key

Semua tabel menggunakan

id UUID

---

# 8. Foreign Key

Seluruh relasi menggunakan UUID.

Contoh

company_id

branch_id

booking_id

customer_id

---

# 9. Audit Field

Semua tabel wajib memiliki.

created_at

updated_at

deleted_at

created_by

updated_by

deleted_by

---

# 10. Soft Delete

Gunakan

deleted_at

Tidak diperbolehkan Hard Delete untuk data operasional.

---

# 11. Status

Gunakan Enum atau Lookup Table.

Tidak diperbolehkan menggunakan string bebas.

Contoh

Booking Status

Invoice Status

Visa Status

Payment Status

---

# 12. Metadata

Apabila diperlukan data dinamis, gunakan JSONB.

Contoh

metadata JSONB

---

# 13. Attachment

File tidak disimpan di database.

Gunakan Supabase Storage.

Database hanya menyimpan

storage_path

mime_type

file_size

checksum

---

# 14. Index

Minimal Index

Primary Key

Foreign Key

Status

Created At

Kode

Nama

---

# 15. Security

Tidak diperbolehkan menyimpan.

Password

OTP

Refresh Token

Access Token

dalam bentuk Plain Text.

Gunakan Hash atau Encryption.

---

# 16. Referensi

database_design.md

table_standard.md

base_entity.md

erd.md

master_table_list.md