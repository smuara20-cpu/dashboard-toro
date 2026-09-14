# CRM MARKETING PHYSICAL CONTRACT DECISION 005
# CAMPAIGN ACTIVITY

Status: APPROVED / LOCKED
Domain: Marketing
Entity: Campaign Activity
Decision Type: Physical Contract Boundary
Migration Status: HOLD

---

## 1. PURPOSE

Dokumen ini menetapkan physical contract boundary untuk Campaign Activity
sebelum physical database implementation atau migration dibuat.

Campaign Activity merupakan entity arsitektural resmi pada Marketing Domain,
namun repository saat ini belum memiliki physical schema yang authoritative.

Keputusan ini mengunci batas antara business/architectural authority dan
physical database implementation.

---

## 2. AUTHORITY

Keputusan ini didasarkan pada:

- AD-018 Enterprise Data Architecture
- DB-102 CRM Database Blueprint
- CRM Marketing Physical Contract Decision 003 - Lead Attribution
- CRM Marketing Physical Contract Decision 004 - Campaign
- hasil Physical Discovery Gate 005

AD-018 mendefinisikan:

ENT-028 | Campaign Activity | Marketing | Transactional

DB-102 juga mendefinisikan Campaign Activity sebagai bagian dari CRM /
Marketing architecture dan menyediakan referensi seperti Campaign Activity
dan campaign activity lookup.

Namun authority tersebut belum memberikan physical DDL yang dapat
digunakan sebagai database implementation authority.

---

## 3. DISCOVERY RESULT

Repository discovery menunjukkan:

1. Tidak ditemukan SQL migration untuk Campaign Activity.
2. Tidak ditemukan table definition `campaign_activity`.
3. Tidak ditemukan physical `activity_id` yang secara authoritative
   merepresentasikan Campaign Activity.
4. Tidak ditemukan CampaignActivity model/entity implementation.
5. Tidak ditemukan Campaign Activity physical schema.
6. Campaign Activity hanya ditemukan sebagai architectural / blueprint
   entity dan sebagai dependency pada keputusan physical sebelumnya.

Kesimpulan:

Architectural Authority = YES

Physical Authority = NO

Physical Implementation = NOT FOUND

Migration = HOLD

---

## 4. BUSINESS / ARCHITECTURAL BOUNDARY

Campaign Activity merupakan entity transactional di bawah Marketing Domain.

Campaign Activity berfungsi sebagai bagian dari operational activity
associated with Campaign dan dapat menjadi dependency bagi:

- Campaign Performance
- Marketing Analytics
- Attribution
- Campaign Activity Lookup
- downstream marketing reporting

Campaign Activity tetap berada di bawah ownership Marketing.

Business existence of Campaign Activity tidak dengan sendirinya
menentukan physical database structure.

---

## 5. PHYSICAL SCHEMA STATUS

Physical definition berikut tetap HOLD sampai physical authority yang sah
tersedia:

- table name
- primary key
- tenant_id
- campaign_id
- activity identifier
- activity type
- activity status
- activity timestamp
- activity result
- external reference
- metadata
- created_at
- updated_at
- deleted_at
- foreign keys
- indexes
- unique constraints
- check constraints
- cascade behavior
- deletion behavior
- exact SQL data types
- nullability
- migration structure

Tidak ada field di atas yang boleh dianggap authoritative hanya berdasarkan
nama entity atau logical blueprint.

---

## 6. CAMPAIGN RELATIONSHIP

Secara logical, Campaign Activity berada di dalam Marketing Campaign
boundary.

Namun:

Campaign -> Campaign Activity

merupakan logical/business relationship dan belum menjadi physical FK
authority.

Karena physical Campaign schema juga belum tersedia, repository tidak boleh
mengarang:

- campaign_activity.campaign_id FK
- Campaign primary key
- Campaign Activity primary key
- cascade behavior
- tenant propagation mechanism

Physical relationship tetap HOLD.

---

## 7. TENANT ISOLATION

Campaign Activity merupakan Marketing transactional entity dan wajib
tenant-scoped pada physical implementation.

Namun mekanisme physical tenant isolation belum ditetapkan oleh repository
untuk Campaign Activity.

Tidak boleh mengasumsikan:

- tenant_id column
- company_id column
- branch_id column
- composite key
- row-level security
- database policy

sebagai physical authority sebelum schema source-of-truth tervalidasi.

Tenant isolation requirement = LOCKED.

Exact physical mechanism = HOLD.

---

