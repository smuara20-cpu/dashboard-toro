AMAAH POSTGRESQL MAPPING RESOLUTION DECISION 001

Version: 1.0
Status: HOLD / PARTIALLY RESOLVED
Classification: Controlled Engineering Decision
Gate: 015A
Step: 5N-E.4.3
Domain: Jamaah
Entity: Jamaah

1. Purpose

Dokumen ini menyelesaikan keputusan PostgreSQL yang dapat ditetapkan
berdasarkan evidence yang sudah authoritative, tanpa mengarang physical
schema untuk dependency yang masih HOLD.

Dokumen ini TIDAK mengotorisasi CREATE TABLE jamaah atau migration.

2. Resolution Matrix

#

Mapping Decision

Resolution

Status

1

UUID PK strategy

id tetap UUID; physical generation/default strategy belum dibuktikan authoritative

HOLD

2

tenant_id strategy

tenant_id NOT NULL secara logical; enforcement/index physical belum dapat dikunci tanpa physical Identity/Tenant authority

HOLD

3

customer_id type/FK

logical reference ke Customer; physical type/FK menunggu Customer physical authority

HOLD

4

jamaah_code

business identity jamaah_code diakui; type/nullability/generation/uniqueness belum authoritative

HOLD

5

identity_data

logical STRUCTURED DATA; representasi PostgreSQL belum authoritative

HOLD

6

status

field required secara logical; representation dan authoritative values belum final

HOLD

7

lifecycle

field required secara logical; representation dan authoritative values belum final

HOLD

8

timestamps

created_at/updated_at/deleted_at diakui logical; exact PostgreSQL type/default/nullability belum locked

HOLD

9

PK/UNIQUE/index

belum ada authorization untuk constraint/index Jamaah

HOLD

10

Customer FK

BLOCKED oleh Customer physical authority

HOLD

11

tenant-safe relationship

BLOCKED sampai parent physical key/unique strategy authoritative

HOLD

12

soft delete

deleted_at optional secara logical; exact physical semantics/index strategy belum locked

HOLD

3. Evidence Boundary

Evidence yang sudah tersedia hanya cukup untuk menetapkan:

Jamaah memiliki id, tenant_id, customer_id, jamaah_code,
identity_data, status, lifecycle, audit timestamps, dan optional
soft-delete secara logical.

Jamaah belum memiliki physical CREATE TABLE.

Customer physical authority masih HOLD.

Identity/Tenant physical authority belum tersedia sebagai parent physical
contract yang dapat dijadikan FK authority.

booking_passenger sudah memiliki FK logical/physical reference ke
jamaah(id), tetapi parent readiness masih HOLD.

Tidak boleh mengisi gap dengan asumsi umum PostgreSQL.

4. Decisions That Are Explicitly NOT Authorized

Tidak diizinkan pada step ini:

CREATE TABLE jamaah

migration Jamaah

CREATE TYPE ... ENUM

CREATE TABLE customer

Customer FK

tenant-safe composite FK

UNIQUE (tenant_id, jamaah_code)

index Jamaah

JSONB selection untuk identity_data

status/lifecycle enum values

default UUID generator

perubahan booking_passenger

5. Dependency Closure

Dependency

Status

Effect

Company

GREEN

Tidak memblokir mapping dasar

Branch

GREEN

Tidak memblokir mapping dasar

Customer

HOLD

Memblokir customer_id physical FK

Tenant / Identity

HOLD

Memblokir tenant enforcement physical

Jamaah logical contract

GREEN

Logical fields available

Jamaah PostgreSQL mapping

HOLD

SQL belum authorized

booking_passenger child

GREEN

Parent Jamaah readiness tetap HOLD

6. Decision

5N-E.4.3 = HOLD / PARTIALLY RESOLVED

Reason:

Mapping yang bersifat logical sudah direkonsiliasi, tetapi tidak seluruh
physical PostgreSQL decisions dapat diselesaikan secara evidence-first.
Customer dan Identity/Tenant physical authority masih menjadi dependency
blocker.

7. Required Next Step

Proceed to dependency resolution before Jamaah SQL:

Resolve Customer physical contract.

Resolve authoritative Identity/Tenant physical contract.

Re-open Jamaah mapping for exact PostgreSQL types and constraints.

Validate tenant-safe FK strategy.

Only then authorize Jamaah migration and required parent/child FK changes.

Governance:

Evidence → Decision → Validation → Approval → SQL → Validation → Commit/Push

No SQL authorization is granted by this document.