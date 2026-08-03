# USER BUSINESS SCENARIOS

Version : 1.0

Status : APPROVED

Master Data Code : MD-USER

Domain Code : DOM-002

Last Updated : 2026-08-03

Owner : Business Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

---

# Tujuan

Dokumen ini mendeskripsikan skenario penggunaan (Business Scenarios) Master Data User pada TIOS (Travel Intelligence Operating System).

Business Scenario menjadi acuan bagi Business Analyst, Backend Developer, Flutter Developer, QA Engineer, AI Engineer, Product Owner, dan Architecture Team.

---

# Business Scenario 001

Scenario ID

BS-USER-001

## Membuat User Baru

### Actor

- Company Administrator
- Super Administrator

### Pre Condition

- Company aktif
- Employee aktif (jika User Internal)

### Flow

1. Membuka menu User.
2. Klik tombol **Tambah**.
3. Mengisi Username dan Email.
4. Menghubungkan dengan Employee (opsional untuk Jamaah).
5. Menentukan Role.
6. Menentukan Status.
7. Klik **Simpan**.
8. Sistem membuat User ID otomatis.
9. Audit Log mencatat aktivitas.

### Expected Result

User berhasil dibuat.

---

# Business Scenario 002

Scenario ID

BS-USER-002

## Login Menggunakan OTP

### Actor

- User

### Flow

1. User memasukkan Username/Email.
2. User memasukkan Password.
3. Sistem mengirim OTP ke WhatsApp atau Email.
4. User memasukkan OTP.
5. Sistem memvalidasi OTP (berlaku 2 menit).
6. Login berhasil.
7. Login Activity dicatat.

### Expected Result

User berhasil masuk ke Dashboard.

---

# Business Scenario 003

Scenario ID

BS-USER-003

## Login dari Device Baru

### Actor

- User

### Flow

1. User login dari perangkat baru.
2. Sistem mendeteksi Device belum terdaftar.
3. OTP wajib dilakukan.
4. Jika berhasil, Device ditambahkan ke Trusted Device (sesuai kebijakan).
5. CEO/Super Admin dapat melihat login baru pada Security Dashboard.

### Expected Result

Login berhasil dan Device baru tercatat.

---

# Business Scenario 004

Scenario ID

BS-USER-004

## Session Timeout

### Actor

- User

### Flow

1. User tidak melakukan aktivitas.
2. Waktu idle mencapai batas sesuai Role.
3. Sistem menampilkan peringatan 1 menit sebelum logout.
4. Jika tidak ada aktivitas, sistem melakukan Auto Logout.
5. Login Activity diperbarui.

### Expected Result

User keluar otomatis dengan aman.

---

# Business Scenario 005

Scenario ID

BS-USER-005

## Delegasi Akses

### Actor

- CEO
- Owner
- Super Administrator

### Flow

1. Membuka menu Delegation.
2. Memilih User penerima delegasi.
3. Memilih Role atau Permission yang didelegasikan.
4. Menentukan tanggal mulai dan berakhir.
5. Menyimpan delegasi.
6. Sistem mencatat Audit Log.
7. Delegasi berakhir otomatis sesuai jadwal.

### Expected Result

Delegasi aktif sesuai periode yang ditentukan.

---

# Business Scenario 006

Scenario ID

BS-USER-006

## Force Logout

### Actor

- CEO
- Super Administrator

### Flow

1. Membuka Security Dashboard.
2. Memilih User.
3. Klik **Force Logout**.
4. Memilih:
   - Semua Device
   - Device tertentu
5. Sistem mengakhiri sesi aktif.
6. User menerima notifikasi.
7. Audit Log diperbarui.

### Expected Result

Sesi login dihentikan sesuai pilihan.

---

# Business Scenario 007

Scenario ID

BS-USER-007

## Login Berisiko Tinggi

### Actor

- Authentication Service
- AI Security

### Flow

1. User login dari lokasi atau perangkat baru.
2. Sistem menghitung Risk Score.
3. OTP diwajibkan.
4. Notifikasi dikirim ke WhatsApp dan Email.
5. Aktivitas muncul pada Security Dashboard CEO.
6. Audit Log diperbarui.

### Expected Result

Login tetap aman dan dapat diaudit.

---

# Exception Scenario

## OTP Kedaluwarsa

Expected Result

User harus meminta OTP baru.

---

## Trusted Device Habis Masa Berlaku

Expected Result

OTP wajib dilakukan kembali.

---

## User Locked

Expected Result

Login ditolak.

---

## Login Melebihi Batas Device

Expected Result

Login ditolak sesuai Concurrent Access Policy.

---

## Related Documents

- business_rules.md
- validation_rules.md
- data_dictionary.md
- erd.md
- sample_data.md

---

# Catatan

Business Scenario menjadi dasar penyusunan Test Case, REST API Flow, Flutter Flow, AI Workflow, Dashboard Security Flow, dan User Acceptance Test (UAT).

Seluruh skenario wajib mengacu pada Business Rules yang telah disetujui.