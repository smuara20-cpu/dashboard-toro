# VILLAGE BUSINESS RULES

Version : 1.1

Status : APPROVED

Last Updated : 2026-08-01

Owner : Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan seluruh Business Rules untuk Master Data Village pada ERP Travel AI Platform.

Master Data Village merupakan level wilayah administrasi terendah yang digunakan sebagai referensi utama pada seluruh transaksi operasional, analitik, AI, Dashboard, dan Business Module.

Village menjadi fondasi utama Intelligent Address Engine dan Canonical Address Policy.

---

# Business Objective

Master Data Village bertujuan untuk:

- Menyediakan referensi wilayah administrasi tingkat Village yang konsisten.
- Mendukung Canonical Address Policy.
- Mendukung Intelligent Address Engine.
- Mendukung Geo Intelligence Engine.
- Mendukung Dashboard Analytics.
- Mendukung AI Recommendation.
- Mendukung Territory Performance Engine.
- Mendukung SaaS Multi-Tenant.

---

# Business Rules

## BR-001

Village merupakan bagian dari Global Master Data.

Seluruh Company menggunakan referensi Village yang sama.

---

## BR-002

Village berada di bawah District.

Hierarki resmi adalah:

Country

↓

Province

↓

City

↓

District

↓

Village

---

## BR-003

Setiap Village wajib memiliki Parent District yang valid.

Village tidak boleh berdiri sendiri.

---

## BR-004

Nama Village boleh sama apabila berada pada District yang berbeda.

Namun kombinasi:

District

+

Village

harus unik.

---

## BR-005

Seluruh transaksi wajib menyimpan:

- country_id
- province_id
- city_id
- district_id
- village_id

sesuai AD-033 (Controlled Denormalization).

---

## BR-006

Village menjadi referensi utama pada:

- Customer
- Jamaah
- Company
- Branch
- Vendor
- Supplier
- Booking
- CRM
- Marketing
- Finance

---

## BR-007

Village mendukung Smart Lookup.

Pencarian dapat dilakukan berdasarkan:

- Village
- District
- City
- Province
- Country
- Postal Code

---

## BR-008

Village mendukung Canonical Address Policy (AD-040).

Address Line hanya bersifat pelengkap.

Referensi wilayah wajib menggunakan Master Data.

---

## BR-009

Village wajib mendukung Intelligent Address Engine.

Sistem dapat menyusun alamat lengkap secara otomatis berdasarkan hierarki wilayah.

---

## BR-010

Village wajib mendukung Geo Intelligence Engine.

Data Village dapat digunakan untuk:

- Heatmap Jamaah
- Heatmap Customer
- Heatmap Penjualan
- Heatmap Cabang
- Heatmap Mitra
- Territory Performance

---

## BR-011

Village menjadi dasar AI Geo Timeline.

AI dapat menganalisis perkembangan wilayah berdasarkan Village.

AI hanya memiliki hak Read Only.

---

## BR-012

Village wajib mengikuti Geographic Change Management Policy (AD-039).

Apabila terjadi perubahan wilayah administrasi resmi, histori transaksi tetap harus dipertahankan.

---

## BR-013

Perubahan nama Village tidak mengubah village_id.

Identity Village bersifat permanen (Immutable Geographic Identity).

---

## BR-014

Master Data Village hanya dapat diubah oleh Platform Administrator atau Role yang memiliki hak akses khusus.

Perubahan wajib dicatat pada Audit Log.

---

## BR-015

Seluruh Business Module wajib menggunakan village_id sebagai Foreign Key.

Penggunaan nama Village secara langsung pada tabel transaksi tidak diperbolehkan.

---

# Business Impact

Master Data Village memengaruhi:

- Database
- REST API
- Flutter
- AI Engine
- Dashboard
- Executive Briefing
- Reporting
- Territory Performance
- Intelligent Address Engine
- Geo Intelligence Engine

---

# Architecture Reference

Master Data Village mengacu pada:

- AD-033 — Hierarchical Foreign Key Policy
- AD-038 — Security by Design Policy
- AD-039 — Geographic Change Management Policy
- AD-040 — Canonical Address Policy

---

# Catatan

Master Data Village merupakan fondasi utama seluruh alamat operasional pada ERP Travel AI Platform.

Seluruh implementasi wajib mengacu pada Business Rules yang telah ditetapkan.