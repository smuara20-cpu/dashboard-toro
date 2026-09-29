BEGIN;

CREATE TABLE public.villages (
    village_id UUID NOT NULL DEFAULT gen_random_uuid(),
    country_id UUID NOT NULL,
    province_id UUID NOT NULL,
    city_id UUID NOT NULL,
    district_id UUID NOT NULL,
    village_code VARCHAR(30) NOT NULL,
    village_name VARCHAR(150) NOT NULL,
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

    CONSTRAINT pk_villages
        PRIMARY KEY (village_id),

    CONSTRAINT fk_villages_district
        FOREIGN KEY (district_id)
        REFERENCES public.districts(district_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
);

CREATE UNIQUE INDEX uq_villages_district_code
    ON public.villages (district_id, village_code);

CREATE UNIQUE INDEX uq_villages_district_name
    ON public.villages (district_id, village_name);

CREATE INDEX idx_villages_village_code
    ON public.villages (village_code);

CREATE INDEX idx_villages_village_name
    ON public.villages (village_name);

CREATE INDEX idx_villages_district_id
    ON public.villages (district_id);

CREATE INDEX idx_villages_city_id
    ON public.villages (city_id);

CREATE INDEX idx_villages_province_id
    ON public.villages (province_id);

CREATE INDEX idx_villages_country_id
    ON public.villages (country_id);

CREATE INDEX idx_villages_postal_code
    ON public.villages (postal_code);

CREATE INDEX idx_villages_is_active
    ON public.villages (is_active);

COMMIT;
