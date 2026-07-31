# COMPANY

Version : 1.0

---

# 1. Overview

Menyimpan data perusahaan yang menggunakan sistem ERP.

Sistem mendukung multi-company.

---

# 2. Business Purpose

Digunakan untuk:

- Menyimpan identitas perusahaan.
- Memisahkan data antar perusahaan.
- Menjadi root seluruh data ERP.

---

# 3. Business Rules

- Satu perusahaan memiliki banyak cabang.
- Satu perusahaan memiliki banyak pengguna.
- Semua data operasional terhubung ke company.
- Company tidak boleh dihapus jika masih memiliki data aktif.
- Company Code harus unik.
- Company dapat dinonaktifkan tanpa menghapus data.

---

# 4. Workflow

Create Company

↓

Create Branch

↓

Create User

↓

Operasional

---

# 5. Primary Key

| Kolom | Type |
|--------|------|
| id | UUID |

---

# 6. Columns

| Kolom | Type | Null | Default | Keterangan |
|--------|------|------|----------|------------|
| code | VARCHAR(20) | No | - | Kode perusahaan |
| name | VARCHAR(150) | No | - | Nama perusahaan |
| legal_name | VARCHAR(200) | Yes | - | Nama legal perusahaan |
| email | VARCHAR(150) | Yes | - | Email perusahaan |
| phone | VARCHAR(30) | Yes | - | Nomor telepon |
| website | VARCHAR(150) | Yes | - | Website |
| logo_url | TEXT | Yes | - | Lokasi logo di Supabase Storage |
| tax_number | VARCHAR(50) | Yes | - | NPWP |
| address | TEXT | Yes | - | Alamat perusahaan |
| city | VARCHAR(100) | Yes | - | Kota |
| country | VARCHAR(100) | Yes | - | Negara |
| status | SMALLINT | No | 1 | Status perusahaan |
| is_active | BOOLEAN | No | TRUE | Status aktif |

---

# 7. Relationships

Has Many

- Branch
- User
- Customer
- Package
- Booking
- Invoice
- Payment

---

# 8. Index

- code
- name
- status
- is_active

---

# 9. Unique

- code
- email

---

# 10. Audit

Mengikuti Base Entity.

---

# 11. Security

Semua query wajib menggunakan `company_id`.

User tidak boleh melihat data Company lain.

---

# 12. Validation

Company Code

- wajib
- unik
- maksimal 20 karakter

Company Name

- wajib
- maksimal 150 karakter

---

# 13. Soft Delete

Menggunakan `deleted_at`.

Hard Delete tidak diperbolehkan.

---

# 14. Business Scenario

PT Adinda Azzahra Tour

↓

Jakarta Branch

↓

Bandung Branch

↓

Makassar Branch

Seluruh transaksi tetap berada pada Company yang sama.

---

# 15. Future Expansion

- Multi Currency
- Multi Country
- Multi Language
- White Label
- Franchise