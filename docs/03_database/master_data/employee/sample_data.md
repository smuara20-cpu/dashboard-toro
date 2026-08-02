# EMPLOYEE SAMPLE DATA

Version : 1.0

Status : APPROVED

Master Data Code : MD-EMPLOYEE

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Database Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini menyediakan contoh data (Sample Data) untuk Master Data Employee.

Sample Data digunakan untuk:

- Seeder Database
- REST API Testing
- Flutter Development
- AI Testing
- QA Testing
- Dashboard Demo
- User Acceptance Test (UAT)

Seluruh Sample Data bersifat fiktif dan tidak digunakan sebagai data produksi.

---

# Happy Path

## SD-EMPLOYEE-001

### Employee Tetap

| Field | Value |
|--------|-------|
| Employee Code | EMP-000001 |
| Full Name | Ahmad Fauzi |
| Company | Toro Travel Indonesia |
| Branch | Jakarta Head Office |
| Department | Tour Operation |
| Position | Tour Leader |
| Employment Status | Permanent |
| Employee Status | Active |

---

## SD-EMPLOYEE-002

### Employee Kontrak

| Field | Value |
|--------|-------|
| Employee Code | EMP-000002 |
| Full Name | Rina Maharani |
| Company | Toro Travel Indonesia |
| Branch | Bandung Branch |
| Department | Marketing |
| Position | Digital Marketing Staff |
| Employment Status | Contract |
| Employee Status | Active |

---

## SD-EMPLOYEE-003

### Finance Manager

| Field | Value |
|--------|-------|
| Employee Code | EMP-000003 |
| Full Name | Hendra Saputra |
| Company | Toro Travel Indonesia |
| Branch | Jakarta Head Office |
| Department | Finance |
| Position | Finance Manager |
| Employment Status | Permanent |
| Employee Status | Active |

---

## SD-EMPLOYEE-004

### Customer Service

| Field | Value |
|--------|-------|
| Employee Code | EMP-000004 |
| Full Name | Siti Rahmawati |
| Company | Toro Travel Indonesia |
| Branch | Surabaya Branch |
| Department | Customer Service |
| Position | Customer Service Officer |
| Employment Status | Probation |
| Employee Status | Active |

---

# Edge Case

## SD-EMPLOYEE-005

Employee belum memiliki User Account.

Expected Result

Tetap valid.

---

## SD-EMPLOYEE-006

Employee belum memiliki Photo.

Expected Result

Tetap valid.

---

## Negative Case

## SD-EMPLOYEE-007

Employee tanpa Position.

Expected Result

Validation Error.

---

## SD-EMPLOYEE-008

Employee ditempatkan pada Position berstatus Closed.

Expected Result

Validation Error.

---

## SD-EMPLOYEE-009

Employee memiliki Join Date di masa depan.

Expected Result

Validation Error.

---

## SD-EMPLOYEE-010

Employee dihapus padahal memiliki histori transaksi.

Expected Result

Soft Delete digunakan.

---

# Performance Case

Digunakan untuk Benchmark.

Contoh:

- 1 Company
- 200 Branch
- 5.000 Department
- 25.000 Position
- 100.000 Employee

Digunakan untuk:

- Dashboard
- HR Analytics
- Executive Briefing
- AI Workforce Analytics

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

- Create Employee
- Update Employee
- Search Employee
- Filter Employee
- Employee Lookup
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

Seluruh Sample Data mengikuti Sample ID Standard dan digunakan sebagai acuan resmi untuk pengembangan, pengujian, demonstrasi, dan pelatihan sistem.