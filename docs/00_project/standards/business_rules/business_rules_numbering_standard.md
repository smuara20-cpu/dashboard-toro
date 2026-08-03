# BUSINESS RULES NUMBERING STANDARD

Version : 1.0

Status : APPROVED

Document Code : BRS-001

Category : Business Rules Standard

Owner : Enterprise Architecture Team

Approval : APPROVED

---

# Tujuan

Dokumen ini mendefinisikan standar penomoran Business Rules agar seluruh aturan bisnis memiliki identitas yang unik, konsisten, mudah dicari, dan mudah direferensikan.

---

# Format Penomoran

Format standar:

BR-XXX

Contoh:

- BR-001
- BR-002
- BR-003

Nomor harus bersifat unik dalam satu dokumen Business Rules.

---

# Penulisan

Setiap Business Rule harus menggunakan heading:

## BR-001

Judul rule tidak menggunakan nomor tambahan.

Contoh:

## BR-001

User wajib memiliki Company.

---

# Penambahan Rule

Rule baru selalu ditambahkan pada nomor berikutnya.

Contoh:

BR-001

BR-002

BR-003

BR-004

Tidak diperbolehkan menggunakan:

BR-001A

BR-001B

BR-002.1

---

# Penghapusan Rule

Nomor Business Rule tidak boleh digunakan kembali.

Jika sebuah rule dihapus, nomor tersebut tetap dianggap pernah digunakan.

---

# Referensi

Business Rule boleh direferensikan pada dokumen lain menggunakan kode:

BR-014

BR-035

BR-109

---

# Compliance

Seluruh Business Rules wajib mengikuti standar penomoran ini.

---

# Related Documents

- business_rules_documentation_standard.md
- business_rules_review_standard.md
- business_rules_versioning_standard.md

---

# Approval

Standar ini disetujui sebagai standar resmi penomoran Business Rules ERP Travel AI Platform.