-- LOCATION DISTRICT MIGRATION 001
-- Domain: Global Location / Database Architecture
-- Target: public.districts
-- Purpose: Create the physical District master table according to the approved
-- District Physical Contract and LOCATION DISTRICT GAP RESOLUTION DECISION 001.
-- Governance: LOCATION-PHYSICAL-CONTRACT-001
-- Gap Resolution: LOCATION-DISTRICT-GAP-RESOLUTION-001
-- Parent: public.cities
--
-- IMPORTANT:
-- This file is a migration artifact only.
-- Do NOT execute until implementation validation and execution approval are confirmed.

BEGIN;

CREATE TABLE public.districts (
    district_id UUID NOT NULL DEFAULT gen_random_uuid(),
    country_id UUID NOT NULL,
    province_id UUID NOT NULL,
    city_id UUID NOT NULL,
    district_code VARCHAR(20) NOT NULL,
    district_name VARCHAR(100) NOT NULL,
    postal_code VARCHAR(10) NULL,
    latitude DECIMAL(10,8) NULL,
    longitude DECIMAL(11,8) NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    created_by UUID NOT NULL,
    updated_at TIMESTAMP NULL,
    updated_by UUID NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by UUID NULL,

    CONSTRAINT pk_districts
        PRIMARY KEY (district_id),

    CONSTRAINT fk_districts_city
        FOREIGN KEY (city_id)
        REFERENCES public.cities(id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
);

CREATE UNIQUE INDEX uq_districts_city_code
    ON public.districts (city_id, district_code);

CREATE UNIQUE INDEX uq_districts_city_name
    ON public.districts (city_id, district_name);

CREATE INDEX idx_districts_district_code
    ON public.districts (district_code);

CREATE INDEX idx_districts_district_name
    ON public.districts (district_name);

CREATE INDEX idx_districts_city_id
    ON public.districts (city_id);

CREATE INDEX idx_districts_province_id
    ON public.districts (province_id);

CREATE INDEX idx_districts_country_id
    ON public.districts (country_id);

CREATE INDEX idx_districts_is_active
    ON public.districts (is_active);

COMMIT;

-- ROLLBACK MIGRATION — EXECUTE SEPARATELY IF REQUIRED
-- BEGIN;
-- DROP TABLE public.districts;
-- COMMIT;

-- SAFETY BOUNDARY
-- No District data is inserted by this migration.
-- No Country, Province, or City data is modified.
-- country_id and province_id are retained as controlled-denormalized references.
-- No trigger, function, RLS policy, composite FK, cascade, SET NULL,
-- or additional hierarchy enforcement mechanism is introduced.
-- Exact constraint and index names are defined by this migration artifact.
-- Migration execution requires separate validation and approval.