## 8. CAMPAIGN ACTIVITY AND LEAD ATTRIBUTION

Campaign Activity merupakan dependency penting bagi Lead Attribution.

Logical boundary tetap:

Campaign
    ->
Campaign Activity / Attribution Context
    ->
Lead Attribution
    ->
Lead

Keputusan ini tidak membuat Lead Attribution migration.

Keputusan ini juga tidak membuat Campaign Activity migration.

Lead Attribution tetap HOLD sampai physical Campaign Activity capability
dan physical Campaign / Lead authority tervalidasi.

---

## 9. CAMPAIGN ACTIVITY AND ACQUISITION SPEND

`acquisition_spend.campaign_id` yang sudah tersedia tidak boleh dianggap
sebagai bukti bahwa Campaign Activity physical schema telah tersedia.

Tidak boleh membuat Campaign Activity table hanya untuk memenuhi kebutuhan
acquisition_spend.

Acquisition Spend tetap mengikuti physical decision yang telah dikunci.

---

## 10. CAMPAIGN ACTIVITY AND CAMPAIGN PERFORMANCE

Campaign Performance dan Marketing Analytics dapat menggunakan Campaign
Activity sebagai source/dependency secara logical.

Namun physical persistence untuk:

- performance metrics
- activity metrics
- aggregation tables
- analytics snapshots
- reporting tables

belum ditetapkan oleh decision ini.

Tidak boleh membuat physical reporting schema berdasarkan asumsi.

---

## 11. MASTER TABLE RECONCILIATION

DB-102 menyebut Campaign Activity sebagai architectural entity.

Namun discovery terhadap `master_table_list.md` tidak menemukan
`campaign_activity` sebagai physical master table entry.

Kondisi ini harus diperlakukan sebagai:

Architecture-to-Physical Reconciliation Required

Perbedaan tersebut tidak boleh diselesaikan dengan membuat table secara
otomatis.

Reconciliation harus dilakukan sebelum Campaign Activity physical migration
disetujui.

---

## 12. MIGRATION GATE

Campaign Activity migration tetap:

HOLD

Migration hanya dapat dibuka setelah minimal seluruh authority berikut
tersedia dan direview:

1. authoritative physical table definition
2. primary key definition
3. tenant ownership mechanism
4. Campaign relationship
5. required business fields
6. activity lifecycle/status
7. activity timestamp semantics
8. indexes
9. uniqueness constraints
10. deletion/cascade behavior
11. audit requirements
12. Campaign Activity dependency for Lead Attribution
13. reconciliation dengan master table list
14. compatibility dengan Campaign physical contract
15. compatibility dengan Marketing Analytics / Attribution boundary

---

## 13. NO INVENTED PHYSICAL DETAILS

Decision 005 secara eksplisit melarang:

- invented columns
- invented primary keys
- invented foreign keys
- invented indexes
- invented constraints
- invented cascade rules
- invented migration
- invented API payload
- invented ORM model
- invented tenant mechanism

Physical implementation harus berasal dari authoritative source yang dapat
divalidasi.

---

## 14. GOVERNANCE DECISION

Campaign Activity:

Architectural Entity
= APPROVED

Marketing Ownership
= APPROVED

Transactional Classification
= APPROVED

Logical Relationship
= APPROVED

Physical Schema
= HOLD

Physical Migration
= HOLD

Physical FK
= HOLD

Physical Indexes
= HOLD

Physical Tenant Mechanism
= HOLD

Architecture-to-Physical Reconciliation
= REQUIRED

---

## 15. FINAL DECISION

DECISION:

CAMPAIGN ACTIVITY PHYSICAL CONTRACT = APPROVED / LOCKED

Campaign Activity diakui sebagai authoritative architectural entity dalam
Marketing Domain.

Namun repository belum memiliki authoritative physical implementation.

Oleh karena itu physical schema dan migration sengaja tidak dibuat.

Keputusan ini menjaga VENTRA dari premature schema invention dan menjaga
konsistensi dengan:

- Campaign Physical Contract Decision 004
- Lead Attribution Physical Contract Decision 003
- CAC Physical Data Decision 001

Physical implementation hanya dapat dilanjutkan setelah physical authority
Campaign Activity tersedia dan seluruh dependency direkonsiliasi.

---

## 16. STATUS

APPROVED / LOCKED

Migration: HOLD

Physical Implementation: HOLD

Next Gate:
Campaign Activity Physical Authority / Architecture-to-Physical
Reconciliation
