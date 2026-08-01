# ROLE

Version : 1.0

---

# 1. Overview

Menyimpan master data Role pada ERP.

Role digunakan untuk menentukan fungsi pekerjaan dan hak akses pengguna.

---

# 2. Business Purpose

Digunakan sebagai penghubung antara User dan Permission.

---

# 3. Business Rules

Mengacu pada

role_business_rules.md

---

# 4. Workflow

Create Company

↓

Create Role

↓

Assign Permission

↓

Assign User

---

# 5. Primary Key

| Kolom | Type |
|--------|------|
| id | UUID |

---

# 6. Columns

| Kolom | Type | Null | Default | Keterangan |
|--------|------|------|----------|------------|
| company_id | UUID | No | - | Company |
| code | VARCHAR(20) | No | - | Kode Role |
| name | VARCHAR(150) | No | - | Nama Role |
| description | TEXT | Yes | NULL | Deskripsi |
| approval_level | SMALLINT | Yes | NULL | Level Approval |
| is_system | BOOLEAN | No | FALSE | Role bawaan sistem |
| status | SMALLINT | No | 1 | Status |
| is_active | BOOLEAN | No | TRUE | Aktif |

---

# 7. Relationships

Belongs To

- Company

Has Many

- User Role

- Role Permission

---

# 8. Index

- company_id

- code

- name

- status

---

# 9. Unique

- company_id + code

---

# 10. Audit

Mengikuti Base Entity.

---

# 11. Security

Role tidak memberikan hak akses secara langsung.

Hak akses diperoleh melalui Role Permission.

---

# 12. Validation

Role Code

- wajib

- maksimal 20 karakter

Role Name

- wajib

- maksimal 150 karakter

---

# 13. Soft Delete

Menggunakan deleted_at.

---

# 14. Business Scenario

Satu User dapat memiliki lebih dari satu Role.

Satu Role dapat digunakan oleh banyak User.

---

# 15. Future Expansion

- Dynamic Approval

- Department Role

- Regional Role

- AI Role

- Temporary Role