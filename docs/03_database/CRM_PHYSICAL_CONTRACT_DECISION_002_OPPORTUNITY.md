# CRM PHYSICAL CONTRACT DECISION 002 — OPPORTUNITY

Status: REVIEW
Entity: Opportunity
Domain: CRM
Authority: DB-102 CRM Database Blueprint + BP-102 CRM Blueprint

## 1. PURPOSE

Menetapkan physical contract boundary untuk entity Opportunity sebelum implementasi migration.

Tidak ada physical schema yang boleh diinvent berdasarkan business blueprint saja.

## 2. PHYSICAL AUTHORITY DISCOVERY

Repository discovery performed:

- No Opportunity SQL migration found.
- No OpportunityModel found.
- No class Opportunity found.
- No opportunity_id physical implementation found.
- No opportunity_number physical implementation found.

Decision:

No authoritative physical Opportunity schema exists in repository.

## 3. BUSINESS CONTRACT

Opportunity hanya dapat dibuat dari Prospect.

Opportunity wajib memiliki:

- Opportunity Number
- Estimated Revenue
- Pipeline Stage
- Closing Target

Opportunity rules:

- Won tidak dapat kembali menjadi Draft.
- Opportunity Lost wajib memiliki Lost Reason.

## 4. BUSINESS LIFECYCLE

Created
→ Proposal
→ Negotiation
→ Won
atau
→ Lost
→ Closed

Lifecycle terminology berasal dari BP-102.

## 5. DB-102 CONTRACT EVIDENCE

DB-102 establishes:

- tenant_id required
- owner_id required
- status
- created_at
- updated_at
- stage valid
- probability bounded

## 6. PHYSICAL FIELD DECISION

DB-102 provides logical/architecture-level evidence for some Opportunity attributes, but does not provide an authoritative field-level physical schema.

Therefore:

- Logical evidence exists for:
    - tenant_id
    - owner_id
    - status
    - created_at
    - updated_at
    - stage
    - probability

- Exact physical definition remains HOLD for:
    - id
    - tenant_id
    - company_id
    - owner_id
    - opportunity_number
    - estimated_revenue
    - expected_revenue
    - probability
    - pipeline_stage
    - closing_target
    - status
    - lost_reason
    - lead_id
    - customer_id
    - branch_id
    - campaign_id
    - currency
    - created_at
    - updated_at
    - deleted_at

Physical definition includes:
- SQL data type
- nullability
- foreign key
- index
- unique constraint
- check constraint
- cascade behavior
- physical migration shape

## 7. RELATIONSHIP BOUNDARIES

Business relationship:

Prospect → Opportunity

This does not automatically establish a physical lead_id FK.

Customer relationship remains HOLD until Customer physical authority is validated.

Branch relationship remains HOLD until authoritative Opportunity branch ownership evidence exists.

Campaign relationship remains outside Opportunity until Campaign/Attribution physical authority is validated.

## 8. ATTRIBUTION BOUNDARY

Opportunity must not duplicate Campaign attribution merely for CAC reporting.

Campaign attribution remains governed by the Lead Attribution / Campaign boundary.

## 9. TENANT ISOLATION

All Opportunity operations must be tenant-scoped.

Cross-tenant access is prohibited unless explicitly authorized by enterprise policy.

UI filtering is not a security boundary.

## 10. MIGRATION GATE

Migration Status: HOLD

Migration must not be created until authoritative physical schema evidence is available and reviewed.

## 11. FINAL DECISION

Opportunity business contract is established.

Opportunity physical schema is NOT yet authoritative.

No invented physical columns.
No invented physical types.
No invented foreign keys.
No migration.

Status: REVIEW