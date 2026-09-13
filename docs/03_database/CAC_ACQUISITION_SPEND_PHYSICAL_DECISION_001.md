# CAC Acquisition Spend Physical Decision 001

Status: APPROVED
Scope: Marketing Acquisition Analytics
Entity: acquisition_spend

## 1. Objective

Menetapkan physical schema untuk actual acquisition spend VENTRA.

Entity ini menjadi source-of-record untuk biaya akuisisi yang
dialokasikan kepada Campaign.

CAC tidak disimpan sebagai nilai fisik.

CAC dihitung pada analytics layer:

CAC = Attributed Acquisition Spend / New Customers Acquired

## 2. Entity

Table:

acquisition_spend

## 3. Columns

| Column | Type | Null | Rule |
|---|---|---:|---|
| id | UUID | NO | Primary Key |
| tenant_id | UUID | NO | Tenant isolation |
| campaign_id | UUID | NO | Campaign reference |
| spend_date | DATE | NO | Acquisition spend date |
| amount | NUMERIC | NO | Must be > 0 |
| currency | VARCHAR | NO | Explicit currency |
| source | VARCHAR | NO | Spend source |
| external_reference | VARCHAR | YES | External provider/reference |
| created_at | TIMESTAMP | NO | Creation timestamp |
| updated_at | TIMESTAMP | NO | Last update timestamp |
| deleted_at | TIMESTAMP | YES | Soft delete |

## 4. Primary Key

id UUID PRIMARY KEY

UUID digunakan sebagai globally unique identifier.

## 5. Tenant Isolation

tenant_id wajib.

Seluruh acquisition spend wajib terisolasi berdasarkan tenant.

Cross-tenant analytics tidak diperbolehkan.

## 6. Campaign Relationship

campaign_id wajib.

Relationship:

Campaign 1:N acquisition_spend

Tidak membuat duplicate Campaign table.

Physical foreign-key implementation terhadap Campaign dilakukan
hanya apabila existing Campaign physical source-of-truth telah
teridentifikasi.

## 7. Amount

amount wajib lebih besar dari zero.

Negative acquisition spend tidak diperbolehkan sebagai standard
acquisition-spend record.

Refund, reversal, credit, atau adjustment membutuhkan business
decision terpisah dan tidak boleh disamarkan sebagai negative
standard spend tanpa definisi domain.

## 8. Currency

currency wajib disimpan secara eksplisit.

Tidak melakukan silent currency conversion.

Currency normalization membutuhkan keputusan Finance terpisah.

## 9. Source

source wajib.

Contoh semantic source:

- Meta Ads
- Google Ads
- TikTok Ads
- Offline Campaign
- Other Acquisition Source

Daftar final source enum/value akan ditetapkan pada domain
implementation apabila diperlukan.

## 10. External Reference

external_reference bersifat optional.

Digunakan untuk traceability terhadap external advertising
platform atau sumber biaya.

Tidak boleh digunakan sebagai primary key.

## 11. Soft Delete

deleted_at digunakan untuk soft deletion.

Record yang telah dihapus secara logical tidak digunakan dalam
active CAC calculation.

Historical traceability tetap dipertahankan.

## 12. Referential Integrity

Migration tidak boleh melakukan destructive cascade terhadap
existing business entities.

Acquisition spend tidak boleh menghapus Campaign atau entity
lainnya.

## 13. Indexes

Minimum indexes:

- tenant_id
- campaign_id
- spend_date
- tenant_id + spend_date
- tenant_id + campaign_id + spend_date

Index harus mendukung period-based acquisition analytics.

## 14. CAC Boundary

acquisition_spend hanya menyimpan actual acquisition spend.

Tidak menyimpan:

- CAC
- CPL
- ROAS
- Customer Count
- Lead Count
- Revenue

Metric tersebut dihitung pada analytics layer dari source data.

## 15. Period Semantics

spend_date merupakan tanggal biaya acquisition.

Analytics period filtering wajib menggunakan definisi period yang
jelas dan tenant-scoped.

## 16. Data Integrity

Rules:

1. tenant_id wajib
2. campaign_id wajib
3. amount > 0
4. currency wajib
5. source wajib
6. spend_date wajib
7. id unique
8. deleted records tidak masuk active analytics
9. cross-tenant reference tidak diperbolehkan
10. CAC tidak disimpan secara manual

## 17. Migration

Migration harus:

1. membuat acquisition_spend
2. membuat required constraints
3. membuat required indexes
4. tidak mengubah existing source-of-truth entities
5. tidak membuat duplicate Campaign
6. menyediakan rollback

## 18. Rollback

Rollback hanya boleh menghapus object yang dibuat oleh migration
acquisition_spend.

Rollback tidak boleh menghapus Campaign, Lead, Customer, Booking,
Payment, atau Revenue data.

## 19. Attribution Boundary

Acquisition spend merupakan input untuk attribution analytics.

First-touch attribution tetap menjadi business rule V1.

Physical implementation untuk lead attribution dan customer
acquisition tetap berada di separate decision gate.

## 20. Final Decision

acquisition_spend:

APPROVED FOR PHYSICAL MIGRATION

lead_attribution:

HOLD

customer_acquisition:

HOLD

campaign:

DO NOT DUPLICATE

lead:

DO NOT DUPLICATE

customer:

DO NOT DUPLICATE

booking:

DO NOT DUPLICATE

payment:

DO NOT DUPLICATE

## 21. Gate

CAC Acquisition Spend Physical Decision:

APPROVED / LOCKED

Migration:

NEXT STEP
