COMPANY PHYSICAL AUTHORITY RECONCILIATION 001

Version: 1.0
Status: APPROVED / LOCKED
Classification: Controlled Engineering Decision
Domain: Core / Company
Entity: Company

1. Purpose

Dokumen ini menetapkan physical authority Company setelah rekonsiliasi
evidence antara Core Data Dictionary, Master Table List, dan Master Data
Company Data Dictionary.

Keputusan ini menjadi basis untuk physical database reconciliation
domain yang bergantung pada Company.

2. Evidence Reviewed

docs/03_database/master_table_list.md

Company tercantum sebagai master table Core: company.

docs/03_database/data_dictionary/core/company.md

Company adalah root data ERP.

Primary key didefinisikan sebagai id UUID.

Security menggunakan company_id.

docs/03_database/master_data/company/data_dictionary.md

Status: APPROVED.

Table Name: companies.

Primary Key: company_id.

Database: PostgreSQL.

Dokumen menyatakan Data Dictionary sebagai Single Source of Truth
untuk struktur data Company.

Mendefinisikan columns, foreign keys, indexes, unique constraint,
audit, dan soft delete.

docs/03_database/master_data/branch/data_dictionary.md

Branch menggunakan company_id.

Foreign key mengarah ke companies.company_id.

Unique constraint Branch adalah (company_id, branch_code).

Tenant / Company authority:

Tenant adalah enterprise tenancy boundary.

Company adalah canonical business/master/data-owner entity.

company_id bukan pengganti tenant_id.

Tidak ada physical Organization table untuk menggantikan Company.

3. Authority Precedence

Untuk physical database structure Company, approved Master Data Company
Data Dictionary menjadi authoritative source.

Reason:

Dokumen berstatus APPROVED.

Dokumen secara eksplisit menyatakan dirinya sebagai Single Source of
Truth untuk struktur data Company.

Dokumen menetapkan PostgreSQL sebagai database target.

Dokumen menetapkan table name, primary key, columns, foreign keys,
indexes, unique constraint, audit, dan soft delete.

core/company.md tetap menjadi domain/business reference, tetapi
perbedaan physical naming dengan Master Data Company diperlakukan
sebagai documented legacy/core naming conflict.

4. Canonical Physical Authority

Approved physical Company authority:

Table: companies
Primary Key: company_id UUID
Canonical business identity: company_code VARCHAR(30) UNIQUE
Database: PostgreSQL

5. Approved Physical Contract

The approved Master Data Company Data Dictionary defines:

company_id UUID NOT NULL PRIMARY KEY

company_code VARCHAR(30) NOT NULL UNIQUE

legal_name VARCHAR(200) NOT NULL

display_name VARCHAR(200) NOT NULL

brand_name VARCHAR(200) NULL

company_type VARCHAR(50) NOT NULL

registration_number VARCHAR(100) NULL

tax_identification_number VARCHAR(100) NULL

email VARCHAR(200) NULL

phone VARCHAR(30) NULL

website VARCHAR(255) NULL

logo_url TEXT NULL

favicon_url TEXT NULL

country_id UUID NOT NULL

province_id UUID NULL

city_id UUID NULL

district_id UUID NULL

village_id UUID NULL

postal_code VARCHAR(20) NULL

address_line_1 VARCHAR(255) NOT NULL

address_line_2 VARCHAR(255) NULL

default_language_code VARCHAR(10) NOT NULL

default_currency_code VARCHAR(10) NOT NULL

default_timezone VARCHAR(50) NOT NULL

fiscal_year_start_month SMALLINT NOT NULL

company_status VARCHAR(30) NOT NULL

verification_status VARCHAR(30) NOT NULL

subscription_plan VARCHAR(50) NULL

license_expired_at TIMESTAMP NULL

created_at TIMESTAMP NOT NULL

created_by UUID NOT NULL

updated_at TIMESTAMP NULL

updated_by UUID NULL

deleted_at TIMESTAMP NULL

deleted_by UUID NULL

Exact defaults and FK targets remain those defined by the approved
Master Data Company Data Dictionary.

6. Foreign Key Authority

The approved Master Data Company Data Dictionary defines:

country_id → countries.country_id

province_id → provinces.province_id

city_id → cities.city_id

district_id → districts.district_id

village_id → villages.village_id

No additional Company FK may be invented from this decision.

7. Tenant Boundary

Company and Tenant remain distinct.

Approved relationship:

Tenant
│ 1:1
▼
Company

Therefore:

company_id remains the Company identifier.

tenant_id remains the enterprise tenancy boundary.

company_id must not be renamed to tenant_id.

tenant_id must not be invented as a replacement Company column.

No Organization table may be introduced for session purposes.

Tenant/session resolution remains owned by the Identity & Access
authority.

8. Legacy / Core Naming Conflict

The following conflict is formally recorded:

core/company.md
table concept: company
PK: id UUID

master_data/company/data_dictionary.md
physical table: companies
PK: company_id UUID

This decision does not silently rewrite core/company.md or
master_table_list.md.

The approved physical authority for database implementation is:

companies.company_id

Any future change to the Core naming documents must use controlled
documentation reconciliation.

9. Downstream Impact

This decision establishes the physical Company target for dependent
domains.

Potential dependent relationships may use company_id only when their
own physical contract explicitly approves the relationship.

This decision does not automatically authorize:

Customer → Company FK

Booking → Company FK

Jamaah → Company FK

CRM → Company FK

Marketing → Company FK

Those relationships require validation in their respective physical
contracts.

10. Migration Readiness

This decision establishes physical authority but does NOT authorize
creation of a Company migration by itself.

Before migration:

Validate referenced location table physical authority.

Validate exact PostgreSQL FK targets and supporting keys.

Validate enum/lookup strategy for Company status fields.

Validate timestamp standard against PostgreSQL project standard.

Validate RLS / tenant isolation implementation.

Prepare forward migration.

Prepare rollback migration.

Run PostgreSQL validation.

Reconcile dependent domain contracts.

No migration shall be created from this document alone.

11. Governance

Any change affecting table name, primary key, company_code, column type,
nullability, FK, unique constraint, tenant boundary, audit behavior, or
soft delete requires controlled engineering review and, where applicable,
Architecture Decision / Architecture Review.

12. Decision

APPROVED / LOCKED

Canonical physical Company authority:

companies.company_id

This decision closes the Company Physical Authority Reconciliation
evidence gap for physical naming and primary-key authority.

13. Downstream Gate Status

Company Physical Authority Reconciliation: GREEN

Customer Physical Contract: REVIEW / HOLD pending Customer-specific
physical reconciliation.

Booking Physical Authority: HOLD pending Booking-specific parent
physical contract.

Jamaah Physical Authority: HOLD pending final PostgreSQL physical
mapping.

booking_passenger: PHYSICAL SQL EXISTS, but parent reconciliation
remains required.

Gate 015A: HOLD pending parent physical authority and PostgreSQL
validation.