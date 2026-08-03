# COMPANY MANAGEMENT DOMAIN

Version : 1.0

Status : APPROVED

Domain Code : DOM-002

Last Updated : 2026-08-02

Owner : Business Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Company Management merupakan Domain yang mengelola seluruh struktur organisasi perusahaan pada ERP Travel AI Platform.

Domain ini menjadi fondasi seluruh operasional perusahaan mulai dari identitas perusahaan, struktur organisasi, pengguna, hingga konfigurasi perusahaan.

Seluruh Domain lain bergantung pada Company Management.

---

# Domain Scope

Domain Company Management mencakup:

- Company
- Branch
- Department
- Position
- Employee
- User
- Role
- Permission
- Business Unit
- Office
- Working Calendar
- Holiday Calendar
- Company Branding
- Subscription
- License
- Company Settings

---

# Domain Position

```

🌍 Global Location

↓

🏢 Company Management

↓

👤 Customer & Jamaah

↓

✈ Product Management

↓

📅 Booking

↓

💰 Finance

↓

📣 Marketing

↓

🤖 AI Intelligence

↓

📊 Executive Intelligence

↓

⚙ Platform Management

```

---

# Domain Objective

Domain ini bertujuan untuk:

- Mengelola identitas perusahaan.
- Mengelola struktur organisasi.
- Mengelola hak akses.
- Menjadi dasar Multi Tenant.
- Menjadi dasar konfigurasi perusahaan.
- Menjadi dasar AI Company Intelligence.

---

# Domain Output

Setelah Domain ini selesai, ERP memiliki kemampuan untuk:

- Membuat Company baru.
- Mengelola Cabang.
- Mengelola Struktur Organisasi.
- Mengelola User.
- Mengelola Permission.
- Mengelola Branding.
- Mengelola Subscription.

---

# Domain Dependency

Domain ini bergantung pada:

- Global Location

Domain yang bergantung pada Company Management:

- Customer & Jamaah
- Product Management
- Booking
- Finance
- Marketing
- AI Intelligence
- Executive Intelligence

---

# Golden Rules

- Seluruh data operasional harus dimiliki oleh satu Company.
- Setiap Company merupakan satu Tenant.
- Tidak boleh ada transaksi tanpa Company.
- Seluruh konfigurasi perusahaan berada di Domain ini.

---

# Domain Status

| Item | Status |
|------|--------|
| Business Domain | ✅ |
| Master Data | ⬜ |
| API | ⬜ |
| Flutter | ⬜ |
| AI | ⬜ |
| Dashboard | ⬜ |

---

# Reference

Domain ini mengacu pada:

- Project Constitution v2.0
- Project Bible
- Master Data Development Standard (MDS)
- Domain First Development (DDD-001)
- One Database Per Tenant Policy (AD-044)
- Company Boundary Policy (AD-056)

---

# Catatan

Company Management merupakan Domain kedua pada ERP Travel AI Platform dan menjadi Golden Standard bagi seluruh Domain organisasi.