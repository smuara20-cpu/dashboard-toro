# COMPANY MANAGEMENT BUSINESS CAPABILITIES

Version : 1.0

Status : APPROVED

Domain Code : DOM-002

Last Updated : 2026-08-02

Owner : Business Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan seluruh kemampuan bisnis (Business Capabilities) yang dimiliki oleh Domain Company Management.

Business Capability menjelaskan "apa yang mampu dilakukan" oleh Domain, bukan "bagaimana cara melakukannya".

---

# Core Business Capabilities

## BC-001

Company Registration

Kemampuan membuat Company baru sebagai Tenant.

---

## BC-002

Company Verification

Memverifikasi legalitas Company sebelum diaktifkan.

---

## BC-003

Company Profile Management

Mengelola identitas perusahaan.

Meliputi:

- Nama
- Logo
- Alamat
- Kontak
- NPWP / Tax ID
- Legal Entity

---

## BC-004

Branch Management

Mengelola seluruh cabang perusahaan.

---

## BC-005

Department Management

Mengelola struktur departemen.

---

## BC-006

Position Management

Mengelola jabatan dalam perusahaan.

---

## BC-007

Employee Management

Mengelola data karyawan.

---

## BC-008

User Management

Mengelola akun pengguna.

---

## BC-009

Role Management

Mengelola Role.

---

## BC-010

Permission Management

Mengelola hak akses.

---

## BC-011

Business Unit Management

Mengelola Business Unit.

---

## BC-012

Working Calendar Management

Mengelola hari kerja perusahaan.

---

## BC-013

Holiday Calendar Management

Mengelola hari libur perusahaan.

---

## BC-014

Company Branding

Mengelola:

- Logo
- Warna
- Tema
- Email Template
- Invoice Template

---

## BC-015

Subscription Management

Mengelola paket langganan.

---

## BC-016

License Management

Mengelola lisensi penggunaan sistem.

---

## BC-017

Company Settings

Mengelola seluruh konfigurasi perusahaan.

---

## BC-018

Organization Structure

Membangun struktur organisasi perusahaan.

---

## BC-019

Office Management

Mengelola kantor operasional.

---

## BC-020

Company Intelligence

Menyediakan data dasar bagi AI Company Intelligence.

---

# Capability Dependency

Business Capability ini digunakan oleh:

- Customer Management
- Booking
- Finance
- Marketing
- Dashboard
- AI Intelligence
- Executive Briefing

---

# Capability Level

| Capability | Priority |
|------------|----------|
| Company | Critical |
| Branch | Critical |
| User | Critical |
| Role | Critical |
| Permission | Critical |
| Department | High |
| Position | High |
| Employee | High |
| Branding | Medium |
| Subscription | Medium |
| License | Medium |

---

# Future Capabilities

Versi berikutnya dapat menambahkan:

- Multi Holding Company
- Franchise Management
- Partner Company
- Regional Office
- AI Organization Analysis
- Organization Performance Analytics

---

# Success Indicator

Domain Company Management dianggap lengkap apabila seluruh Business Capability telah tersedia dan dapat digunakan oleh Domain lain.

---

# Catatan

Business Capability menjadi dasar penyusunan Business Rules, Master Data, REST API, Flutter UI, AI, dan Dashboard.