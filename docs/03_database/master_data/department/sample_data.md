# DEPARTMENT SAMPLE DATA

Version : 1.0

Status : APPROVED

Master Data Code : MD-DEPARTMENT

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Database Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini menyediakan contoh data (Sample Data) untuk Master Data Department.

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

## SD-DEPARTMENT-001

### Sales Department

| Field | Value |
|--------|-------|
| Company | Toro Travel Indonesia |
| Branch | Jakarta Head Office |
| Department Code | SALES |
| Department Name | Sales Department |
| Department Category | Sales |
| Department Head | Ahmad Fauzi |
| Status | Active |

---

## SD-DEPARTMENT-002

### Marketing Department

| Field | Value |
|--------|-------|
| Company | Toro Travel Indonesia |
| Branch | Jakarta Head Office |
| Department Code | MKT |
| Department Name | Marketing Department |
| Department Category | Marketing |
| Department Head | Rina Maharani |
| Status | Active |

---

## SD-DEPARTMENT-003

### Umrah Operation

| Field | Value |
|--------|-------|
| Company | Toro Travel Indonesia |
| Branch | Jakarta Head Office |
| Department Code | UMO |
| Department Name | Umrah Operation |
| Department Category | Operations |
| Department Head | Hendra Saputra |
| Status | Active |

---

## SD-DEPARTMENT-004

### Finance

| Field | Value |
|--------|-------|
| Company | Toro Travel Indonesia |
| Branch | Bandung Branch |
| Department Code | FIN |
| Department Name | Finance Department |
| Department Category | Finance |
| Status | Active |

---

# Edge Case

## SD-DEPARTMENT-005

Department belum memiliki Department Head.

Expected Result

Tetap valid.

---

## SD-DEPARTMENT-006

Department memiliki Description kosong.

Expected Result

Tetap valid.

---

# Negative Case

## SD-DEPARTMENT-007

Department Code Duplicate pada Branch yang sama.

Expected Result

Validation Error.

---

## SD-DEPARTMENT-008

Department tanpa Branch.

Expected Result

Validation Error.

---

## SD-DEPARTMENT-009

Department Head berasal dari Branch lain.

Expected Result

Validation Error.

---

## SD-DEPARTMENT-010

Department berstatus Closed menerima Employee baru.

Expected Result

Transaksi ditolak.

---

# Performance Case

Digunakan untuk Benchmark.

Contoh:

- 1 Company
- 200 Branch
- 5.000 Department
- 100.000 Position
- 500.000 Employee

Digunakan untuk:

- Dashboard
- AI Analytics
- Organization Chart
- Executive Briefing

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

- Create Department
- Update Department
- Search Department
- Filter Department
- Department Lookup
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