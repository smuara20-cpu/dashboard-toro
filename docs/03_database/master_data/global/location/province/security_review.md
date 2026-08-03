# PROVINCE SECURITY REVIEW

Version : 1.0

---

# Tujuan

Dokumen ini menjelaskan standar keamanan Master Data Province.

Dokumen ini menjadi acuan implementasi:

- PostgreSQL
- Supabase RLS
- API Authorization
- Flutter Permission
- AI Access Control

---

# Klasifikasi Data

Province termasuk:

Global Reference Data

Province digunakan oleh seluruh Company sebagai referensi wilayah administratif.

Province bukan merupakan data transaksi.

---

# Tingkat Sensitivitas

| Jenis | Level |
|--------|-------|
| Confidential | Rendah |
| Integrity | Sangat Tinggi |
| Availability | Sangat Tinggi |

---

# Hak Akses

| Role | Read | Create | Update | Delete |
|------|------|--------|--------|--------|
| Platform Super Admin | ✅ | ✅ | ✅ | ✅ |
| Platform Administrator | ✅ | ✅ | ✅ | ❌ |
| Company Owner | ✅ | ❌ | ❌ | ❌ |
| CEO | ✅ | ❌ | ❌ | ❌ |
| Manager | ✅ | ❌ | ❌ | ❌ |
| Staff | ✅ | ❌ | ❌ | ❌ |
| Customer | ✅* | ❌ | ❌ | ❌ |
| Jamaah | ✅* | ❌ | ❌ | ❌ |
| AI Agent | ✅ | ❌ | ❌ | ❌ |

---

## Catatan

Customer dan Jamaah hanya dapat membaca Province yang dipublikasikan melalui API.

---

# Row Level Security

Province merupakan Global Master Data.

Province tidak menggunakan company_id.

Seluruh Company menggunakan referensi Province yang sama.

---

# Soft Delete

Province tidak boleh dihapus apabila:

- masih memiliki City
- masih digunakan oleh Company
- masih digunakan oleh Branch
- masih digunakan oleh Customer
- masih digunakan oleh Jamaah
- masih digunakan oleh Vendor
- masih digunakan oleh Supplier
- masih digunakan oleh Hotel
- masih digunakan oleh Airport

Jika masih digunakan,

Delete ditolak.

---

# Audit

Seluruh aktivitas wajib dicatat.

Audit meliputi:

- User
- Role
- Company
- IP Address
- Device
- Browser
- Waktu
- Nilai Lama
- Nilai Baru

---

# API Security

Seluruh API wajib:

- Authentication
- Authorization
- Rate Limiting
- Audit Logging

---

# Validation Security

Province Name wajib unik dalam Country yang sama.

Province Code tidak boleh duplikat dalam Country yang sama.

ISO Subdivision Code tidak boleh duplikat dalam Country yang sama.

---

# Import Security

Import hanya dapat dilakukan oleh:

- Platform Super Admin
- Platform Administrator

Import wajib menggunakan template resmi ERP.

Import wajib menghasilkan Audit Log.

---

# AI Security

AI hanya dapat membaca data Province.

AI tidak dapat:

- Create
- Update
- Delete

AI menggunakan Province sebagai Knowledge Reference.

---

# Backup

Province termasuk Master Data penting.

Backup mengikuti jadwal Backup Master Data.

Restore wajib menjaga seluruh Foreign Key.

---

# Monitoring

Aktivitas berikut wajib dimonitor:

- Create Province
- Update Province
- Delete Province
- Import Province
- Export Province

---

# Future Expansion

Security dapat dikembangkan dengan:

- Multi Level Approval
- Digital Signature
- Change Request
- Versioning
- Data Classification
- AI Security Policy

---

# Security Checklist

| Item | Status |
|------|--------|
| Authentication | ✅ |
| Authorization | ✅ |
| Audit Log | ✅ |
| Soft Delete | ✅ |
| Backup | ✅ |
| Restore | ✅ |
| Import Validation | ✅ |
| API Protection | ✅ |
| AI Access Control | ✅ |

---

# Catatan

Province merupakan Global Master Data.

Seluruh perubahan wajib dapat ditelusuri melalui Audit Log.