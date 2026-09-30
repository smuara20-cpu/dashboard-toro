-- ============================================================
-- SP-203 Runtime Provider Implementation 001
-- Operation: Resolve Effective Tenant Access
-- Environment: Supabase VENTRA-DEV
-- ============================================================

BEGIN;

CREATE OR REPLACE FUNCTION public.resolve_effective_tenant_access()
RETURNS TABLE (
    user_id UUID,
    tenant_id UUID,
    company_id UUID
)
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = public, auth
AS $function$
DECLARE
    v_user_id UUID;
    v_membership_count INTEGER;
BEGIN
    -- --------------------------------------------------------
    -- 1. Resolve authenticated identity from Supabase context
    -- --------------------------------------------------------
    v_user_id := auth.uid();

    IF v_user_id IS NULL THEN
        RAISE EXCEPTION 'UNAUTHENTICATED'
            USING ERRCODE = 'P0001';
    END IF;

    -- --------------------------------------------------------
    -- 2. Count valid tenant memberships
    -- --------------------------------------------------------
    SELECT COUNT(*)
    INTO v_membership_count
    FROM public.tenant_memberships tm
    INNER JOIN public.tenants t
        ON t.tenant_id = tm.tenant_id
    INNER JOIN public.companies c
        ON c.company_id = t.company_id
    WHERE tm.user_id = v_user_id;

    -- --------------------------------------------------------
    -- 3. No membership
    -- --------------------------------------------------------
    IF v_membership_count = 0 THEN
        RAISE EXCEPTION 'TENANT_ACCESS_NOT_FOUND'
            USING ERRCODE = 'P0001';
    END IF;

    -- --------------------------------------------------------
    -- 4. Multiple memberships
    --    Never select arbitrarily.
    -- --------------------------------------------------------
    IF v_membership_count > 1 THEN
        RAISE EXCEPTION 'INVALID_ACCESS_CONTEXT'
            USING ERRCODE = 'P0001';
    END IF;

    -- --------------------------------------------------------
    -- 5. Exactly one effective membership
    -- --------------------------------------------------------
    RETURN QUERY
    SELECT
        tm.user_id,
        tm.tenant_id,
        t.company_id
    FROM public.tenant_memberships tm
    INNER JOIN public.tenants t
        ON t.tenant_id = tm.tenant_id
    INNER JOIN public.companies c
        ON c.company_id = t.company_id
    WHERE tm.user_id = v_user_id;

END;
$function$;

-- Remove inherited/default execute access.
REVOKE ALL
ON FUNCTION public.resolve_effective_tenant_access()
FROM PUBLIC;

-- Authenticated Supabase sessions may invoke the provider.
GRANT EXECUTE
ON FUNCTION public.resolve_effective_tenant_access()
TO authenticated;

COMMIT;