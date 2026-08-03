# BRANCH BUSINESS SCENARIOS

Version : 1.0

Status : APPROVED

Master Data Code : MD-BRANCH

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Business Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendeskripsikan skenario penggunaan (Business Scenarios) Master Data Branch pada TIOS (Travel Intelligence Operating System).

Business Scenario menjadi acuan bagi Business Analyst, Backend Developer, Flutter Developer, QA Engineer, AI Engineer, Product Owner, dan Architecture Team.

---

# Business Scenario 001

Sample ID

BS-BRANCH-001

## Membuat Branch Baru

### Actor

- Company Administrator

### Pre Condition

- Company berstatus Active.

### Flow

1. Administrator memilih menu Branch.
2. Administrator mengisi informasi Branch.
3. Sistem melakukan validasi.
4. Branch disimpan.
5. Audit Log mencatat proses.

### Expected Result

Branch berhasil dibuat.

---

# Business Scenario 002

Sample ID

BS-BRANCH-002

## Menunjuk Branch Manager

### Actor

- Company Administrator

### Flow

1. Administrator memilih Employee.
2. Employee aktif dipilih sebagai Branch Manager.
3. Sistem memverifikasi Company yang sama.
4. Data diperbarui.
5. Audit Log mencatat perubahan.

### Expected Result

Branch memiliki Manager aktif.

---

# Business Scenario 003

Sample ID

BS-BRANCH-003

## Mengubah Status Branch

### Actor

- Company Administrator

### Flow

1. Administrator mengubah status Branch.
2. Sistem melakukan validasi.
3. Audit Log mencatat perubahan.

### Expected Result

Status Branch berhasil diperbarui.

---

# Business Scenario 004

Sample ID

BS-BRANCH-004

## Branch Ditutup

### Actor

- Company Administrator

### Flow

1. Status Branch diubah menjadi Closed.
2. Sistem menghentikan transaksi baru.
3. Data historis tetap tersedia.

### Expected Result

Branch tidak dapat menerima transaksi baru.

---

# Business Scenario 005

Sample ID

BS-BRANCH-005

## Executive Branch Performance

### Actor

- Executive Briefing Engine

### Flow

1. Engine mengambil data seluruh Branch.
2. AI menghitung KPI.
3. Dashboard menampilkan performa tiap Branch.

### Expected Result

Executive memperoleh ringkasan performa cabang.

---

# Business Scenario 006

Sample ID

BS-BRANCH-006

## AI Branch Recommendation

### Actor

- AI Branch Intelligence

### Flow

1. AI membaca data Branch.
2. AI menganalisis performa.
3. AI memberikan rekomendasi peningkatan.

### Expected Result

Rekomendasi tersedia tanpa mengubah Master Data.

---

# Business Scenario 007

Sample ID

BS-BRANCH-007

## Multi-Tenant Isolation

### Actor

- REST API

### Flow

1. API menerima request.
2. Tenant diidentifikasi.
3. Data Branch difilter berdasarkan Company.
4. Branch Company lain tidak dapat diakses.

### Expected Result

Data antar Company tetap terisolasi.

---

# Exception Scenario

## Branch Closed

Expected Result

- Tidak dapat membuat Booking baru.
- Tidak dapat menerima Customer baru.
- Tidak dapat membuat transaksi operasional.

---

## Branch tanpa Company

Expected Result

Validasi gagal.

Branch tidak dapat disimpan.

---

## Branch Manager bukan Employee aktif

Expected Result

Validasi gagal.

Penunjukan Manager ditolak.

---

# Related Documents

- business_rules.md
- validation_rules.md
- data_dictionary.md
- erd.md
- sample_data.md

---

# Catatan

Business Scenario menjadi dasar penyusunan Test Case, API Flow, Flutter Flow, AI Workflow, Dashboard Flow, serta User Acceptance Test (UAT).

Seluruh skenario wajib mengacu pada Business Rules yang telah disetujui.