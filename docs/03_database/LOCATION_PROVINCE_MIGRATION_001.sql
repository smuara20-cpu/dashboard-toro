-- LOCATION PROVINCE MIGRATION 001
-- Domain: Global Location / Database Architecture
-- Target: public.provinces
-- Purpose: Add the three documented Province fields missing from the current physical schema.
-- Governance: LOCATION-PHYSICAL-CONTRACT-001
-- Reconciliation: LOCATION-PROVINCE-STRUCTURE-RECONCILIATION-001
-- Gap Resolution: LOCATION-PROVINCE-GAP-RESOLUTION-001
--
-- IMPORTANT:
-- This file is a migration artifact only.
-- Do NOT execute until the implementation approval and pre-migration validation gates are confirmed.

BEGIN;

-- ============================================================
-- UP MIGRATION
-- ============================================================

ALTER TABLE public.provinces
    ADD COLUMN population BIGINT NULL,
    ADD COLUMN description TEXT NULL,
    ADD COLUMN sort_order INTEGER NOT NULL DEFAULT 0;

-- ============================================================
-- POST-CONDITION
-- ============================================================
-- Expected new columns:
-- population  BIGINT   NULL
-- description TEXT      NULL
-- sort_order  INTEGER   NOT NULL DEFAULT 0

COMMIT;

-- ============================================================
-- ROLLBACK MIGRATION — EXECUTE SEPARATELY IF REQUIRED
-- ============================================================
-- BEGIN;
-- ALTER TABLE public.provinces
--     DROP COLUMN sort_order,
--     DROP COLUMN description,
--     DROP COLUMN population;
-- COMMIT;

-- ============================================================
-- SAFETY BOUNDARY
-- ============================================================
-- No index is created for these fields.
-- No constraint other than NOT NULL on sort_order is added.
-- No existing Province data is explicitly updated.
-- Existing rows receive the declared default value 0 for sort_order.
-- population and description remain NULL for existing rows.
-- No Country, City, District, Village, Company, or tenant structure is modified.
-- No trigger, function, RLS policy, or hierarchy enforcement is modified.
