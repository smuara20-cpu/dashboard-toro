# CURRENCY VALIDATION RULES

Version : 1.0

Status : APPROVED

Master Data Name : Currency

Master Data Code : MD-CURRENCY

Category : Global Master

Domain : Global

Owner : Finance Domain

Reviewer : Enterprise Architecture Team

Approval : APPROVED

Last Updated : 2026-08-03

---

# Tujuan

Dokumen ini mendefinisikan seluruh aturan validasi Master Data Currency untuk menjamin kualitas data, konsistensi transaksi, dan integritas sistem.

---

# Validation Principles

Seluruh Currency harus memenuhi prinsip:

- Accuracy
- Consistency
- Completeness
- Uniqueness
- Integrity
- Auditability

---

# Validation Rules

## VR-001

Currency Code wajib diisi.

Status:

Required

Contoh:

IDR

USD

EUR

---

## VR-002

Currency Code harus menggunakan standar ISO 4217.

Panjang:

3 karakter

Contoh:

SAR

JPY

GBP

---

## VR-003

Currency Code harus unik.

Tidak diperbolehkan terdapat Currency Code yang sama.

---

## VR-004

Currency Name wajib diisi.

Contoh:

Indonesian Rupiah

United States Dollar

Saudi Riyal

---

## VR-005

Currency Symbol wajib diisi.

Contoh:

Rp

$

€

﷼

¥

---

## VR-006

Decimal Digits wajib diisi.

Nilai yang diperbolehkan:

0

2

3

4

---

## VR-007

Default Currency hanya boleh satu untuk setiap Company.

---

## VR-008

Status hanya diperbolehkan:

- Active
- Inactive

---

## VR-009

Currency yang telah digunakan pada transaksi tidak boleh dihapus.

---

## VR-010

Currency yang Inactive tidak dapat digunakan untuk transaksi baru.

---

## VR-011

Perubahan Currency Code tidak diperbolehkan setelah Currency digunakan pada transaksi.

---

## VR-012

Perubahan Currency Name diperbolehkan.

Seluruh perubahan wajib dicatat pada Audit Trail.

---

## VR-013

Currency Symbol dapat diperbarui apabila terdapat perubahan standar resmi.

---

## VR-014

Decimal Digits tidak dapat diubah apabila telah digunakan pada transaksi.

---

## VR-015

Seluruh perubahan Status wajib dicatat pada Audit Trail.

---

## VR-016

Import Data wajib melakukan validasi terhadap:

- Duplicate Code
- Duplicate Name
- Invalid ISO Code
- Empty Field

---

## VR-017

API wajib menolak data yang tidak memenuhi seluruh Validation Rules.

---

## VR-018

Seluruh Validation Error harus memberikan pesan yang mudah dipahami pengguna.

Contoh:

"Currency Code wajib terdiri dari 3 karakter sesuai standar ISO 4217."

---

# Validation Result

Apabila seluruh Validation Rules terpenuhi:

Status:

VALID

Apabila salah satu gagal:

Status:

INVALID

---

# Related Documents

- business_rules.md
- data_dictionary.md
- business_scenarios.md
- erd.md
- review.md
- security_review.md
- notes.md
- changelog.md

---

# Final Review

Master Data Currency dinyatakan valid apabila seluruh Validation Rules telah terpenuhi sebelum data disimpan.

---

# Catatan

Seluruh validasi dilakukan sebelum proses Insert maupun Update.

Validasi harus diterapkan secara konsisten pada Web, Mobile, API, Import Data, dan AI Engine.