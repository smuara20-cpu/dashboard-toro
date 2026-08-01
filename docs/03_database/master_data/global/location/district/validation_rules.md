# DISTRICT VALIDATION RULES

Version : 1.0

---

# Tujuan

Dokumen ini menjelaskan seluruh aturan validasi (Validation Rules) untuk Master Data District.

Validation Rules digunakan untuk memastikan kualitas data, konsistensi relasi, dan integritas Master Data District sebelum data disimpan ke dalam database.

---

# Validation Rules

## VR-001

### Nama District Wajib Diisi

Field:

district_name

Status

Required

Error Message

District Name is required.

---

## VR-002

### City Wajib Dipilih

Field

city_id

Status

Required

Error Message

City must be selected.

---

## VR-003

### Province Harus Sesuai dengan City

Sistem harus memastikan City yang dipilih berada pada Province yang dipilih.

Jika tidak sesuai,

proses penyimpanan dibatalkan.

---

## VR-004

### Country Harus Sesuai

Country yang dipilih harus merupakan induk dari Province dan City yang dipilih.

---

## VR-005

### District Tidak Boleh Duplikat Dalam Satu City

Kombinasi berikut harus unik.

```
city_id

+

district_name
```

Contoh

```
Bandung

Coblong
```

tidak boleh ada dua kali.

Namun

```
Bandung

Coblong
```

dan

```
Semarang

Coblong
```

masih diperbolehkan.

---

## VR-006

### Panjang Nama District

Minimal

2 karakter

Maksimal

100 karakter

---

## VR-007

### Karakter Tidak Valid

District Name tidak boleh mengandung:

- HTML Tag
- Script
- SQL Injection
- Karakter kontrol

---

## VR-008

### Soft Delete

District yang sudah digunakan pada transaksi tidak boleh dihapus permanen.

Status hanya boleh menjadi:

Inactive

---

## VR-009

### Smart Lookup

Pencarian District harus mendukung:

- Search by Name
- Search by City
- Search by Province
- Search by Country

---

## VR-010

### Audit Log

Setiap perubahan wajib mencatat:

- User
- Waktu
- Data Lama
- Data Baru

---

## Validation Summary

| Item | Status |
|------|--------|
| Required Field | ✅ |
| Duplicate Check | ✅ |
| Parent Validation | ✅ |
| Child Validation | ✅ |
| Lookup Validation | ✅ |
| Audit Validation | ✅ |
| Soft Delete | ✅ |

---

# Catatan

Seluruh Validation Rules wajib diterapkan pada Database, API, Flutter, dan proses Import Data agar kualitas Master Data District tetap terjaga.