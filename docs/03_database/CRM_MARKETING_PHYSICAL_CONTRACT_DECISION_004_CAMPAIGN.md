# CRM / MARKETING PHYSICAL CONTRACT DECISION 004 — CAMPAIGN

Status: APPROVED / LOCKED
Entity: Campaign
Domain: Marketing
Authority: BP-103 Marketing Blueprint + AD-018 Enterprise Data Architecture

## 1. PURPOSE

Menetapkan physical contract boundary untuk entity Campaign sebelum implementasi migration.

Dokumen ini mengunci business dan architecture boundary berdasarkan evidence yang tersedia tanpa mengarang physical schema yang belum authoritative.

## 2. PHYSICAL AUTHORITY DISCOVERY

Repository discovery performed:

- No Campaign SQL migration found.
- No Campaign physical table found.
- No CampaignModel found.
- No CampaignEntity found.
- No authoritative Campaign physical implementation found.

Existing physical `campaign_id` evidence is limited to:

- `acquisition_spend.campaign_id`

Decision:

No authoritative physical Campaign schema currently exists in repository.

## 3. DOMAIN OWNERSHIP

Marketing Domain is the Single Source of Truth for:

- Campaign
- Marketing Budget
- Marketing Performance
- Attribution
- Brand Performance

Campaign is a Marketing Domain Aggregate Root.

All Campaign changes must be governed through the Campaign Aggregate Root.

## 4. BUSINESS CONTRACT

Campaign represents a marketing activity with a defined business objective.

Campaign must have:

- Campaign Number
- Campaign Name
- Campaign Objective
- Budget

Campaign Number:

- must be unique
- is generated automatically by the system
- is permanent

Campaign must not be activated before obtaining Approval.

A Completed Campaign must not be modified except through a documented Revision process.

## 5. CAMPAIGN LIFECYCLE

Business lifecycle defined by BP-103:

CampaignCreated
→ CampaignApproved
→ CampaignActivated
→ CampaignPaused
→ CampaignCompleted

The following domain events are defined:

- CampaignCreated
- CampaignActivated
- CampaignPaused
- CampaignClosed

Lifecycle implementation terminology must follow the authoritative business blueprint during later physical implementation.

## 6. CAMPAIGN RELATIONSHIPS

Business relationships identified by BP-103 include:

- Campaign Schedule → Campaign
- Referral Campaign → Campaign
- Content → Campaign
- Promotion → Campaign
- Lead Generation → Campaign
- Analytics → Campaign
- Campaign Performance → Campaign

These business relationships do not automatically establish physical foreign keys.

Physical relationships remain HOLD until the referenced entities and their physical authority are validated.

## 7. PHYSICAL FIELD DECISION

Physical schema remains HOLD for Campaign, including but not limited to:

- id
- tenant_id
- campaign_number
- campaign_name
- campaign_objective
- status
- budget
- created_at
- updated_at
- deleted_at

Exact physical definitions remain HOLD for:

- SQL data types
- nullability
- primary key
- foreign keys
- indexes
- unique constraints
- check constraints
- cascade behavior
- audit fields
- physical migration shape

No physical column may be added solely from business terminology.

## 8. CAMPAIGN IDENTITY

Campaign Number is the business identifier defined by BP-103.

This does not establish whether the physical database identifier is:

- UUID
- numeric identifier
- another physical key

The physical primary key remains HOLD until authoritative database evidence is available.

Campaign Number uniqueness must be preserved when the physical schema is eventually defined.

## 9. TENANT ISOLATION

All Campaign operations must be tenant-scoped.

Cross-tenant Campaign access is prohibited unless explicitly authorized by enterprise policy.

UI filtering is not a security boundary.

The exact physical tenant ownership mechanism remains HOLD until the Campaign physical schema is defined.

## 10. ACQUISITION SPEND BOUNDARY

`acquisition_spend.campaign_id` exists as physical data in the current repository.

However, because no authoritative Campaign physical table currently exists:

- `acquisition_spend.campaign_id` must not be treated as an authoritative Campaign foreign key.
- No Campaign FK may be invented.
- No Campaign table may be created solely to satisfy Acquisition Spend.

The existing Acquisition Spend contract remains authoritative for Acquisition Spend itself.

## 11. ATTRIBUTION BOUNDARY

Campaign creates attribution context.

Canonical logical boundary:

Campaign
→ Lead Attribution
→ Lead

Lead must not become the source of truth for Campaign attribution.

Campaign attribution must remain governed through the Marketing / Lead Attribution boundary.

No physical attribution FK is established by this document.

## 12. CAMPAIGN ACTIVITY BOUNDARY

Campaign Activity is an architectural entity under Marketing.

Its physical implementation has not yet been validated.

Therefore:

- no Campaign Activity table is created
- no Campaign Activity columns are invented
- no Campaign Activity FK is invented
- no Campaign Activity migration is created

Campaign Activity physical authority must be validated separately.

## 13. CAMPAIGN PERFORMANCE BOUNDARY

Campaign Performance and Marketing Analytics are business/architecture capabilities.

They must not be converted into physical tables or columns without authoritative physical evidence.

Performance metrics remain derived/analytics concerns until their physical persistence requirements are explicitly defined.

## 14. MIGRATION GATE

Migration Status: HOLD

Campaign migration may proceed only after:

1. Authoritative physical Campaign schema evidence is available or explicitly approved through physical design review.
2. Tenant ownership is physically defined.
3. Campaign Number uniqueness is physically defined.
4. Required Campaign fields are physically defined.
5. Campaign lifecycle persistence is physically defined.
6. Campaign relationships are reviewed against authoritative physical entities.
7. Campaign Activity dependency is validated.
8. Acquisition Spend relationship is reviewed.
9. Lead Attribution relationship is reviewed.
10. Index, constraint, cascade, and deletion behavior are explicitly defined.

## 15. FINAL DECISION

Campaign business and architecture contract is established.

Campaign physical schema is NOT yet authoritative.

No invented physical columns.
No invented physical types.
No invented foreign keys.
No invented indexes.
No migration.

Status: APPROVED / LOCKED
