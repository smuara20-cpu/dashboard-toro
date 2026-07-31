# MIGRATION STRATEGY

Version : 1.0

---

## Aturan

Perubahan struktur database dilakukan menggunakan migration.

Migration tidak boleh mengubah data bisnis tanpa prosedur migrasi yang terdokumentasi.

---

## Penomoran

YYYYMMDD_HHMM_description.sql

---

## Rollback

Setiap migration harus memiliki rollback plan.