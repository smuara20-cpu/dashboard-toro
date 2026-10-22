-- ============================================================
-- SP-203 SECURITY HARDENING 001
-- Status: DRAFT / REVIEW REQUIRED
-- Authority: SP203_SECURITY_HARDENING_DECISION_001
-- Environment: Supabase VENTRA-DEV
-- NOT EXECUTED
-- ============================================================

BEGIN;

-- Preflight: required runtime objects must exist.
DO $$
BEGIN
    IF to_regclass('public.companies') IS NULL
       OR to_regclass('public.tenants') IS NULL
       OR to_regclass('public.tenant_memberships') IS NULL THEN
        RAISE EXCEPTION
            'SP-203 hardening blocked: required runtime table missing';
    END IF;

    IF to_regprocedure('public.resolve_effective_tenant_access()') IS NULL THEN
        RAISE EXCEPTION
            'SP-203 hardening blocked: resolver function missing';
    END IF;
END
$$;

-- Enable RLS. FORCE RLS is intentionally not enabled.
ALTER TABLE public.companies ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.tenants ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.tenant_memberships ENABLE ROW LEVEL SECURITY;

-- Company SELECT policy.
DROP POLICY IF EXISTS sp203_company_select_member
    ON public.companies;

CREATE POLICY sp203_company_select_member
    ON public.companies
    FOR SELECT
    TO authenticated
    USING (
        EXISTS (
            SELECT 1
            FROM public.tenants t
            JOIN public.tenant_memberships tm
              ON tm.tenant_id = t.tenant_id
            WHERE t.company_id = companies.company_id
              AND tm.user_id = (SELECT auth.uid())
        )
    );

-- Tenant SELECT policy.
DROP POLICY IF EXISTS sp203_tenant_select_member
    ON public.tenants;

CREATE POLICY sp203_tenant_select_member
    ON public.tenants
    FOR SELECT
    TO authenticated
    USING (
        EXISTS (
            SELECT 1
            FROM public.tenant_memberships tm
            WHERE tm.tenant_id = tenants.tenant_id
              AND tm.user_id = (SELECT auth.uid())
        )
    );

-- Membership SELECT policy.
DROP POLICY IF EXISTS sp203_membership_select_own
    ON public.tenant_memberships;

CREATE POLICY sp203_membership_select_own
    ON public.tenant_memberships
    FOR SELECT
    TO authenticated
    USING (user_id = (SELECT auth.uid()));

-- Remove anon privileges on these tables.
REVOKE ALL PRIVILEGES ON TABLE
    public.companies,
    public.tenants,
    public.tenant_memberships
FROM anon;

-- Keep authenticated read-only for this runtime scope.
REVOKE INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER
ON TABLE
    public.companies,
    public.tenants,
    public.tenant_memberships
FROM authenticated;

-- Explicitly remove MAINTAIN detected by the effective privilege audit.
REVOKE MAINTAIN
ON TABLE
    public.companies,
    public.tenants,
    public.tenant_memberships
FROM authenticated;

-- Preserve the SELECT access needed by the approved runtime contract.
GRANT SELECT ON TABLE
    public.companies,
    public.tenants,
    public.tenant_memberships
TO authenticated;

-- Intentionally preserve resolver SECURITY INVOKER and EXECUTE grants.
-- Do not alter auth.users, membership cardinality, or tenant selection.
-- This migration does not change postgres or service_role privileges.

COMMIT;

-- ============================================================
-- ROLLBACK NOTES
-- This draft is not approved for execution.
-- Capture the exact initial policy definitions, RLS state, and ACLs
-- before applying the migration. The rollback file is a separate
-- draft and must be reviewed against that captured evidence.
-- ============================================================
