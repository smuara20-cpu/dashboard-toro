# BRANCH SAMPLE DATA

Version : 1.0

Status : APPROVED

Master Data Code : MD-BRANCH

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Database Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini menyediakan contoh data (Sample Data) untuk Master Data Branch.

Sample Data digunakan untuk:

- Seeder Database
- REST API Testing
- Flutter Development
- AI Testing
- QA Testing
- Dashboard Demo
- User Acceptance Test (UAT)

Sample Data bukan merupakan data produksi.

---

# Happy Path

## Sample Data 001

### Head Office

| Field | Value |
|--------|-------|
| Company | Toro Travel Indonesia |
| Branch Code | HO-JKT |
| Branch Name | Jakarta Head Office |
| Branch Type | Head Office |
| Branch Status | Active |
| Branch Manager | Ahmad Fauzi |
| Country | Indonesia |
| Province | DKI Jakarta |
| City | Jakarta Utara |
| District | Penjaringan |
| Village | Penjaringan |
| Postal Code | 14440 |
| Email | headoffice@torotravel.com |
| Phone | +622112345678 |
| Website | https://www.torotravel.com |

---

## Sample Data 002

### Branch Office

| Field | Value |
|--------|-------|
| Company | Toro Travel Indonesia |
| Branch Code | BDG-001 |
| Branch Name | Bandung Branch |
| Branch Type | Branch Office |
| Branch Status | Active |
| Country | Indonesia |
| Province | Jawa Barat |
| City | Bandung |

---

## Sample Data 003

### Representative Office

| Field | Value |
|--------|-------|
| Company | Toro Travel Indonesia |
| Branch Code | JED-REP |
| Branch Name | Jeddah Representative Office |
| Branch Type | Representative Office |
| Branch Status | Active |
| Country | Saudi Arabia |

---

# Edge Case

## Sample Data 004

Branch tanpa:

- Website
- Logo (Future)
- Branch Manager

Namun tetap valid.

---

# Negative Case

## Sample Data 005

Branch Code Duplicate

Expected Result

Validation Error

---

## Sample Data 006

Branch tanpa Company

Expected Result

Validation Error

---

## Sample Data 007

Branch menggunakan Country yang tidak tersedia

Expected Result

Validation Error

---

## Sample Data 008

Branch berstatus Closed tetapi mencoba membuat Booking

Expected Result

Transaksi ditolak.

---

# Performance Case

Digunakan untuk Benchmark.

Contoh:

- 1 Company
- 500 Branch
- 20.000 Employee
- 5.000.000 Booking

Digunakan untuk:

- Dashboard
- AI Analytics
- Reporting
- Search Benchmark

---

# Seeder Purpose

Sample Data digunakan untuk:

- Initial Seeder
- Unit Test
- Integration Test
- QA Testing
- Flutter UI Demo
- AI Simulation

---

# Test Scenario

Sample Data harus mendukung:

- Create Branch
- Update Branch
- Search Branch
- Filter Branch
- Branch Lookup
- Dashboard Analytics

---

# AI Usage

AI hanya menggunakan Sample Data untuk:

- Development
- Testing
- Recommendation Simulation

AI tidak menganggap Sample Data sebagai data operasional.

---

# Data Quality

Sample Data harus:

- Konsisten
- Valid
- Tidak Duplikat
- Mudah Dipahami
- Mewakili Berbagai Kondisi Bisnis

---

# Related Documents

- business_rules.md
- validation_rules.md
- data_dictionary.md
- erd.md

---

# Catatan

Seluruh Sample Data merupakan data fiktif dan hanya digunakan untuk kebutuhan pengembangan, pengujian, demonstrasi, dan pelatihan sistem.