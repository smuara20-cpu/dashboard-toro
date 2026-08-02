# POSITION SAMPLE DATA

Version : 1.0

Status : APPROVED

Master Data Code : MD-POSITION

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Database Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini menyediakan contoh data (Sample Data) untuk Master Data Position.

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

## SD-POSITION-001

### Chief Executive Officer

| Field | Value |
|--------|-------|
| Company | Toro Travel Indonesia |
| Branch | Jakarta Head Office |
| Department | Executive Office |
| Position Code | CEO |
| Position Name | Chief Executive Officer |
| Position Status | Active |

---

## SD-POSITION-002

### Finance Manager

| Field | Value |
|--------|-------|
| Company | Toro Travel Indonesia |
| Branch | Jakarta Head Office |
| Department | Finance |
| Position Code | FIN-MGR |
| Position Name | Finance Manager |
| Position Status | Active |

---

## SD-POSITION-003

### Tour Leader

| Field | Value |
|--------|-------|
| Company | Toro Travel Indonesia |
| Branch | Jakarta Head Office |
| Department | Tour Operation |
| Position Code | TL |
| Position Name | Tour Leader |
| Position Status | Active |

---

## SD-POSITION-004

### Customer Service

| Field | Value |
|--------|-------|
| Company | Toro Travel Indonesia |
| Branch | Bandung Branch |
| Department | Customer Service |
| Position Code | CS |
| Position Name | Customer Service |
| Position Status | Active |

---

# Edge Case

## SD-POSITION-005

Position belum memiliki Parent Position.

Expected Result

Tetap valid.

---

## SD-POSITION-006

Position belum memiliki Description.

Expected Result

Tetap valid.

---

# Negative Case

## SD-POSITION-007

Position Code Duplicate pada Department yang sama.

Expected Result

Validation Error.

---

## SD-POSITION-008

Position tanpa Department.

Expected Result

Validation Error.

---

## SD-POSITION-009

Parent Position berasal dari Department lain.

Expected Result

Validation Error.

---

## SD-POSITION-010

Position berstatus Closed menerima Employee baru.

Expected Result

Transaksi ditolak.

---

# Performance Case

Digunakan untuk Benchmark.

Contoh:

- 1 Company
- 200 Branch
- 5.000 Department
- 25.000 Position
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

- Create Position
- Update Position
- Search Position
- Filter Position
- Position Lookup
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