# VENTRA CURRENT CHECKPOINT

**Project:** VENTRA / dashboard_kpi  
**Repository Path:** `C:\FlutterProject\dashboard_kpi`  
**Checkpoint Date:** 2026-09-11  
**Checkpoint Status:** ACTIVE

---

## 1. PURPOSE

This document is the continuation anchor for VENTRA development.

When a conversation reaches its length limit and a new ChatGPT conversation is started, this document must be treated as the repository-level continuation checkpoint together with the existing VENTRA documentation and locked decisions.

**Do not restart the project from zero.**

---

## 2. GOVERNANCE

VENTRA development follows the established VENTRA Development Constitution / Enterprise governance and the existing repository standards.

Core principles include:

1. Business Correctness
2. Architecture Correctness
3. Enterprise Readiness
4. Scalability
5. Security
6. Performance
7. Maintainability
8. Extensibility
9. Testability
10. AI Readiness
11. Documentation Quality
12. Governance

Additional database governance already present in the repository must be respected, including authoritative blueprint usage, controlled migration, validation, rollback/recovery planning, and no uncontrolled physical-schema invention.

---

## 3. NON-NEGOTIABLE DEVELOPMENT RULES

1. Do not invent architecture.
2. Do not invent physical database schema.
3. Do not implement against an unapproved physical schema.
4. Do not create a migration merely to unblock coding.
5. Do not silently change business meaning.
6. Do not modify locked decisions without an explicit new decision/change record.
7. Perform discovery when authority or existing implementation is uncertain.
8. Work through explicit gates and evidence.
9. Test and validate before commit.
10. Keep Git history clean and auditable.
11. If repository evidence conflicts with an assumption, stop and investigate rather than guessing.
12. A technically possible implementation is NOT automatically an approved implementation.

---

## 4. CURRENT DOMAIN CONTEXT

The current work concerns the Booking ↔ Jamaah relationship, specifically the physical database mapping involving:

`booking_passenger`

The business/relationship-level decisions and physical-relationship documents exist in:

`docs/20_blueprints/booking/`

Relevant documents currently present include:

- `BOOKING-JAMAAH-PHYSICAL-RELATIONSHIP-CONTRACT-001.md`
- `BOOKING-JAMAAH-PHYSICAL-RELATIONSHIP-DECISION-001.md`
- `BOOKING-JAMAAH-RELATIONSHIP-DECISION-002.md`

---

## 5. CURRENT DB-8 GATE

### DB-8 — Physical Schema Authority

**Objective:** determine the authoritative source/authority that defines the physical schema for `booking_passenger`.

Current status:

**NOT RESOLVED**

The existing discovery did not find an authoritative physical `CREATE TABLE booking_passenger` definition or an authoritative physical PRIMARY KEY / FOREIGN KEY mapping.

The existing physical relationship decision states that the exact physical database mapping is not yet defined and that physical implementation must remain on HOLD until an explicit physical schema decision is available.

---

## 6. CURRENT HOLD

Until DB-8 is resolved:

- Coding: **HOLD**
- Repository/entity/model implementation: **HOLD**
- Datasource/mapper implementation: **HOLD**
- Database migration: **HOLD**
- Physical schema invention: **FORBIDDEN**
- Commit of implementation: **HOLD**

Do not bypass this gate.

---

## 7. LAST DISCOVERY EVIDENCE

The latest repository discovery searched for:

- `CREATE TABLE booking_passenger`
- `CREATE TABLE.*booking_passenger`
- `booking_passenger.*PRIMARY KEY`
- `booking_passenger.*FOREIGN KEY`
- physical schema
- physical database
- database authority
- schema authority
- migration

The search returned governance and blueprint references, but no authoritative physical table definition for `booking_passenger`.

Important existing evidence:

- `BOOKING-JAMAAH-PHYSICAL-RELATIONSHIP-CONTRACT-001.md` states that silent physical schema invention is not permitted.
- `BOOKING-JAMAAH-PHYSICAL-RELATIONSHIP-DECISION-001.md` states that the exact physical database mapping is not yet defined and physical implementation is therefore HOLD.
- `BOOKING-JAMAAH-PHYSICAL-RELATIONSHIP-DECISION-001.md` also states that implementation requires a subsequent approved physical schema decision.
- `BOOKING-JAMAAH-RELATIONSHIP-DECISION-002.md` states that the decision does not approve a physical database schema.

---

## 8. LAST GIT STATE

Latest reported commands:

```powershell
git diff --check
git status --short
```

`git diff --check` returned no output, indicating no reported whitespace errors.

The reported untracked files were:

```text
?? docs/20_blueprints/booking/BOOKING-JAMAAH-PHYSICAL-RELATIONSHIP-CONTRACT-001.md
?? docs/20_blueprints/booking/BOOKING-JAMAAH-PHYSICAL-RELATIONSHIP-DECISION-001.md
?? docs/20_blueprints/booking/BOOKING-JAMAAH-RELATIONSHIP-DECISION-002.md
```

No implementation commit was approved at this checkpoint.

---

## 9. NEXT APPROVED STEP

### Step 1 — Resolve DB-8

Perform repository discovery to determine whether an authoritative source exists elsewhere for the physical schema of `booking_passenger`.

Potential evidence categories to inspect:

- authoritative database blueprints
- SQL schema definitions
- migration directories
- database physical decision documents
- schema authority/governance documents
- existing approved database contracts

Do not infer the schema from naming alone.

### Step 2 — Decision

If an authoritative existing schema is found:

- identify it precisely,
- document the authority,
- align the relationship to the existing schema,
- do not create a competing schema.

If no authoritative schema is found:

- create/review the appropriate explicit physical schema decision,
- document PK/FK/cardinality/nullability/index/tenant implications as required by the applicable standards,
- obtain the required approval before implementation.

### Step 3 — Only after approval

Proceed in this order:

```text
Approved Physical Schema
        ↓
Implementation Design
        ↓
Code
        ↓
Migration (if required)
        ↓
Tests
        ↓
flutter analyze / relevant quality gates
        ↓
git diff --check
        ↓
git status
        ↓
Commit
        ↓
Update this checkpoint
```

---

## 10. CHAT CONTINUATION PROTOCOL

When starting a new ChatGPT conversation for this project, provide this instruction:

> Continue VENTRA / dashboard_kpi from `docs/00_project/VENTRA-CURRENT-CHECKPOINT.md`. Do not restart from zero. Treat repository documentation and locked decisions as the source of truth. First inspect the current checkpoint and relevant repository evidence. Do not code, migrate, or commit unless the current gate explicitly permits it.

The assistant must preserve the current gate unless repository evidence or an approved decision changes it.

---

## 11. CHECKPOINT UPDATE RULE

This file must be updated whenever a meaningful project gate changes, including:

- a decision becomes approved/locked,
- a physical schema becomes authoritative,
- implementation begins,
- implementation completes,
- tests/quality gates pass or fail,
- a migration is created/applied,
- a commit is made,
- a new HOLD is introduced,
- a blocker is resolved.

Each update should record:

- date,
- gate,
- evidence,
- decision,
- implementation status,
- test status,
- Git status,
- exact next step.

---

## 12. CURRENT ONE-LINE STATE

> **DB-8: booking_passenger physical schema authority is unresolved; physical implementation, migration, and implementation commit remain HOLD.**

