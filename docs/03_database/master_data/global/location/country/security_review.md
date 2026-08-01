# COUNTRY SECURITY REVIEW

Version : 1.0

---

# Tujuan

Dokumen ini menjelaskan standar keamanan Master Data Country.

Dokumen ini menjadi acuan implementasi:

- PostgreSQL
- Supabase RLS
- API Authorization
- Flutter Permission
- AI Access Control

---

# Klasifikasi Data

Master Data Country termasuk:

Public Reference Data

Data bersifat global dan digunakan oleh seluruh Company.

Country bukan merupakan data transaksi.

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

Customer dan Jamaah hanya dapat membaca Country yang dipublikasikan melalui API.

Tidak dapat mengakses seluruh atribut internal.

---

# Row Level Security

Country merupakan Global Master.

Tidak menggunakan company_id.

Seluruh Company menggunakan referensi Country yang sama.

---

# Soft Delete

Country tidak boleh dihapus apabila:

- digunakan Company
- digunakan Branch
- digunakan Customer
- digunakan Jamaah
- digunakan Vendor
- digunakan Supplier
- digunakan Hotel
- digunakan Airport

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

ISO Code wajib unik.

Country Name wajib unik.

Tidak boleh terdapat Country duplikat.

---

# Import Security

Import hanya dapat dilakukan oleh:

- Platform Super Admin
- Platform Administrator

Import wajib menggunakan template resmi.

Import wajib menghasilkan Audit Log.

---

# AI Security

AI hanya dapat membaca data Country.

AI tidak dapat:

- Create
- Update
- Delete

AI menggunakan Country sebagai Knowledge Reference.

---

# Backup

Country termasuk Master Data kritikal.

Backup mengikuti jadwal Backup Master Data.

Restore wajib menjaga seluruh Foreign Key.

---

# Monitoring

Aktivitas berikut wajib dimonitor:

- Create Country
- Update Country
- Delete Country
- Import Country
- Export Country

---

# Future Expansion

Security dapat dikembangkan dengan:

- Approval Workflow
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

Country merupakan Global Master Data.

Integritas data lebih penting daripada kemudahan perubahan.

Seluruh perubahan wajib dapat ditelusuri melalui Audit Log.