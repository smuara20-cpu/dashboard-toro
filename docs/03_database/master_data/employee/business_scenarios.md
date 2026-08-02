# EMPLOYEE BUSINESS SCENARIOS

Version : 1.0

Status : APPROVED

Master Data Code : MD-EMPLOYEE

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Business Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendeskripsikan skenario penggunaan (Business Scenarios) Master Data Employee pada TIOS (Travel Intelligence Operating System).

Business Scenario menjadi acuan bagi Business Analyst, Backend Developer, Flutter Developer, QA Engineer, AI Engineer, Product Owner, dan Architecture Team.

---

# Business Scenario 001

Scenario ID

BS-EMPLOYEE-001

## Menambahkan Employee Baru

### Actor

- HR Manager
- Company Administrator

### Pre Condition

- Company aktif
- Branch aktif
- Department aktif
- Position aktif

### Flow

1. Membuka menu Employee.
2. Klik tombol **Tambah**.
3. Mengisi data dasar Employee.
4. Memilih Branch.
5. Memilih Department.
6. Memilih Position.
7. Menentukan Employment Status.
8. Klik **Simpan**.
9. Sistem membuat Employee ID otomatis.
10. Audit Log mencatat aktivitas.

### Expected Result

Employee berhasil dibuat.

---

# Business Scenario 002

Scenario ID

BS-EMPLOYEE-002

## Mutasi Employee

### Actor

- HR Manager

### Flow

1. Membuka data Employee.
2. Mengubah Branch, Department, atau Position.
3. Sistem memvalidasi struktur organisasi.
4. Riwayat mutasi disimpan.
5. Audit Log diperbarui.

### Expected Result

Employee berpindah penugasan tanpa kehilangan histori.

---

# Business Scenario 003

Scenario ID

BS-EMPLOYEE-003

## Menghubungkan Employee dengan User

### Actor

- Company Administrator

### Flow

1. Memilih Employee.
2. Menghubungkan dengan User Account.
3. Sistem memverifikasi bahwa User belum digunakan Employee lain.
4. Hubungan disimpan.

### Expected Result

Employee memiliki akun login.

---

# Business Scenario 004

Scenario ID

BS-EMPLOYEE-004

## Menonaktifkan Employee

### Actor

- HR Manager

### Flow

1. Mengubah Employee Status menjadi Inactive.
2. Sistem memutus akses operasional.
3. Histori tetap dipertahankan.
4. Audit Log diperbarui.

### Expected Result

Employee tidak aktif tetapi seluruh histori tetap tersedia.

---

# Business Scenario 005

Scenario ID

BS-EMPLOYEE-005

## AI Workforce Analytics

### Actor

- AI Organization Intelligence

### Flow

1. AI membaca data Employee.
2. AI menganalisis distribusi SDM.
3. AI membuat rekomendasi.
4. Tidak ada perubahan terhadap Master Data.

### Expected Result

AI menghasilkan rekomendasi untuk manajemen.

---

# Business Scenario 006

Scenario ID

BS-EMPLOYEE-006

## Executive Workforce Dashboard

### Actor

- Executive Briefing Engine

### Flow

1. Dashboard membaca data Employee.
2. Menampilkan jumlah Employee.
3. Menampilkan distribusi per Branch.
4. Menampilkan distribusi per Department.
5. Menampilkan distribusi per Employment Status.

### Expected Result

Manajemen memperoleh ringkasan kondisi SDM.

---

# Business Scenario 007

Scenario ID

BS-EMPLOYEE-007

## Multi-Tenant Isolation

### Actor

- REST API

### Flow

1. API menerima request.
2. Company diidentifikasi.
3. Data Employee difilter berdasarkan Company.
4. Employee milik Company lain tidak dapat diakses.

### Expected Result

Data tetap terisolasi sesuai Company Boundary.

---

# Exception Scenario

## Position Closed

Expected Result

Employee tidak dapat ditempatkan.

---

## Branch tidak valid

Expected Result

Validasi gagal.

---

## User sudah digunakan Employee lain

Expected Result

Validasi gagal.

---

## Employee dihapus

Expected Result

Menggunakan Soft Delete.

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