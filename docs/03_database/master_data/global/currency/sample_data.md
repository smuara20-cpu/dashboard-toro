# CURRENCY SAMPLE DATA

Version : 1.0

Status : APPROVED

Master Data Name : Currency

Master Data Code : MD-CURRENCY

Category : Global Master

Domain : Global

Business Owner : Finance Domain

Technical Owner : Platform Engineering

Data Steward : Finance Administrator

Reviewer : Enterprise Architecture Team

Approval : APPROVED

Last Updated : 2026-08-03

---

# Tujuan

Dokumen ini menyediakan contoh data Master Data Currency sebagai referensi implementasi, pengujian (Testing), Demo, Seed Database, dan QA.

Seluruh contoh data hanya digunakan sebagai referensi dan dapat disesuaikan dengan kebutuhan implementasi.

---

# Sample Data

| Code | Name | Symbol | Decimal | Default | Status |
|------|------|--------|----------|----------|--------|
| IDR | Indonesian Rupiah | Rp | 0 | Yes | Active |
| USD | United States Dollar | $ | 2 | No | Active |
| EUR | Euro | € | 2 | No | Active |
| SAR | Saudi Riyal | ﷼ | 2 | No | Active |
| AED | UAE Dirham | د.إ | 2 | No | Active |
| GBP | Pound Sterling | £ | 2 | No | Active |
| SGD | Singapore Dollar | S$ | 2 | No | Active |
| MYR | Malaysian Ringgit | RM | 2 | No | Active |
| JPY | Japanese Yen | ¥ | 0 | No | Active |
| KRW | South Korean Won | ₩ | 0 | No | Active |

---

# Company Example

## Company A

Default Currency

IDR

Allowed Currency

- IDR
- USD
- SAR

---

## Company B

Default Currency

USD

Allowed Currency

- USD
- EUR
- GBP

---

# Transaction Example

## Booking

Booking Number

BK-2026-000001

Package

Umrah Plus Turki

Currency

IDR

Price

Rp 38.500.000

---

## Vendor

Vendor

Hotel Madinah

Currency

SAR

Amount

SAR 1,250

---

## Airline

Airline

Emirates

Currency

USD

Amount

USD 845

---

# Import Sample

```csv
currency_code,currency_name,currency_symbol,decimal_digits,is_default,status
IDR,Indonesian Rupiah,Rp,0,true,Active
USD,United States Dollar,$,2,false,Active
EUR,Euro,€,2,false,Active
SAR,Saudi Riyal,﷼,2,false,Active
```

---

# Validation Example

## Valid

```text
Currency Code : USD
Currency Name : United States Dollar
Status : Active
```

Result

PASS

---

## Invalid

```text
Currency Code : US
```

Result

FAIL

Reason

Currency Code harus terdiri dari 3 karakter sesuai ISO 4217.

---

## Invalid

```text
Currency Code : IDR
```

Result

FAIL

Reason

Currency Code sudah digunakan.

---

# Testing Notes

Data contoh ini dapat digunakan untuk:

- Unit Test
- Integration Test
- API Test
- Mobile Test
- Web Test
- AI Test
- Performance Test

---

# Related Documents

- business_rules.md
- validation_rules.md
- data_dictionary.md
- business_scenarios.md
- erd.md
- security_review.md
- review.md
- notes.md
- changelog.md

---

# Final Review

Sample Data harus selalu mengikuti struktur Data Dictionary dan Business Rules.

Apabila terdapat perubahan struktur Master Data Currency, maka Sample Data wajib diperbarui.

---

# Catatan

Sample Data bukan merupakan data produksi (Production Data).

Seluruh nilai pada dokumen ini hanya digunakan untuk kebutuhan dokumentasi, pengujian, pelatihan, dan demonstrasi sistem.