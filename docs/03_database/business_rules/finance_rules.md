# FINANCE BUSINESS RULES

Version : 1.0

---

## Invoice

- Invoice harus terkait dengan Booking.
- Invoice memiliki status yang tervalidasi.
- Nominal Invoice tidak boleh bernilai negatif.

---

## Payment

- Payment harus terkait dengan Invoice.
- Payment harus menggunakan Payment Method.
- Payment harus memiliki tanggal transaksi.

---

## Refund

- Refund hanya dapat dilakukan untuk Payment yang valid.
- Refund harus mendapatkan persetujuan sesuai workflow.

---

## Journal

- Setiap Payment yang berhasil harus menghasilkan Journal.
- Journal tidak boleh dihapus setelah diposting.

---

## Cash Flow

- Setiap transaksi kas harus memiliki sumber transaksi.