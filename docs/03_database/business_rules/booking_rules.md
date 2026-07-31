# BOOKING BUSINESS RULES

Version : 1.0

---

## Booking Creation

- Booking harus memiliki Customer.
- Booking harus memiliki minimal satu Jamaah.
- Booking harus menggunakan satu Package Schedule.
- Booking harus memiliki Branch.
- Booking harus memiliki Company.

---

## Booking Number

- Nomor Booking dibuat otomatis oleh sistem.
- Nomor Booking harus unik.
- Nomor Booking tidak boleh diubah.

---

## Booking Status

Urutan status:

Draft

↓

Pending

↓

Confirmed

↓

Completed

---

Status dapat berubah menjadi Cancelled sesuai kebijakan perusahaan.

---

## Invoice

- Booking dapat memiliki satu atau lebih Invoice.
- Invoice dibuat berdasarkan aturan bisnis perusahaan.

---

## Payment

- Pembayaran hanya dapat dilakukan pada Invoice yang aktif.
- Total pembayaran tidak boleh melebihi nilai Invoice.

---

## Document

- Dokumen dapat diunggah sebelum atau sesudah Booking dikonfirmasi.
- Status verifikasi dokumen harus tercatat.

---

## Audit

Seluruh perubahan Booking harus tercatat pada Audit Log.