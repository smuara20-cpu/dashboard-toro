# COMPANY BUSINESS SCENARIOS

Version : 1.0

Status : APPROVED

Master Data Code : MD-COMPANY

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Business Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendeskripsikan skenario penggunaan (Business Scenarios) Master Data Company pada ERP Travel AI Platform.

Business Scenario menjadi acuan bagi Business Analyst, Backend Developer, Flutter Developer, QA Engineer, AI Engineer, dan Product Owner dalam memahami bagaimana Master Data Company digunakan pada proses bisnis nyata.

---

# Business Scenario 001

## Registrasi Company Baru

### Actor

- Super Administrator

### Pre Condition

- Tenant belum memiliki Company.

### Flow

1. Super Administrator membuat Company baru.
2. Sistem menghasilkan `company_id` dan `company_code`.
3. Company berstatus **Registered**.
4. Audit Log mencatat proses registrasi.

### Expected Result

Company berhasil dibuat dan siap untuk proses verifikasi.

---

# Business Scenario 002

## Verifikasi Company

### Actor

- Platform Administrator

### Flow

1. Dokumen legal perusahaan diverifikasi.
2. Status berubah menjadi **Verified**.
3. Audit Log mencatat perubahan status.

### Expected Result

Company dapat diaktifkan.

---

# Business Scenario 003

## Aktivasi Company

### Actor

- Platform Administrator

### Flow

1. Company yang telah diverifikasi diaktifkan.
2. Status berubah menjadi **Active**.
3. Company dapat mulai membuat Branch, Employee, dan User.

### Expected Result

Company siap digunakan untuk operasional.

---

# Business Scenario 004

## Perubahan Profil Company

### Actor

- Company Administrator

### Flow

1. Administrator mengubah informasi Company.
2. Sistem memvalidasi data.
3. Audit Log mencatat perubahan.
4. Informasi terbaru langsung digunakan oleh seluruh modul.

### Expected Result

Profil Company berhasil diperbarui.

---

# Business Scenario 005

## Penambahan Branch Pertama

### Actor

- Company Administrator

### Pre Condition

- Company berstatus Active.

### Flow

1. Administrator membuat Branch pertama.
2. Branch terhubung ke Company.
3. Branch siap digunakan oleh modul lain.

### Expected Result

Branch berhasil dibuat.

---

# Business Scenario 006

## Penangguhan Company

### Actor

- Platform Administrator

### Flow

1. Status Company diubah menjadi **Suspended**.
2. Login pengguna dapat dibatasi sesuai kebijakan.
3. Data historis tetap tersedia.
4. Audit Log mencatat seluruh proses.

### Expected Result

Company tidak dapat melakukan transaksi baru selama status Suspended.

---

# Business Scenario 007

## Pengarsipan Company

### Actor

- Platform Administrator

### Flow

1. Company dinonaktifkan.
2. Status berubah menjadi **Archived**.
3. Seluruh data tetap tersimpan.
4. Tidak ada transaksi baru yang dapat dibuat.

### Expected Result

Company berpindah ke status arsip tanpa kehilangan histori.

---

# Business Scenario 008

## Executive Briefing

### Actor

- Executive Briefing Engine

### Flow

1. Engine mengambil data Company.
2. Memastikan Company berstatus Active.
3. Menghasilkan ringkasan operasional sesuai data aplikasi.
4. Mengirimkan briefing sesuai konfigurasi Company.

### Expected Result

Executive menerima briefing sesuai jadwal dan hak akses.

---

# Business Scenario 009

## AI Company Intelligence

### Actor

- AI Company Intelligence

### Flow

1. AI membaca data Company sesuai Permission.
2. AI melakukan analisis.
3. AI menghasilkan rekomendasi.
4. AI tidak mengubah Master Data Company.

### Expected Result

Rekomendasi diberikan tanpa mengubah data.

---

# Business Scenario 010

## Multi-Tenant Isolation

### Actor

- REST API

### Flow

1. API menerima permintaan.
2. Sistem mengidentifikasi Tenant.
3. Data hanya diambil dari Company yang sesuai.
4. Tidak ada akses ke Company lain.

### Expected Result

Isolasi data antar Company terjaga.

---

# Exception Scenario

## Company Belum Active

Expected Result

- Tidak dapat membuat Branch.
- Tidak dapat membuat User operasional.
- Tidak dapat membuat transaksi.

---

## Company Archived

Expected Result

- Tidak dapat login (sesuai kebijakan perusahaan).
- Tidak dapat membuat transaksi baru.
- Histori tetap dapat diakses sesuai Permission.

---

# Related Documents

- business_rules.md
- validation_rules.md
- data_dictionary.md
- erd.md
- sample_data.md

---

# Catatan

Business Scenario digunakan sebagai dasar penyusunan Test Case, REST API Flow, Flutter Flow, AI Workflow, serta User Acceptance Test (UAT). Seluruh skenario harus mengacu pada Business Rules yang telah disetujui.