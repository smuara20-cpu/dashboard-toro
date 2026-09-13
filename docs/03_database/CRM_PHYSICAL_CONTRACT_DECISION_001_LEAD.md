# CRM PHYSICAL CONTRACT DECISION 001 — LEAD

Status: APPROVED / LOCKED
Entity: Lead
Domain: CRM
Authority: DB-102 CRM Database Blueprint + BP-102 CRM Blueprint + AD-018 Enterprise Data Architecture

## 1. PURPOSE

Menetapkan physical contract untuk entity Lead sebelum implementasi migration.
Dokumen ini tidak membuat duplicate Customer, Campaign, atau Attribution source-of-truth.

## 2. PHYSICAL TABLE

Table: lead

## 3. APPROVED CORE COLUMNS

| Column | Type | Nullability | Decision |
|---|---|---|---|
| id | UUID | NOT NULL | APPROVED |
| tenant_id | UUID | NOT NULL | APPROVED |
| company_id | UUID | NOT NULL | APPROVED |
| owner_id | UUID | NOT NULL | APPROVED |
| lead_source | VARCHAR | NOT NULL | APPROVED |
| status | VARCHAR | NOT NULL | APPROVED |
| created_at | TIMESTAMP | NOT NULL | APPROVED |
| updated_at | TIMESTAMP | NOT NULL | APPROVED |
| deleted_at | TIMESTAMP | NULL | APPROVED |

## 4. FIELD BOUNDARIES

### tenant_id

Required for tenant isolation.
Tenant context is a security boundary and is not interchangeable with company_id.

### company_id

Required as business company ownership boundary.
company_id remains distinct from tenant_id.

### owner_id

Lead ownership is governed by CRM ownership control.

### lead_source

Lead source is represented by the existing LeadSource vocabulary:

- whatsapp
- instagram
- facebook
- google
- tiktok
- website
- referral
- walkIn
- other

### status

Lead lifecycle is governed by CRM business rules.

Canonical lifecycle contract:

Draft ? New ? Assigned ? Qualified ? Prospect ? Opportunity ? Won/Lost ? Archived

Status transition validation belongs to CRM domain/application logic.
Database CHECK constraints for the complete state machine are intentionally deferred.

### created_at / updated_at / deleted_at

Required lifecycle and soft-delete timestamps.

## 5. EXCLUDED COLUMNS

### branch_id

Status: HOLD / EXCLUDED

No authoritative Lead-specific branch ownership evidence was found in the reviewed repository sources.
Generic Base Entity branch_id guidance is not sufficient to force branch_id into Lead physical schema.

### campaign_id

Status: EXCLUDED

Campaign attribution is represented through the Lead Attribution boundary.
Campaign must not be duplicated directly on Lead merely for CAC reporting.

Canonical relationship:

Campaign ? Lead Attribution ? Lead

Attribution V1 uses First Touch.

### customer_id

Status: LOGICAL APPROVED / PHYSICAL HOLD

A Lead may become associated with a Customer and original lead attribution must remain available.
However, reviewed sources do not yet establish the physical Customer FK contract, therefore customer_id is not included in the migration yet.

## 6. ATTRIBUTION BOUNDARY

Lead is not the source-of-truth for Campaign attribution.
Physical lead_attribution remains HOLD until Campaign Activity and existing Campaign/Lead physical authority are validated.

Expected logical attribution fields include:

- lead_id
- campaign_id
- attribution timestamp
- attribution model

First Touch is the approved V1 attribution model.

## 7. TENANT ISOLATION

All Lead operations must be tenant-scoped.
Cross-tenant access is prohibited unless explicitly authorized by enterprise policy.
UI filtering is not a security boundary.

## 8. DATA INTEGRITY

- Lead is distinct from Customer.
- Lead must not store CAC, CPL, ROAS, revenue, or booking metrics.
- Lead must not duplicate Campaign attribution.
- Missing attribution must not be interpreted as zero.
- Soft delete uses deleted_at.
- No destructive cascade is introduced by this contract.

## 9. INDEXING DIRECTION

Physical indexes will be finalized during migration review.
At minimum, tenant-scoped lookup must be supported.

## 10. MIGRATION GATE

Migration Status: HOLD

Migration may proceed only after:

1. This Lead physical contract is APPROVED / LOCKED.
2. Automated contract tests are GREEN.
3. Customer physical authority is validated if customer_id is introduced.
4. Campaign/Attribution physical authority is validated separately.
5. Migration and rollback are reviewed.
6. Full Flutter regression remains GREEN.

## 11. FINAL DECISION

Current physical Lead shape:

lead(id, tenant_id, company_id, owner_id, lead_source, status, created_at, updated_at, deleted_at)

Status: APPROVED / LOCKED


