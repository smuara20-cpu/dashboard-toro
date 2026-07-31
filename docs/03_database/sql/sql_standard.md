# SQL STANDARD

Version : 1.0

---

## Database

PostgreSQL

Supabase

---

## Penamaan

Gunakan snake_case.

---

## Primary Key

UUID

---

## Foreign Key

UUID

---

## Timestamp

TIMESTAMP WITH TIME ZONE

---

## Soft Delete

deleted_at

---

## Audit

created_at

updated_at

created_by

updated_by

deleted_by

---

## Numeric

NUMERIC(18,2)

---

## JSON

JSONB

---

## Enum

Lookup Table

Apabila memungkinkan hindari PostgreSQL ENUM agar perubahan status lebih fleksibel.

---

## Transaction

Seluruh transaksi penting menggunakan PostgreSQL Transaction.