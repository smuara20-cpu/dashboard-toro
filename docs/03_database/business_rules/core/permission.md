# PERMISSION

Version : 1.0

---

# 1. Overview

Menyimpan master data Permission pada ERP.

Permission menentukan hak akses terhadap Resource dan Action.

---

# 2. Business Purpose

Digunakan untuk mengontrol akses User melalui Role.

---

# 3. Business Rules

Mengacu pada

permission_business_rules.md

---

# 4. Workflow

Create Permission

↓

Assign Permission To Role

↓

Assign Role To User

↓

User Login

↓

Authorization

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
| code | VARCHAR(100) | No | - | Permission Code |
| resource | VARCHAR(100) | No | - | Resource |
| action | VARCHAR(50) | No | - | Action |
| module | VARCHAR(100) | No | - | Module ERP |
| description | TEXT | Yes | NULL | Deskripsi |
| is_system | BOOLEAN | No | FALSE | Permission bawaan |
| status | SMALLINT | No | 1 | Status |
| is_active | BOOLEAN | No | TRUE | Aktif |

---

# 7. Relationships

Belongs To

- Company

Has Many

- Role Permission

---

# 8. Index

- company_id
- code
- resource
- module
- status

---

# 9. Unique

- company_id + code

---

# 10. Audit

Mengikuti Base Entity.

---

# 11. Security

Permission tidak diberikan langsung kepada User.

Permission hanya diberikan melalui Role.

---

# 12. Validation

Permission Code

- wajib
- unik dalam Company

Resource

- wajib

Action

- wajib

---

# 13. Soft Delete

Menggunakan deleted_at.

---

# 14. Business Scenario

Role "Finance Manager"

↓

invoice.approve

payment.verify

refund.approve

Role "Customer Service"

↓

booking.create

booking.update

customer.read

---

# 15. Future Expansion

- Dynamic Permission
- Temporary Permission
- Time Based Permission
- AI Permission
- API Permission