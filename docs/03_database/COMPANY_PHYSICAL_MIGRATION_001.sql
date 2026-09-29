BEGIN;

CREATE TABLE public.companies (
    company_id UUID NOT NULL DEFAULT gen_random_uuid(),
    company_code VARCHAR(30) NOT NULL,
    legal_name VARCHAR(200) NOT NULL,
    display_name VARCHAR(200) NOT NULL,
    brand_name VARCHAR(200) NULL,
    company_type VARCHAR(50) NOT NULL,
    registration_number VARCHAR(100) NULL,
    tax_identification_number VARCHAR(100) NULL,
    email VARCHAR(200) NULL,
    phone VARCHAR(30) NULL,
    website VARCHAR(255) NULL,
    logo_url TEXT NULL,
    favicon_url TEXT NULL,
    country_id UUID NOT NULL,
    province_id UUID NULL,
    city_id UUID NULL,
    district_id UUID NULL,
    village_id UUID NULL,
    postal_code VARCHAR(20) NULL,
    address_line_1 VARCHAR(255) NOT NULL,
    address_line_2 VARCHAR(255) NULL,
    default_language_code VARCHAR(10) NOT NULL DEFAULT 'en',
    default_currency_code VARCHAR(10) NOT NULL DEFAULT 'USD',
    default_timezone VARCHAR(50) NOT NULL DEFAULT 'UTC',
    fiscal_year_start_month SMALLINT NOT NULL DEFAULT 1,
    company_status VARCHAR(30) NOT NULL DEFAULT 'Registered',
    verification_status VARCHAR(30) NOT NULL DEFAULT 'Pending',
    subscription_plan VARCHAR(50) NULL,
    license_expired_at TIMESTAMP NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    created_by UUID NOT NULL,
    updated_at TIMESTAMP NULL,
    updated_by UUID NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by UUID NULL,

    CONSTRAINT pk_companies
        PRIMARY KEY (company_id),

    CONSTRAINT fk_companies_country
        FOREIGN KEY (country_id)
        REFERENCES public.countries(id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,

    CONSTRAINT fk_companies_province
        FOREIGN KEY (province_id)
        REFERENCES public.provinces(id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,

    CONSTRAINT fk_companies_city
        FOREIGN KEY (city_id)
        REFERENCES public.cities(id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,

    CONSTRAINT fk_companies_district
        FOREIGN KEY (district_id)
        REFERENCES public.districts(district_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,

    CONSTRAINT fk_companies_village
        FOREIGN KEY (village_id)
        REFERENCES public.villages(village_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
);

CREATE UNIQUE INDEX uq_companies_company_code
    ON public.companies (company_code);

CREATE INDEX idx_companies_legal_name
    ON public.companies (legal_name);

CREATE INDEX idx_companies_display_name
    ON public.companies (display_name);

CREATE INDEX idx_companies_company_status
    ON public.companies (company_status);

CREATE INDEX idx_companies_country_id
    ON public.companies (country_id);

CREATE INDEX idx_companies_city_id
    ON public.companies (city_id);

COMMIT;
