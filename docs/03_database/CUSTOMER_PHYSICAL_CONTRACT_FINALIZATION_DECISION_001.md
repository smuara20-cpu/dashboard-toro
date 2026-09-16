# CUSTOMER PHYSICAL CONTRACT FINALIZATION DECISION 001

**Step:** 5N-E.4.22  
**Domain:** Customer  
**Status:** HOLD / PHYSICAL CONTRACT NOT AUTHORIZED FOR DDL  
**SQL Authorization:** NOT AUTHORIZED  
**Migration Authorization:** NOT AUTHORIZED

---

## 1. PURPOSE

Dokumen ini menetapkan formal decision boundary untuk
Customer Physical Contract setelah rangkaian:

- 5N-E.4.14 Deep Extraction & Reconciliation Customer Authority
- 5N-E.4.15 Global Customer Boundary Evidence Discovery
- 5N-E.4.16 Customer Entity Boundary Classification Decision
- 5N-E.4.17 Customer Physical Table Decomposition & Column Authority Matrix
- 5N-E.4.18 Customer Column Evidence Reconciliation
- 5N-E.4.19 Customer Physical Contract Decision Closure
- 5N-E.4.20 Customer Physical Decision Resolution
- 5N-E.4.21 Physical Implementation Authority Gap Closure

Dokumen ini TIDAK membuat PostgreSQL DDL dan TIDAK mengotorisasi
Customer migration.

---

## 2. AUTHORITATIVE BASELINE

Customer Domain authority:

- DB-201 Customer Database Blueprint
- Customer Business Rules / BP-101
- Customer ERD / database design
- Generic database/table standards
- Company Physical Authority
- Branch Physical Authority
- Tenant / Identity governance
- Jamaah physical dependency decisions
- Booking physical dependency decisions

Customer Database remains the authoritative Customer data domain.

---

## 3. AUTHORIZED BOUNDARY

The following are authorized at business/logical level:

### Customer Core

- Customer entity / Aggregate Root
- Customer Identity
- Customer Master
- Customer Profile
- Customer Classification
- Customer Lifecycle
- Customer Metadata

### Customer Supporting Components

- Customer Contact
- Customer Address
- Customer Passport
- Customer Family
- Customer Preference
- Customer Loyalty
- Customer Consent

### Customer Relationships

- Customer → Company
- Customer → Branch
- Customer → Tenant boundary
- Customer → Jamaah
- Customer → Booking

These authorizations DO NOT constitute PostgreSQL DDL authorization.

---

## 4. AUTHORIZED BUSINESS ATTRIBUTES

The following attributes have business/domain evidence:

- id
- tenant_id
- company_id
- branch_id
- customer_number
- full_name
- gender
- date_of_birth
- nationality
- identity_type
- identity_number
- status
- created_at
- updated_at
- deleted_at
- created_by
- updated_by
- deleted_by

Customer Number business rules:

- required
- unique
- permanent
- immutable
- automatically generated
- numbering convention: CUS-000001

---

## 5. PHYSICAL CONTRACT STATUS MATRIX

| Area | Decision |
|---|---|
| Customer core entity | AUTHORIZED |
| UUID identity | AUTHORIZED |
| UUID generation mechanism | NOT AUTHORIZED |
| tenant_id requirement | AUTHORIZED |
| tenant physical reference | NOT AUTHORIZED |
| company authority | AUTHORIZED |
| company FK implementation | NOT AUTHORIZED |
| branch authority | AUTHORIZED |
| branch FK implementation | NOT AUTHORIZED |
| customer_number business rule | AUTHORIZED |
| customer_number PostgreSQL type | NOT AUTHORIZED |
| customer_number generation mechanism | NOT AUTHORIZED |
| customer_number UNIQUE implementation | NOT AUTHORIZED |
| Customer lifecycle | AUTHORIZED |
| PostgreSQL status representation | NOT AUTHORIZED |
| Audit fields | AUTHORIZED BY STANDARD |
| Soft-delete convention | AUTHORIZED BY STANDARD |
| Customer-specific indexes | NOT AUTHORIZED |
| Tenant enforcement mechanism | NOT AUTHORIZED |
| RLS | NOT AUTHORIZED |
| Customer → Jamaah physical FK | NOT AUTHORIZED |
| Customer → Booking physical FK | NOT AUTHORIZED |
| Customer migration | NOT AUTHORIZED |
| Customer rollback migration | NOT AUTHORIZED |

---

## 6. CRITICAL GOVERNANCE BOUNDARY

The following MUST NOT be implemented based on assumption:

- UUID generation/default
- Tenant foreign key
- Company foreign key implementation
- Branch foreign key implementation
- Customer Number generation mechanism
- Customer Number PostgreSQL datatype
- Customer status representation
- Customer-specific indexes
- RLS policies
- tenant enforcement mechanism
- Customer → Jamaah FK
- Customer → Booking FK
- CREATE TABLE customer
- Customer migration

Generic PostgreSQL best practices MUST NOT be treated as
Customer-specific physical authority.

---

## 7. SQL AUTHORIZATION

SQL authorization remains:

**NOT AUTHORIZED**

The following are explicitly prohibited at this stage:

- CREATE TABLE customer
- CREATE TABLE customer_contact
- CREATE TABLE customer_address
- CREATE TABLE customer_passport
- CREATE TABLE customer_family
- CREATE TABLE customer_preference
- CREATE TABLE customer_loyalty
- CREATE TABLE customer_consent
- Customer-specific ENUM creation
- Customer-specific FK creation
- Customer-specific UNIQUE creation
- Customer-specific INDEX creation
- RLS policy creation

---

## 8. MIGRATION AUTHORIZATION

Customer PostgreSQL migration is:

**NOT AUTHORIZED**

No migration file shall be created until the unresolved
physical implementation authorities are explicitly resolved.

---

## 9. DEPENDENCY BOUNDARY

Customer physical implementation remains dependent on:

### Identity / Tenant

Required for:

- tenant_id physical reference
- tenant enforcement
- authorization boundary
- RLS decision

### Company

Physical parent authority:

`companies.company_id`

### Branch

Physical parent authority:

`branches.branch_id`

### Jamaah

Customer → Jamaah physical relationship remains HOLD.

### Booking

Customer → Booking physical relationship remains HOLD.

No dependent FK shall be implemented before the referenced
physical authority is GREEN.

---

## 10. FINAL DECISION

### Business / Logical Authority

**GREEN**

### Customer Entity Boundary

**GREEN**

### Customer Column Evidence

**GREEN at business/logical level**

### Physical PostgreSQL Contract

**HOLD**

### PostgreSQL DDL

**NOT AUTHORIZED**

### Customer Migration

**NOT AUTHORIZED**

### Commit / Push

**NOT AUTHORIZED**

---

## 11. NEXT AUTHORIZED STEP

Next step:

**5N-E.4.23 — Identity / Tenant Physical Authority Resolution**

Focus:

- Tenant physical entity authority
- Tenant primary key
- tenant_id physical strategy
- Identity source
- User identity relationship
- session identity
- tenant enforcement
- authorization boundary
- RLS authority

Customer Physical Contract cannot be finalized beyond this
boundary until Tenant / Identity physical authority is resolved.

---

## 12. GOVERNANCE RULE

Evidence → Decision → Implementation → Validation → Approval → Commit/Push

No SQL implementation may bypass this sequence.

**5N-E.4.22 CLOSED AS FORMAL DECISION BOUNDARY.**
**Customer PostgreSQL DDL remains LOCKED.**