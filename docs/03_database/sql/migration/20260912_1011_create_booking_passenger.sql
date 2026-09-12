-- ============================================================
-- VENTRA DATABASE MIGRATION
-- Migration : 20260912_1011_create_booking_passenger.sql
-- Domain    : Booking
-- Entity    : booking_passenger
-- Decision  : BOOKING-DB-PHYSICAL-DECISION-001
-- Status    : APPROVED
-- Database  : PostgreSQL / Supabase
-- ============================================================

BEGIN;

-- ============================================================
-- TABLE: booking_passenger
--
-- Purpose:
-- Physical relationship persistence between Booking and Jamaah.
--
-- Cardinality:
-- Booking 1 --- N booking_passenger N --- 1 Jamaah
--
-- Scope is intentionally limited to the approved DB-8 decision.
-- ============================================================

CREATE TABLE booking_passenger (
    id UUID NOT NULL,
    tenant_id UUID NOT NULL,
    booking_id UUID NOT NULL,
    jamaah_id UUID NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE NULL,

    CONSTRAINT pk_booking_passenger
        PRIMARY KEY (id),

    CONSTRAINT fk_booking_passenger_booking
        FOREIGN KEY (booking_id)
        REFERENCES booking (id),

    CONSTRAINT fk_booking_passenger_jamaah
        FOREIGN KEY (jamaah_id)
        REFERENCES jamaah (id)
);

-- ============================================================
-- INDEX: booking_id
-- Supports lookup of Jamaah passengers belonging to a Booking.
-- ============================================================

CREATE INDEX idx_booking_passenger_booking_id
    ON booking_passenger (booking_id);

-- ============================================================
-- INDEX: jamaah_id
-- Supports lookup of Bookings associated with a Jamaah.
-- ============================================================

CREATE INDEX idx_booking_passenger_jamaah_id
    ON booking_passenger (jamaah_id);

-- ============================================================
-- UNIQUE ACTIVE RELATIONSHIP
--
-- Prevents duplicate active Booking <-> Jamaah relationships.
--
-- Soft-deleted relationships are excluded and may be recreated.
-- ============================================================

CREATE UNIQUE INDEX uq_booking_passenger_booking_jamaah_active
    ON booking_passenger (booking_id, jamaah_id)
    WHERE deleted_at IS NULL;

COMMIT;

-- ============================================================
-- ROLLBACK PLAN
-- ============================================================
--
-- Rollback must be executed explicitly and only after confirming
-- dependency impact.
--
-- BEGIN;
--
-- DROP INDEX IF EXISTS uq_booking_passenger_booking_jamaah_active;
-- DROP INDEX IF EXISTS idx_booking_passenger_jamaah_id;
-- DROP INDEX IF EXISTS idx_booking_passenger_booking_id;
--
-- DROP TABLE IF EXISTS booking_passenger;
--
-- COMMIT;
--
-- ============================================================
-- END MIGRATION
-- ============================================================