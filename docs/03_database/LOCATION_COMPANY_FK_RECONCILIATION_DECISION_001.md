LOCATION COMPANY FK RECONCILIATION DECISION 001

Version: 1.0
Status: APPROVED / LOCKED
Classification: Controlled Engineering Decision
Domain: Global Location / Core Company
Decision ID: LOCATION-COMPANY-FK-RECONCILIATION-001

1. PURPOSE

Dokumen ini menetapkan hasil rekonsiliasi evidence antara physical
authority Company dan Master Data Location sebelum implementasi
Company migration.

Decision ini menjadi gate resmi untuk mencegah FK Company dibuat
berdasarkan asumsi atau target physical object yang belum terbukti.

2. EVIDENCE REVIEWED

Company:
docs/03_database/COMPANY_PHYSICAL_AUTHORITY_RECONCILIATION_001.md
docs/03_database/master_data/company/data_dictionary.md

Country:
docs/03_database/master_data/global/location/country/data_dictionary.md

Province:
docs/03_database/master_data/global/location/province/data_dictionary.md

City:
docs/03_database/master_data/global/location/city/data_dictionary.md

District:
docs/03_database/master_data/global/location/district/data_dictionary.md

Village:
docs/03_database/master_data/global/location/village/data_dictionary.md

3. VERIFIED LOCATION AUTHORITY

Country:
- Primary Key: id UUID
- Country reference is country.id

Province:
- Primary Key: id UUID
- country_id references country.id

City:
- Primary Key: id UUID
- province_id references province.id

District:
- Table Name: md_district
- Primary Key: district_id UUID
- References include md_country.country_id,
  md_province.province_id, and md_city.city_id

Village:
- Table Name: md_village
- Primary Key: village_id UUID
- References include md_country.country_id,
  md_province.province_id, md_city.city_id,
  and md_district.district_id

4. VERIFIED COMPANY AUTHORITY

Canonical Company physical table:

companies

Primary Key:

company_id UUID

Company Data Dictionary defines:

country_id  -> countries.country_id
province_id -> provinces.province_id
city_id     -> cities.city_id
district_id -> districts.district_id
village_id  -> villages.village_id

5. RECONCILIATION FINDINGS

The reviewed approved documents contain physical naming conflicts.

Conflict A - Country:

Company authority references:

countries.country_id

Location Country authority defines:

country.id

Conflict B - Province:

Company authority references:

provinces.province_id

Location Province authority defines:

province.id

Conflict C - City:

Company authority references:

cities.city_id

Location City authority defines:

city.id

Conflict D - District:

Company authority references:

districts.district_id

Location authority defines:

md_district.district_id

Conflict E - Village:

Company authority references:

villages.village_id

Location authority defines:

md_village.village_id

6. EXISTING SUPABASE IMPLEMENTATION EVIDENCE

Existing VENTRA-DEV physical implementation includes:

public.countries
- Primary Key: id

public.provinces
- Primary Key: id
- country_id references public.countries(id)

The existing public.provinces implementation also requires
reconciliation against the approved Province Data Dictionary because
the current physical implementation contains fewer columns than the
approved source definition.

7. DECISION

The approved Location Data Dictionaries remain evidence authorities
for their respective documented structures.

The existing Company Physical Authority remains authoritative for
Company table identity:

companies.company_id

However, the Company FK targets listed in the current Company Data
Dictionary SHALL NOT be physically implemented until the Location /
Company FK mapping is formally reconciled.

No developer, migration, SQL script, Flutter code, API code, or
database change may infer missing aliases, rename primary keys,
introduce compatibility columns, or create substitute tables to
resolve the conflict.

8. PROHIBITED ACTIONS

The following are not authorized by this decision:

- Adding country_id as a replacement or alias PK to countries
- Adding province_id as a replacement or alias PK to provinces
- Adding city_id as a replacement or alias PK to cities without
  approved physical authority
- Renaming existing Location PK columns without controlled decision
- Creating districts solely to satisfy the Company Data Dictionary
- Creating villages solely to satisfy the Company Data Dictionary
- Creating duplicate md_district/district structures
- Creating duplicate md_village/village structures
- Creating Company migration with unresolved FK targets
- Silently modifying approved Data Dictionaries
- Adding compatibility columns without a separate physical decision

9. MIGRATION GATE

Company migration remains:

HOLD

until all of the following are completed:

1. Location physical naming reconciliation.
2. Country physical target confirmation.
3. Province physical target confirmation.
4. City physical target confirmation.
5. District physical target confirmation.
6. Village physical target confirmation.
7. Supporting PK/UNIQUE validation in PostgreSQL.
8. Province implementation reconciliation against its approved
   20-column Data Dictionary.
9. Company FK contract update or explicit controlled reconciliation.
10. Forward migration design.
11. Rollback design.
12. PostgreSQL validation.

10. TENANT BOUNDARY

This decision does not alter:

- tenant_id
- Tenant authority
- SP-203
- Session resolution
- Company canonical identity
- Organization boundary

Company remains distinct from Tenant.

11. GOVERNANCE

Any change to Location table name, primary key, Company FK target,
column type, unique constraint, or physical authority requires a
controlled engineering decision.

No schema modification is authorized merely because two documents
contain different names.

12. DECISION STATUS

APPROVED / LOCKED

Location / Company FK Reconciliation Gate:
GREEN as a governance decision.

Company FK physical implementation:
HOLD pending final physical mapping.

Company migration:
HOLD.

This decision closes the evidence identification gap and establishes
the controlled gate for the next physical reconciliation step.
