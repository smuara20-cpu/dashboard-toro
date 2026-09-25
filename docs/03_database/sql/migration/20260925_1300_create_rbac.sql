-- ============================================================
-- VENTRA RBAC MIGRATION
-- Migration : 20260925_1300_create_rbac.sql
-- Authority : RBAC_PHYSICAL_CONTRACT_DECISION_001
-- Cross-Company : RBAC_CROSS_COMPANY_INTEGRITY_DECISION_001
-- Trigger Design : RBAC_CROSS_COMPANY_TRIGGER_PHYSICAL_DESIGN_001
-- STATUS : DRAFT / REVIEW REQUIRED
-- ============================================================

BEGIN;

-- ============================================================
-- 0. PRE-FLIGHT DEPENDENCY VALIDATION
-- ============================================================

DO $$
BEGIN
    IF to_regclass('public.companies') IS NULL THEN
        RAISE EXCEPTION 'RBAC migration blocked: public.companies does not exist';
    END IF;

    IF to_regclass('public.users') IS NULL THEN
        RAISE EXCEPTION 'RBAC migration blocked: public.users does not exist';
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM pg_attribute
        WHERE attrelid = 'public.companies'::regclass
          AND attname = 'company_id'
          AND NOT attisdropped
    ) THEN
        RAISE EXCEPTION 'RBAC migration blocked: companies.company_id does not exist';
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM pg_attribute
        WHERE attrelid = 'public.users'::regclass
          AND attname = 'user_id'
          AND NOT attisdropped
    ) THEN
        RAISE EXCEPTION 'RBAC migration blocked: users.user_id does not exist';
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM pg_attribute
        WHERE attrelid = 'public.users'::regclass
          AND attname = 'company_id'
          AND NOT attisdropped
    ) THEN
        RAISE EXCEPTION 'RBAC migration blocked: users.company_id does not exist';
    END IF;
END
$$;

-- ============================================================
-- 1. ROLES
-- ============================================================

