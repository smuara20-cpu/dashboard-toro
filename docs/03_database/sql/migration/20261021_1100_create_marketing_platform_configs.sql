-- VENTRA Marketing Platform Configuration
-- Status: LOCAL DRAFT - REVIEW BEFORE DATABASE EXECUTION
-- Stores configuration only. OAuth credentials/tokens are not stored here.

BEGIN;

DO $$
BEGIN
    IF to_regclass('public.tenants') IS NULL THEN
        RAISE EXCEPTION 'Migration blocked: public.tenants does not exist';
    END IF;

    IF to_regprocedure('public.resolve_effective_tenant_access()') IS NULL THEN
        RAISE EXCEPTION 'Migration blocked: tenant access resolver does not exist';
    END IF;
END
$$;

CREATE TABLE public.marketing_platform_configs (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id uuid NOT NULL
        REFERENCES public.tenants(tenant_id) ON DELETE CASCADE,
    platform text NOT NULL
        CHECK (platform IN ('instagram', 'meta_ads', 'tiktok_ads')),
    profile_url text NOT NULL
        CHECK (
            profile_url ~* '^https?://[^[:space:]]+$'
        ),
    external_account_id text NULL
        CHECK (
            external_account_id IS NULL
            OR length(btrim(external_account_id)) BETWEEN 1 AND 200
        ),
    created_by uuid NOT NULL DEFAULT auth.uid(),
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT marketing_platform_configs_tenant_platform_unique
        UNIQUE (tenant_id, platform)
);

CREATE INDEX marketing_platform_configs_tenant_idx
    ON public.marketing_platform_configs (tenant_id);

ALTER TABLE public.marketing_platform_configs
    ENABLE ROW LEVEL SECURITY;

REVOKE ALL PRIVILEGES
    ON TABLE public.marketing_platform_configs
    FROM anon;

GRANT SELECT, INSERT, UPDATE, DELETE
    ON TABLE public.marketing_platform_configs
    TO authenticated;

DROP POLICY IF EXISTS marketing_platform_configs_tenant_access
    ON public.marketing_platform_configs;

CREATE POLICY marketing_platform_configs_tenant_access
    ON public.marketing_platform_configs
    FOR ALL
    TO authenticated
    USING (
        EXISTS (
            SELECT 1
            FROM public.resolve_effective_tenant_access() AS access
            WHERE access.user_id = (SELECT auth.uid())
              AND access.tenant_id =
                  marketing_platform_configs.tenant_id
        )
    )
    WITH CHECK (
        EXISTS (
            SELECT 1
            FROM public.resolve_effective_tenant_access() AS access
            WHERE access.user_id = (SELECT auth.uid())
              AND access.tenant_id =
                  marketing_platform_configs.tenant_id
        )
        AND created_by = (SELECT auth.uid())
    );

CREATE OR REPLACE FUNCTION
    public.set_marketing_platform_configs_updated_at()
RETURNS trigger
LANGUAGE plpgsql
SET search_path = ''
AS $$
BEGIN
    NEW.updated_at := now();
    RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS marketing_platform_configs_updated_at
    ON public.marketing_platform_configs;

CREATE TRIGGER marketing_platform_configs_updated_at
    BEFORE UPDATE ON public.marketing_platform_configs
    FOR EACH ROW
    EXECUTE FUNCTION
        public.set_marketing_platform_configs_updated_at();

COMMIT;