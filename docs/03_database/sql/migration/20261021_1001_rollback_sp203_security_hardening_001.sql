-- ============================================================
-- SP-203 SECURITY HARDENING 001
-- ROLLBACK: DRAFT / REVIEW REQUIRED
-- Environment: Supabase VENTRA-DEV
-- NOT EXECUTED
-- ============================================================
--
-- IMPORTANT:
-- Execute only after explicit rollback approval and comparison
-- with the exact pre-migration database evidence.
--
-- This script restores the previously observed SELECT policies
-- and authenticated SELECT/MAINTAIN table privileges.
-- It does not disable RLS or modify resolver privileges.
--
-- If any initial policy, ACL, or RLS state differs from the
-- captured evidence, STOP and revise this script before use.
-- ============================================================

BEGIN;

-- Restore the previously observed company policy.
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
              AND tm.user_id = auth.uid()
        )
    );

-- Restore the previously observed tenant policy.
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
              AND tm.user_id = auth.uid()
        )
    );

-- Restore the previously observed membership policy.
DROP POLICY IF EXISTS sp203_membership_select_own
    ON public.tenant_memberships;

CREATE POLICY sp203_membership_select_own
    ON public.tenant_memberships
    FOR SELECT
    TO authenticated
    USING (user_id = auth.uid());

-- Restore observed authenticated table privileges.
GRANT SELECT, MAINTAIN
ON TABLE
    public.companies,
    public.tenants,
    public.tenant_memberships
TO authenticated;

-- RLS was already enabled before the forward migration.
-- Do not disable RLS.
-- Do not alter resolver SECURITY INVOKER or EXECUTE grants.
-- Do not change postgres or service_role privileges.

COMMIT;
