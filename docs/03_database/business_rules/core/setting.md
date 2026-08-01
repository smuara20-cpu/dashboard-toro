# SETTING

Version : 1.0

---

# 1. Overview

Menyimpan konfigurasi sistem ERP yang dapat diubah tanpa mengubah source code aplikasi.

---

# 2. Business Purpose

Digunakan untuk mengelola konfigurasi sistem, perusahaan, workflow, dashboard, AI, dan integrasi pihak ketiga.

---

# 3. Business Rules

Mengacu pada

setting_business_rules.md

---

# 4. Workflow

Create Company

↓

Create Setting

↓

System Configuration

↓

ERP Ready

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
| category | VARCHAR(100) | No | - | Kategori Setting |
| setting_key | VARCHAR(150) | No | - | Key Setting |
| setting_value | TEXT | Yes | NULL | Nilai Setting |
| value_type | VARCHAR(30) | No | STRING | String, Number, Boolean, JSON, Date |
| description | TEXT | Yes | NULL | Deskripsi |
| is_system | BOOLEAN | No | FALSE | Setting Sistem |
| is_encrypted | BOOLEAN | No | FALSE | Nilai terenkripsi |
| status | SMALLINT | No | 1 | Status |
| is_active | BOOLEAN | No | TRUE | Aktif |

---

# 7. Relationships

Belongs To

- Company

---

# 8. Index

- company_id
- category
- setting_key
- status

---

# 9. Unique

- company_id + category + setting_key

---

# 10. Audit

Mengikuti Base Entity.

---

# 11. Security

Setting yang bersifat sensitif wajib disimpan dalam bentuk terenkripsi.

Contoh:

- SMTP Password
- API Key
- WhatsApp Token
- Meta Ads Token
- Google Ads Token
- OpenAI API Key

---

# 12. Validation

Category

- wajib

Setting Key

- wajib
- unik dalam Category

Value Type

- wajib

---

# 13. Soft Delete

Menggunakan deleted_at.

---

# 14. Business Scenario

Category

Company

↓

company_name

company_logo

company_phone

---

Category

Booking

↓

booking_auto_number

booking_prefix

---

Category

AI

↓

default_model

default_language

system_prompt

---

Category

Notification

↓

smtp_host

smtp_port

whatsapp_api

---

# 15. Future Expansion

- Dynamic Configuration
- Feature Toggle
- Environment Configuration
- AI Configuration
- Workflow Configuration
- Dashboard Configuration