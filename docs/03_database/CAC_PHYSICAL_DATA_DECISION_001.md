# CAC Physical Data Decision 001

Status: REVIEW
Scope: Marketing Acquisition Analytics / Customer Acquisition Cost

## 1. Objective

Menetapkan physical data model untuk CAC VENTRA tanpa membuat
duplicate source-of-truth untuk Campaign, Lead, Customer, Booking,
Payment, atau Revenue.

## 2. CAC Formula

CAC =
Attributed Acquisition Spend
/
New Customers Acquired

CAC tidak disimpan sebagai nilai manual.

CAC dihitung dari physical acquisition spend dan customer acquisition.

## 3. Physical Entity

### acquisition_spend

Entity baru yang menjadi source-of-record untuk actual acquisition spend.

Fields:

- id UUID PK
- tenant_id UUID NOT NULL
- campaign_id UUID NOT NULL
- spend_date DATE NOT NULL
- amount NUMERIC NOT NULL
- currency VARCHAR NOT NULL
- source VARCHAR NOT NULL
- external_reference VARCHAR NULL
- created_at TIMESTAMP NOT NULL
- updated_at TIMESTAMP NOT NULL
- deleted_at TIMESTAMP NULL

Relationship:

campaign 1:N acquisition_spend

## 4. Campaign

Campaign existing logical/domain model tetap menjadi source-of-truth.

Tidak membuat duplicate campaign table hanya untuk CAC.

## 5. Lead Attribution

Lead tetap merupakan entity berbeda dari Customer.

Attribution V1 menggunakan First Touch.

Lead attribution wajib tenant-scoped dan campaign-aware.

Existing Campaign Activity harus direview terlebih dahulu sebelum
membuat physical lead_attribution table baru.

Decision:
REVIEW / HOLD physical migration.

## 6. Customer Acquisition

Customer acquisition digunakan untuk menentukan customer baru
yang dapat dihitung sebagai denominator CAC.

Logical relationship:

Lead -> Customer -> Customer Acquisition -> Campaign

Attribution model:
FIRST_TOUCH

Physical implementation:
REVIEW / HOLD sampai existing Customer/Lead/Campaign Activity
physical implementation tervalidasi.

## 7. Booking

Booking bukan source untuk menentukan customer acquisition.

Booking merupakan downstream conversion metric.

Relationship:

Customer -> Booking

Booking tidak otomatis berarti New Customer.

## 8. Payment / Revenue

Payment dan Revenue merupakan downstream financial source.

Revenue hanya digunakan untuk ROAS apabila attribution valid.

CAC tidak dihitung dari payment atau revenue.

## 9. Tenant Isolation

Semua acquisition analytics wajib tenant-scoped.

tenant_id wajib tersedia pada physical acquisition records.

Cross-tenant attribution tidak diperbolehkan.

## 10. Period Handling

Spend menggunakan spend_date.

Customer acquisition menggunakan acquired_at.

Analytics harus period-aware.

Tidak boleh mencampur acquisition period tanpa definisi attribution
yang jelas.

## 11. Currency

Spend menyimpan currency secara eksplisit.

Tidak melakukan silent currency conversion.

Currency normalization membutuhkan keputusan finance terpisah.

## 12. Data Integrity

Rules:

- Lead != Customer
- Booking != New Customer
- CAC tanpa attributed spend = N/A
- CAC tanpa acquired customer = N/A
- Missing attribution tidak boleh dianggap zero
- Manual CAC tidak diperbolehkan
- Tenant isolation wajib
- Soft delete digunakan untuk acquisition records
- Referential integrity wajib
- No destructive cascade terhadap source-of-truth business entities

## 13. Index Requirements

acquisition_spend:

- tenant_id
- campaign_id
- spend_date
- tenant_id + spend_date
- tenant_id + campaign_id + spend_date

Future attribution tables:

- tenant_id
- lead_id
- customer_id
- campaign_id
- attribution timestamp

## 14. Migration Decision

acquisition_spend:
APPROVED FOR PHYSICAL MIGRATION

lead_attribution:
HOLD

customer_acquisition:
HOLD

campaign:
DO NOT DUPLICATE

customer:
DO NOT DUPLICATE

lead:
DO NOT DUPLICATE

booking:
DO NOT DUPLICATE

payment:
DO NOT DUPLICATE

## 15. Rollback

Migration wajib memiliki rollback yang hanya menghapus object
yang dibuat oleh migration tersebut.

Tidak boleh melakukan destructive modification terhadap existing
source-of-truth entities.

## 16. Final Gate

Physical migration dapat dimulai hanya setelah:

1. acquisition_spend physical decision APPROVED
2. Existing Campaign physical implementation validated
3. Existing Lead physical implementation validated
4. Existing Customer physical implementation validated
5. Campaign Activity physical capability reviewed
6. Customer acquisition attribution implementation approved
7. Migration + rollback reviewed
8. Tenant isolation reviewed

Current status:

CAC Physical Data Decision:
REVIEW

Migration:
HOLD
