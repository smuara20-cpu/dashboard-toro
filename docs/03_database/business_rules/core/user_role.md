# USER ROLE

Version : 1.0

---

# 1. Overview

Menyimpan relasi antara User dan Role.

---

# 2. Business Purpose

Menghubungkan User dengan Role pada sistem Role Based Access Control (RBAC).

---

# 3. Business Rules

Mengacu pada

user_role_business_rules.md

---

# 4. Workflow

Create User

↓

Create Role

↓

Assign Role

↓

Login

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
| user_id | UUID | No | - | User |
| role_id | UUID | No | - | Role |
| is_default | BOOLEAN | No | FALSE | Role Default |
| is_active | BOOLEAN | No | TRUE | Status Aktif |

---

# 7. Relationships

Belongs To

- Company

- User

- Role

---

# 8. Index

- company_id

- user_id

- role_id

---

# 9. Unique

- company_id + user_id + role_id

---

# 10. Audit

Mengikuti Base Entity.

---

# 11. Security

Role hanya dapat diberikan oleh User yang memiliki Permission untuk mengelola User.

---

# 12. Validation

User

- wajib

Role

- wajib

Satu User hanya boleh memiliki satu Default Role aktif.

---

# 13. Soft Delete

Menggunakan deleted_at.

---

# 14. Business Scenario

User

Ahmad

↓

Role

Marketing

Tour Leader

Customer Service

↓

Default Role

Marketing

---

# 15. Future Expansion

- Temporary Role

- Expired Role

- Schedule Role

- Delegation Role