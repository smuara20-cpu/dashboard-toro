# DEPARTMENT BUSINESS SCENARIOS

Version : 1.0

Status : APPROVED

Master Data Code : MD-DEPARTMENT

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Business Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendeskripsikan skenario penggunaan (Business Scenarios) Master Data Department pada TIOS (Travel Intelligence Operating System).

Business Scenario menjadi acuan bagi Business Analyst, Backend Developer, Flutter Developer, QA Engineer, AI Engineer, Product Owner, dan Architecture Team.

---

# Business Scenario 001

Scenario ID

BS-DEPARTMENT-001

## Membuat Department Baru

### Actor

- Company Administrator

### Pre Condition

- Company berstatus Active.
- Branch berstatus Active.

### Flow

1. Administrator membuka menu Department.
2. Administrator memilih Branch.
3. Administrator mengisi Department Code.
4. Administrator mengisi Department Name.
5. Administrator memilih Department Category.
6. Sistem melakukan validasi.
7. Department disimpan.
8. Audit Log mencatat proses.

### Expected Result

Department berhasil dibuat.

---

# Business Scenario 002

Scenario ID

BS-DEPARTMENT-002

## Menunjuk Department Head

### Actor

- Company Administrator

### Flow

1. Administrator memilih Employee.
2. Sistem memastikan Employee berasal dari Department yang sama.
3. Sistem memastikan Employee berstatus Active.
4. Department Head diperbarui.
5. Audit Log mencatat perubahan.

### Expected Result

Department memiliki Department Head yang valid.

---

# Business Scenario 003

Scenario ID

BS-DEPARTMENT-003

## Mengubah Status Department

### Actor

- Company Administrator

### Flow

1. Administrator mengubah Status Department.
2. Sistem melakukan validasi.
3. Audit Log mencatat perubahan.

### Expected Result

Status Department berhasil diperbarui.

---

# Business Scenario 004

Scenario ID

BS-DEPARTMENT-004

## Menutup Department

### Actor

- Company Administrator

### Flow

1. Status Department diubah menjadi Closed.
2. Sistem menghentikan penambahan Position baru.
3. Sistem menghentikan penambahan Employee baru.
4. Histori tetap tersedia.

### Expected Result

Department tidak menerima data operasional baru.

---

# Business Scenario 005

Scenario ID

BS-DEPARTMENT-005

## Executive Department Performance

### Actor

- Executive Briefing Engine

### Flow

1. Engine mengambil data Department.
2. AI menghitung KPI Department.
3. Dashboard menampilkan performa setiap Department.

### Expected Result

Executive memperoleh ringkasan performa Department.

---

# Business Scenario 006

Scenario ID

BS-DEPARTMENT-006

## AI Department Analytics

### Actor

- AI Organization Intelligence

### Flow

1. AI membaca data Department.
2. AI menganalisis beban kerja.
3. AI menghasilkan rekomendasi organisasi.
4. AI tidak mengubah Master Data Department.

### Expected Result

Rekomendasi tersedia tanpa mengubah data.

---

# Business Scenario 007

Scenario ID

BS-DEPARTMENT-007

## Multi-Tenant Isolation

### Actor

- REST API

### Flow

1. API menerima request.
2. Tenant diidentifikasi.
3. Data Department difilter berdasarkan Company.
4. Department Company lain tidak dapat diakses.

### Expected Result

Data tetap terisolasi sesuai Company Boundary.

---

# Exception Scenario

## Department Closed

Expected Result

- Tidak dapat membuat Position baru.
- Tidak dapat menambah Employee baru.

---

## Department tanpa Branch

Expected Result

Validasi gagal.

Department tidak dapat disimpan.

---

## Department Head berasal dari Branch lain

Expected Result

Validasi gagal.

Department Head ditolak.

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