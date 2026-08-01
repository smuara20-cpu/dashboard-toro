# BRANCH

Version : 1.0

---

# 1. Overview

Menyimpan data cabang perusahaan.

Setiap Branch berada di bawah satu Company.

---

# 2. Business Purpose

Digunakan untuk memisahkan operasional perusahaan berdasarkan lokasi atau unit bisnis.

---

# 3. Business Rules

Mengacu pada

branch_business_rules.md

---

# 4. Workflow

Create Company

↓

Create Branch

↓

Assign User

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
| company_id | UUID | No | - | Referensi Company |
| code | VARCHAR(20) | No | - | Kode Branch |
| name | VARCHAR(150) | No | - | Nama Branch |
| email | VARCHAR(150) | Yes | NULL | Email |
| phone | VARCHAR(30) | Yes | NULL | Telepon |
| mobile | VARCHAR(30) | Yes | NULL | HP |
| address | TEXT | Yes | NULL | Alamat |
| country_id | UUID | Yes | NULL | Negara |
| province_id | UUID | Yes | NULL | Provinsi |
| city_id | UUID | Yes | NULL | Kota |
| district_id | UUID | Yes | NULL | Kecamatan |
| village_id | UUID | Yes | NULL | Kelurahan |
| postal_code | VARCHAR(10) | Yes | NULL | Kode Pos |
| manager_name | VARCHAR(150) | Yes | NULL | Nama Kepala Cabang |
| status | SMALLINT | No | 1 | Status |
| is_active | BOOLEAN | No | TRUE | Status Aktif |

---

# 7. Relationships

Belongs To

- Company

Has Many

- User
- Customer
- Booking
- Invoice
- Payment

---

# 8. Index

- company_id
- code
- name
- status
- is_active

---

# 9. Unique

- company_id + code

---

# 10. Audit

Mengikuti Base Entity.

---

# 11. Security

User hanya dapat mengakses Branch sesuai hak aksesnya.

---

# 12. Validation

Branch Code

- wajib
- maksimal 20 karakter
- unik dalam satu Company

Branch Name

- wajib
- maksimal 150 karakter

---

# 13. Soft Delete

Menggunakan deleted_at.

---

# 14. Business Scenario

Satu Company dapat memiliki beberapa Branch yang menjalankan operasional secara mandiri namun tetap berada dalam satu sistem ERP.

---

# 15. Future Expansion

- Multi Warehouse
- Multi Office
- Multi Region
- Branch Performance KPI
