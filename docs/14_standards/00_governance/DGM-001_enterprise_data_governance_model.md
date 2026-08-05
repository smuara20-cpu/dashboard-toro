# DGM-001 — Enterprise Data Governance Model

Version : 1.0

Status : APPROVED

Document Code : DGM-001

Category : Governance Standard

Priority : CORE

Owner : Enterprise Architecture Team

Approval : APPROVED

---

# Purpose

Enterprise Data Governance Model menetapkan tata kelola seluruh data pada VENTRA agar memiliki kepemilikan yang jelas, kualitas yang terjaga, hak akses yang terkontrol, dan siklus hidup yang terdokumentasi.

---

# Philosophy

> Every Data Has an Owner.
>
> Every Owner Has Responsibility.

---

# Objectives

Data Governance bertujuan untuk:

- Menjaga kualitas data.
- Menentukan kepemilikan data.
- Menentukan hak akses data.
- Menghindari duplikasi.
- Mempermudah audit.
- Mendukung AI dengan data yang terpercaya.

---

# Governance Roles

## Data Owner

Pemilik bisnis dari suatu data.

Contoh:

Customer → CRM Domain

Booking → Booking Domain

Payment → Finance Domain

Passport → Document Domain

---

## Data Steward

Pihak yang menjaga kualitas data.

Contoh:

CRM Manager

Finance Manager

Operation Manager

---

## Data Custodian

Pihak yang bertanggung jawab terhadap penyimpanan dan keamanan data.

Contoh:

System Administrator

Database Administrator

Cloud Administrator

---

# Data Classification

Setiap data wajib memiliki klasifikasi.

- Public
- Internal
- Confidential
- Sensitive

---

# Data Quality

Setiap data harus memenuhi:

- Accuracy
- Completeness
- Consistency
- Timeliness
- Validity
- Uniqueness

---

# Data Lifecycle

Setiap data memiliki siklus hidup yang jelas.

Contoh:

Lead

↓

Customer

↓

Repeat Customer

↓

Archived

---

# Data Retention

Setiap data memiliki kebijakan retensi sesuai kebutuhan bisnis dan regulasi.

---

# Data Lineage

Seluruh perubahan data harus dapat ditelusuri.

---

# Data Access

Hak akses mengikuti:

- Role
- Persona
- Workspace
- Domain Ownership

---

# AI Governance

AI hanya boleh membaca data sesuai hak akses yang berlaku.

AI tidak menjadi pemilik data.

AI tidak mengubah master data tanpa Business Rules yang sah.

---

# Dashboard Governance

Dashboard hanya menampilkan data dari sumber resmi.

Dashboard tidak menjadi penyimpan data.

---

# Success Criteria

Data Governance dianggap berhasil apabila:

- Seluruh data memiliki Owner.
- Seluruh data memiliki Steward.
- Hak akses terdokumentasi.
- Data dapat diaudit.
- AI menggunakan data resmi.
- Tidak ada duplikasi master data.

---

# Related Standards

- SSP-001 — Single Source Principle
- GAP-001 — Golden Automation Principle
- SIMIO-001 — Single Input Multiple Intelligence Output
- NCS-001 — Enterprise Naming Convention
- EDA-001 — Enterprise Domain Architecture

---

# Approval

Dokumen ini merupakan standar resmi Data Governance pada VENTRA.