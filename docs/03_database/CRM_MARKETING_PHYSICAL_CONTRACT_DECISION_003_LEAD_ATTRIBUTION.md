# CRM / MARKETING PHYSICAL CONTRACT DECISION 003 — LEAD ATTRIBUTION

Status: APPROVED / LOCKED
Entity: Lead Attribution
Domain: Marketing / CRM Contract
Authority: AD-018 Enterprise Data Architecture + BP-103 Marketing Blueprint + DB-102 CRM Database Blueprint + existing Lead/CAC physical decisions

## 1. PURPOSE
Menetapkan physical contract boundary untuk Lead Attribution sebelum implementasi migration.
Dokumen ini mengunci business/architecture boundary tanpa mengarang physical schema yang belum authoritative.

## 2. PHYSICAL AUTHORITY DISCOVERY
Repository discovery performed:
- No Campaign SQL migration found.
- No Campaign Activity SQL migration found.
- No Lead Attribution SQL migration found.
- No CampaignModel found.
- No CampaignActivity implementation found.
- No LeadAttribution implementation found.

Existing physical `campaign_id` evidence is limited to `acquisition_spend`.

Decision:
No authoritative physical Campaign, Campaign Activity, or Lead Attribution schema currently exists in repository.

## 3. DOMAIN OWNERSHIP
Marketing Domain is the source of truth for:
- Campaign
- Marketing Budget
- Marketing Performance
- Attribution
- Brand Performance

Attribution is a Marketing-owned boundary consumed by CRM for Lead journey and by analytics for acquisition evaluation.

## 4. BUSINESS ATTRIBUTION CONTRACT
- Qualified Lead wajib memiliki Attribution Source.
- Attribution menyimpan asal konversi.
- Attribution V1 menggunakan First Touch.
- Model Attribution harus terdokumentasi.
- Perubahan Model Attribution harus melalui Architecture Review.
- Original lead attribution must remain available after Customer creation.
- Missing attribution must not be interpreted as zero.
- Attribution must be tenant-scoped.
- Attribution must be campaign-aware.

## 5. ATTRIBUTION BOUNDARY
Canonical logical boundary:

Campaign
→ Lead Attribution
→ Lead

Lead is not the source of truth for Campaign attribution.
Lead must not duplicate Campaign attribution merely for convenience or CAC reporting.

The business relationship does not automatically establish a physical `lead.campaign_id` foreign key.

## 6. CAMPAIGN ACTIVITY BOUNDARY
Campaign Activity is an authoritative architectural entity under Marketing.
Its physical schema is not yet validated in the repository.

Therefore this decision does not invent Campaign Activity columns, keys, constraints, or migration shape.

Campaign Activity physical capability must be validated before any Lead Attribution migration is created.

## 7. CAC / ACQUISITION SPEND BOUNDARY
Acquisition Spend remains the physical source for acquisition cost input.

Locked CAC formula:

CAC = Attributed Acquisition Spend / New Customers Acquired

Lead Attribution provides attribution context; Acquisition Spend provides spend input.

Acquisition Spend `campaign_id` must not be treated as an authoritative physical FK until Campaign physical authority is validated.

Lead Attribution must not duplicate acquisition spend data.

## 8. PHYSICAL FIELD DECISION
Physical schema remains HOLD for Lead Attribution, including but not limited to:
- id
- tenant_id
- lead_id
- campaign_id
- campaign_activity_id
- attribution timestamp
- attribution model
- attribution source
- created_at
- updated_at
- deleted_at

Exact SQL types, nullability, foreign keys, indexes, unique constraints, check constraints, cascade behavior, and migration shape remain HOLD.

## 9. TENANT ISOLATION
All attribution operations must be tenant-scoped.
Cross-tenant attribution is prohibited unless explicitly authorized by enterprise policy.

UI filtering is not a security boundary.

## 10. DATA RETENTION / CUSTOMER CONVERSION
When a Lead becomes a Customer, original attribution must remain available.

Customer creation must not erase or replace the original Lead Attribution record.

## 11. ATTRIBUTION MODEL V1
V1 attribution model is First Touch.

No multi-touch, last-touch, weighted, or algorithmic attribution physical implementation may be introduced under this contract without Architecture Review.

## 12. MIGRATION GATE
Migration Status: HOLD

Lead Attribution migration may proceed only after:
1. Campaign physical authority is validated.
2. Campaign Activity physical capability is validated.
3. Lead physical authority is validated against the attribution boundary.
4. Exact Lead Attribution physical schema is reviewed.
5. Tenant isolation and referential integrity are explicitly defined.

## 13. FINAL DECISION
Lead Attribution business and architecture contract is established.

Lead Attribution physical schema is NOT yet authoritative.

No invented physical columns.
No invented physical types.
No invented foreign keys.
No migration.

Status: APPROVED / LOCKED