CREATE TABLE public.roles (
    id UUID NOT NULL DEFAULT gen_random_uuid(),
    company_id UUID NOT NULL,
    code VARCHAR(20) NOT NULL,
    name VARCHAR(150) NOT NULL,
    description TEXT NULL,
    approval_level SMALLINT NULL,
    is_system BOOLEAN NOT NULL DEFAULT FALSE,
    status SMALLINT NOT NULL DEFAULT 1,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NULL,
    updated_at TIMESTAMPTZ NULL,
    deleted_at TIMESTAMPTZ NULL,
    created_by UUID NULL,
    updated_by UUID NULL,
    deleted_by UUID NULL,
    CONSTRAINT pk_roles PRIMARY KEY (id),
    CONSTRAINT fk_roles_company
        FOREIGN KEY (company_id)
        REFERENCES public.companies(company_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
);

-- ============================================================
-- 2. PERMISSIONS
-- ============================================================

CREATE TABLE public.permissions (
    id UUID NOT NULL DEFAULT gen_random_uuid(),
    company_id UUID NOT NULL,
    code VARCHAR(100) NOT NULL,
    resource VARCHAR(100) NOT NULL,
    action VARCHAR(50) NOT NULL,
    module VARCHAR(100) NOT NULL,
    description TEXT NULL,
    is_system BOOLEAN NOT NULL DEFAULT FALSE,
    status SMALLINT NOT NULL DEFAULT 1,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NULL,
    updated_at TIMESTAMPTZ NULL,
    deleted_at TIMESTAMPTZ NULL,
    created_by UUID NULL,
    updated_by UUID NULL,
    deleted_by UUID NULL,
    CONSTRAINT pk_permissions PRIMARY KEY (id),
    CONSTRAINT fk_permissions_company
        FOREIGN KEY (company_id)
        REFERENCES public.companies(company_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
);

-- ============================================================
-- 3. USER ROLES
-- ============================================================

CREATE TABLE public.user_roles (
    id UUID NOT NULL DEFAULT gen_random_uuid(),
    company_id UUID NOT NULL,
    user_id UUID NOT NULL,
    role_id UUID NOT NULL,
    is_default BOOLEAN NOT NULL DEFAULT FALSE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NULL,
    updated_at TIMESTAMPTZ NULL,
    deleted_at TIMESTAMPTZ NULL,
    created_by UUID NULL,
    updated_by UUID NULL,
    deleted_by UUID NULL,
    CONSTRAINT pk_user_roles PRIMARY KEY (id),
    CONSTRAINT fk_user_roles_company
        FOREIGN KEY (company_id)
        REFERENCES public.companies(company_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT fk_user_roles_user
        FOREIGN KEY (user_id)
        REFERENCES public.users(user_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT fk_user_roles_role
        FOREIGN KEY (role_id)
        REFERENCES public.roles(id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
);

-- ============================================================
-- 4. ROLE PERMISSIONS
-- ============================================================

CREATE TABLE public.role_permissions (
    id UUID NOT NULL DEFAULT gen_random_uuid(),
    company_id UUID NOT NULL,
    role_id UUID NOT NULL,
    permission_id UUID NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NULL,
    updated_at TIMESTAMPTZ NULL,
    deleted_at TIMESTAMPTZ NULL,
    created_by UUID NULL,
    updated_by UUID NULL,
    deleted_by UUID NULL,
    CONSTRAINT pk_role_permissions PRIMARY KEY (id),
    CONSTRAINT fk_role_permissions_company
        FOREIGN KEY (company_id)
        REFERENCES public.companies(company_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT fk_role_permissions_role
        FOREIGN KEY (role_id)
        REFERENCES public.roles(id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT fk_role_permissions_permission
        FOREIGN KEY (permission_id)
        REFERENCES public.permissions(id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
);

-- ============================================================
-- 5. ACTIVE UNIQUE INDEXES
-- ============================================================

CREATE UNIQUE INDEX uq_roles_company_code_active
    ON public.roles (company_id, code)
    WHERE deleted_at IS NULL;

CREATE UNIQUE INDEX uq_permissions_company_code_active
    ON public.permissions (company_id, code)
    WHERE deleted_at IS NULL;

CREATE UNIQUE INDEX uq_user_roles_company_user_role_active
    ON public.user_roles (company_id, user_id, role_id)
    WHERE deleted_at IS NULL;

CREATE UNIQUE INDEX uq_role_permissions_company_role_permission_active
    ON public.role_permissions (company_id, role_id, permission_id)
    WHERE deleted_at IS NULL;

-- ============================================================
-- 6. CONTRACT INDEXES
-- ============================================================

CREATE INDEX idx_roles_company_id ON public.roles (company_id);
CREATE INDEX idx_roles_code ON public.roles (code);
CREATE INDEX idx_roles_name ON public.roles (name);
CREATE INDEX idx_roles_status ON public.roles (status);

CREATE INDEX idx_permissions_company_id ON public.permissions (company_id);
CREATE INDEX idx_permissions_code ON public.permissions (code);
CREATE INDEX idx_permissions_resource ON public.permissions (resource);
CREATE INDEX idx_permissions_module ON public.permissions (module);
CREATE INDEX idx_permissions_status ON public.permissions (status);

CREATE INDEX idx_user_roles_company_id ON public.user_roles (company_id);
CREATE INDEX idx_user_roles_user_id ON public.user_roles (user_id);
CREATE INDEX idx_user_roles_role_id ON public.user_roles (role_id);

CREATE INDEX idx_role_permissions_company_id ON public.role_permissions (company_id);
CREATE INDEX idx_role_permissions_role_id ON public.role_permissions (role_id);
CREATE INDEX idx_role_permissions_permission_id ON public.role_permissions (permission_id);

-- ============================================================
-- 7. CROSS-COMPANY FUNCTIONS
-- ============================================================

CREATE OR REPLACE FUNCTION public.fn_user_roles_validate_company_integrity()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF TG_TABLE_NAME = 'user_roles' AND NEW.deleted_at IS NULL THEN
        IF NOT EXISTS (
            SELECT 1 FROM public.users u
            WHERE u.user_id = NEW.user_id
              AND u.company_id = NEW.company_id
        ) THEN
            RAISE EXCEPTION 'RBAC company integrity violation: user_roles.user_id does not belong to company';
        END IF;

        IF NOT EXISTS (
            SELECT 1 FROM public.roles r
            WHERE r.id = NEW.role_id
              AND r.company_id = NEW.company_id
        ) THEN
            RAISE EXCEPTION 'RBAC company integrity violation: user_roles.role_id does not belong to company';
        END IF;
    END IF;

    IF TG_TABLE_NAME = 'users' THEN
        IF EXISTS (
            SELECT 1 FROM public.user_roles ur
            WHERE ur.user_id = NEW.user_id
              AND ur.deleted_at IS NULL
              AND ur.company_id <> NEW.company_id
        ) THEN
            RAISE EXCEPTION 'RBAC company integrity violation: user ownership change conflicts with active user_roles';
        END IF;
    END IF;

    IF TG_TABLE_NAME = 'roles' THEN
        IF EXISTS (
            SELECT 1 FROM public.user_roles ur
            WHERE ur.role_id = NEW.id
              AND ur.deleted_at IS NULL
              AND ur.company_id <> NEW.company_id
        ) THEN
            RAISE EXCEPTION 'RBAC company integrity violation: role ownership change conflicts with active user_roles';
        END IF;

        IF EXISTS (
            SELECT 1 FROM public.role_permissions rp
            WHERE rp.role_id = NEW.id
              AND rp.deleted_at IS NULL
              AND rp.company_id <> NEW.company_id
        ) THEN
            RAISE EXCEPTION 'RBAC company integrity violation: role ownership change conflicts with active role_permissions';
        END IF;
    END IF;

    RETURN NEW;
END;
$$;

CREATE OR REPLACE FUNCTION public.fn_role_permissions_validate_company_integrity()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF TG_TABLE_NAME = 'role_permissions' AND NEW.deleted_at IS NULL THEN
        IF NOT EXISTS (
            SELECT 1 FROM public.roles r
            WHERE r.id = NEW.role_id
              AND r.company_id = NEW.company_id
        ) THEN
            RAISE EXCEPTION 'RBAC company integrity violation: role_permissions.role_id does not belong to company';
        END IF;

        IF NOT EXISTS (
            SELECT 1 FROM public.permissions p
            WHERE p.id = NEW.permission_id
              AND p.company_id = NEW.company_id
        ) THEN
            RAISE EXCEPTION 'RBAC company integrity violation: permission does not belong to company';
        END IF;
    END IF;

    IF TG_TABLE_NAME = 'permissions' THEN
        IF EXISTS (
            SELECT 1 FROM public.role_permissions rp
            WHERE rp.permission_id = NEW.id
              AND rp.deleted_at IS NULL
              AND rp.company_id <> NEW.company_id
        ) THEN
            RAISE EXCEPTION 'RBAC company integrity violation: permission ownership change conflicts with active role_permissions';
        END IF;
    END IF;

    RETURN NEW;
END;
$$;

-- ============================================================
-- 8. CONSTRAINT TRIGGERS
-- ============================================================

CREATE CONSTRAINT TRIGGER tr_user_roles_company_integrity
AFTER INSERT OR UPDATE OF company_id, user_id, role_id, deleted_at
ON public.user_roles
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION public.fn_user_roles_validate_company_integrity();

CREATE CONSTRAINT TRIGGER tr_users_rbac_company_integrity
AFTER UPDATE OF company_id
ON public.users
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION public.fn_user_roles_validate_company_integrity();

CREATE CONSTRAINT TRIGGER tr_roles_user_roles_company_integrity
AFTER UPDATE OF company_id
ON public.roles
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION public.fn_user_roles_validate_company_integrity();

CREATE CONSTRAINT TRIGGER tr_roles_role_permissions_company_integrity
AFTER UPDATE OF company_id
ON public.roles
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION public.fn_role_permissions_validate_company_integrity();

CREATE CONSTRAINT TRIGGER tr_role_permissions_company_integrity
AFTER INSERT OR UPDATE OF company_id, role_id, permission_id, deleted_at
ON public.role_permissions
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION public.fn_role_permissions_validate_company_integrity();

CREATE CONSTRAINT TRIGGER tr_permissions_rbac_company_integrity
AFTER UPDATE OF company_id
ON public.permissions
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION public.fn_role_permissions_validate_company_integrity();

-- ============================================================
-- 9. BOUNDARY
-- ============================================================
-- No tenant_id
-- No tenant table
-- No RLS policy
-- No TenantContext provider
-- SP-203 remains authoritative for Effective Tenant Access.

COMMIT;

-- ============================================================
-- STATUS: DRAFT / REVIEW REQUIRED
-- NOT EXECUTED AGAINST SUPABASE
-- ============================================================
