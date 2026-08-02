# POSITION BUSINESS SCENARIOS

Version : 1.0

Status : APPROVED

Master Data Code : MD-POSITION

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Business Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendeskripsikan skenario penggunaan (Business Scenarios) Master Data Position pada TIOS (Travel Intelligence Operating System).

Business Scenario menjadi acuan bagi Business Analyst, Backend Developer, Flutter Developer, QA Engineer, AI Engineer, Product Owner, dan Architecture Team.

---

# Business Scenario 001

Scenario ID

BS-POSITION-001

## Membuat Position Baru

### Actor

- Company Administrator
- HR Manager

### Pre Condition

- Company berstatus Active.
- Branch berstatus Active.
- Department berstatus Active.

### Flow

1. Pengguna membuka menu Position.
2. Memilih Department.
3. Mengisi Position Code.
4. Mengisi Position Name.
5. Menentukan Parent Position (opsional).
6. Sistem melakukan validasi.
7. Position disimpan.
8. Audit Log mencatat aktivitas.

### Expected Result

Position berhasil dibuat.

---

# Business Scenario 002

Scenario ID

BS-POSITION-002

## Menentukan Parent Position

### Actor

- HR Manager

### Flow

1. Memilih Position.
2. Menentukan Parent Position.
3. Sistem memastikan Parent Position berada pada Department yang sama.
4. Struktur organisasi diperbarui.

### Expected Result

Reporting Line berhasil dibuat.

---

# Business Scenario 003

Scenario ID

BS-POSITION-003

## Menutup Position

### Actor

- Company Administrator

### Flow

1. Status Position diubah menjadi Closed.
2. Sistem memverifikasi tidak ada Employee aktif yang masih menggunakan Position tersebut.
3. Audit Log mencatat perubahan.

### Expected Result

Position berhasil ditutup.

---

# Business Scenario 004

Scenario ID

BS-POSITION-004

## Menambahkan Employee ke Position

### Actor

- HR Manager

### Flow

1. Memilih Employee.
2. Memilih Position.
3. Sistem memverifikasi Position berstatus Active.
4. Sistem memverifikasi kapasitas Position (max_employee).
5. Employee ditempatkan pada Position.

### Expected Result

Employee berhasil menempati Position.

---

# Business Scenario 005

Scenario ID

BS-POSITION-005

## Executive Organization Review

### Actor

- Executive Briefing Engine

### Flow

1. AI membaca struktur Position.
2. AI menganalisis distribusi jabatan.
3. Dashboard menampilkan ringkasan organisasi.

### Expected Result

Executive memperoleh gambaran struktur organisasi.

---

# Business Scenario 006

Scenario ID

BS-POSITION-006

## AI Workforce Analytics

### Actor

- AI Organization Intelligence

### Flow

1. AI membaca seluruh Position.
2. AI menganalisis beban organisasi.
3. AI memberikan rekomendasi tanpa mengubah Master Data.

### Expected Result

Rekomendasi tersedia untuk manajemen.

---

# Business Scenario 007

Scenario ID

BS-POSITION-007

## Multi-Tenant Isolation

### Actor

- REST API

### Flow

1. API menerima request.
2. Tenant diidentifikasi.
3. Data Position difilter berdasarkan Company.
4. Position milik Company lain tidak dapat diakses.

### Expected Result

Data tetap terisolasi sesuai Company Boundary.

---

# Exception Scenario

## Position Closed

Expected Result

- Tidak dapat menerima Employee baru.
- Tidak dapat digunakan untuk penempatan organisasi.

---

## Position tanpa Department

Expected Result

Validasi gagal.

Position tidak dapat disimpan.

---

## Parent Position tidak valid

Expected Result

Validasi gagal.

Struktur organisasi tidak diperbarui.

---

# Related Documents

- business_rules.md
- validation_rules.md
- data_dictionary.md
- erd.md
- sample_data.md

---

# Catatan

Business Scenario menjadi dasar penyusunan Test Case, REST API Flow, Flutter Flow, AI Workflow, Dashboard Flow, dan User Acceptance Test (UAT).

Seluruh skenario wajib mengacu pada Business Rules yang telah disetujui.