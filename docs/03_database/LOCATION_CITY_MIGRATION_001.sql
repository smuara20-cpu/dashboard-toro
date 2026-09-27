-- LOCATION CITY MIGRATION 001
-- Domain: Global Location / Database Architecture
-- Target: public.cities
-- Purpose: Create the physical City master table according to the approved Location Physical Contract.
-- Governance: LOCATION-PHYSICAL-CONTRACT-001
-- Parent: public.provinces

-- IMPORTANT:
-- This file is a migration artifact only.
-- Do NOT execute until implementation validation and approval gates are confirmed.

BEGIN;

CREATE TABLE public.cities (
    id UUID NOT NULL DEFAULT gen_random_uuid(),
    province_id UUID NOT NULL,
    code VARCHAR(20) NULL,
    name VARCHAR(150) NOT NULL,
    official_name VARCHAR(200) NULL,
    city_type VARCHAR(30) NULL,
    postal_code VARCHAR(20) NULL,
    capital BOOLEAN NOT NULL DEFAULT FALSE,
    area_km2 NUMERIC(18,2) NULL,
    population BIGINT NULL,
    timezone VARCHAR(100) NULL,
    description TEXT NULL,
    sort_order INTEGER NOT NULL DEFAULT 0,
    status SMALLINT NOT NULL DEFAULT 1,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    created_by UUID NULL,
    updated_at TIMESTAMP NULL,
    updated_by UUID NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by UUID NULL,
    CONSTRAINT pk_cities PRIMARY KEY (id),
    CONSTRAINT fk_cities_province
      FOREIGN KEY (province_id) REFERENCES public.provinces(id)
      ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE UNIQUE INDEX uq_cities_province_name
    ON public.cities (province_id, name);

CREATE UNIQUE INDEX uq_cities_province_code
    ON public.cities (province_id, code);

CREATE INDEX idx_cities_province_id ON public.cities (province_id);
CREATE INDEX idx_cities_code ON public.cities (code);
CREATE INDEX idx_cities_name ON public.cities (name);
CREATE INDEX idx_cities_city_type ON public.cities (city_type);
CREATE INDEX idx_cities_status ON public.cities (status);
CREATE INDEX idx_cities_is_active ON public.cities (is_active);
CREATE INDEX idx_cities_deleted_at ON public.cities (deleted_at);
CREATE INDEX idx_cities_sort_order ON public.cities (sort_order);

COMMIT;

-- ROLLBACK MIGRATION — EXECUTE SEPARATELY IF REQUIRED
-- BEGIN;
-- DROP TABLE public.cities;
-- COMMIT;

-- SAFETY BOUNDARY
-- No City data exists because public.cities does not currently exist.
-- No Province, Country, District, Village, Company, or tenant data is modified.
-- No trigger, function, RLS policy, or hierarchy enforcement is introduced.
-- Audit UUID fields remain nullable and do not introduce additional foreign keys.
-- Exact constraint/index names are defined by this migration artifact.
-- Migration execution requires separate validation before Supabase execution.
