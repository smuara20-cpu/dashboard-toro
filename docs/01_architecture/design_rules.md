# ERP DESIGN RULES

Version : 1.0

---

# RULE 001

Satu Module hanya memiliki satu tanggung jawab.

Contoh

Booking hanya mengelola proses booking.

---

# RULE 002

Semua upload file wajib melalui Document Center.

Tidak boleh upload langsung.

---

# RULE 003

Semua pembayaran wajib melalui Finance Module.

Booking tidak boleh mengubah status pembayaran.

---

# RULE 004

AI tidak memiliki hak Approval.

Approval terakhir dilakukan manusia.

---

# RULE 005

Semua Approval menggunakan Approval Workflow.

---

# RULE 006

Semua perubahan penting membuat Timeline.

---

# RULE 007

Semua perubahan penting membuat Audit Log.

---

# RULE 008

Semua notifikasi melalui Notification Center.

---

# RULE 009

Semua dokumen menggunakan Signed URL.

---

# RULE 010

Semua dokumen disimpan di Supabase Storage.

---

# RULE 011

Tidak boleh menyimpan data yang sama di dua module.

---

# RULE 012

Entity tidak boleh mengakses Database.

---

# RULE 013

Presentation Layer tidak boleh mengakses Datasource.

---

# RULE 014

Repository menjadi satu-satunya akses Data.

---

# RULE 015

Semua AI menggunakan AI Service.

Tidak boleh dipanggil langsung dari UI.

---

# RULE 016

Semua file upload melalui Upload Queue.

---

# RULE 017

Semua download tercatat pada Audit Log.

---

# RULE 018

Permission diperiksa sebelum membuka dokumen.

---

# RULE 019

Customer hanya dapat melihat dokumennya sendiri.

---

# RULE 020

Finance hanya dapat melihat dokumen pembayaran.

---

# RULE 021

CS hanya dapat melihat dokumen yang dibutuhkan untuk proses booking.

---

# RULE 022

Semua API menggunakan Response Wrapper yang sama.

---

# RULE 023

Semua Error menggunakan Failure.

---

# RULE 024

Semua Enum berada di Domain.

---

# RULE 025

Semua Value Object berada di Domain.

---

# RULE 026

Semua Business Logic berada di Use Case.

---

# RULE 027

Mapper hanya melakukan konversi data.

---

# RULE 028

Model hanya untuk komunikasi data.

---

# RULE 029

Entity adalah sumber kebenaran Domain.

---

# RULE 030

Semua perubahan Architecture dicatat pada Decision Log.