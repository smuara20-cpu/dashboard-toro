# ROLE PERMISSION

Version : 1.0

---

# 1. Overview

Menyimpan relasi antara Role dan Permission.

---

# 2. Business Purpose

Menghubungkan Role dengan Permission sebagai implementasi Role Based Access Control (RBAC).

---

# 3. Business Rules

Mengacu pada

role_permission_business_rules.md

---

# 4. Workflow

Create Role

↓

Create Permission

↓

Assign Permission

↓

Role Active

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
| role_id | UUID | No | - | Role |
| permission_id | UUID | No | - | Permission |
| is_active | BOOLEAN | No | TRUE | Status Aktif |

---

# 7. Relationships

Belongs To

- Company
- Role
- Permission

---

# 8. Index

- company_id
- role_id
- permission_id

---

# 9. Unique

- company_id + role_id + permission_id

---

# 10. Audit

Mengikuti Base Entity.

---

# 11. Security

Perubahan Role Permission hanya dapat dilakukan oleh Administrator yang memiliki hak akses.

---

# 12. Validation

Role

- wajib

Permission

- wajib

Role dan Permission tidak boleh duplikat.

---

# 13. Soft Delete

Menggunakan deleted_at.

---

# 14. Business Scenario

Role

Finance Manager

↓

Permission

invoice.read

invoice.create

payment.verify

payment.approve

---

# 15. Future Expansion

- Permission Group
- Permission Template
- Dynamic Permission
- Department Permission