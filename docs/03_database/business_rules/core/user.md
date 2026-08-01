# USER

Version : 1.0

---

# 1. Overview

Menyimpan akun pengguna ERP.

---

# 2. Business Purpose

Digunakan sebagai identitas pengguna yang mengakses sistem.

---

# 3. Business Rules

Mengacu pada

user_business_rules.md

---

# 4. Workflow

Create Company

↓

Create Branch

↓

Create User

↓

Assign Role

↓

User Login

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
| branch_id | UUID | No | - | Branch |
| username | VARCHAR(50) | No | - | Username |
| full_name | VARCHAR(150) | No | - | Nama Lengkap |
| email | VARCHAR(150) | No | - | Email |
| phone | VARCHAR(30) | Yes | NULL | Telepon |
| mobile | VARCHAR(30) | Yes | NULL | HP |
| profile_photo | TEXT | Yes | NULL | Foto Profil |
| password_hash | TEXT | No | - | Password Hash |
| last_login | TIMESTAMP | Yes | NULL | Login Terakhir |
| status | SMALLINT | No | 1 | Status |
| is_active | BOOLEAN | No | TRUE | Aktif |

---

# 7. Relationships

Belongs To

- Company
- Branch

Has Many

- User Role
- Audit Log
- Notification

---

# 8. Index

- company_id
- branch_id
- username
- email
- status

---

# 9. Unique

- username
- email

---

# 10. Audit

Mengikuti Base Entity.

---

# 11. Security

Password wajib menggunakan Hash.

User hanya dapat mengakses data sesuai Role dan Branch.

---

# 12. Validation

Username

- wajib
- maksimal 50 karakter
- unik

Email

- wajib
- format email
- unik

Password

- minimal 8 karakter

---

# 13. Soft Delete

Menggunakan deleted_at.

---

# 14. Business Scenario

Satu User dapat memiliki lebih dari satu Role.

Contoh:

- Finance
- Customer Service

Namun seluruh aktivitas tetap berasal dari satu akun User.

---

# 15. Future Expansion

- Single Sign-On (SSO)
- Google Login
- Microsoft Login
- MFA
- Biometric Login