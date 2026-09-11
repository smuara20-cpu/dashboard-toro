# BOOKING-JAMAAH-RELATIONSHIP-CONTRACT-001

## Document Identity

- Contract ID: BOOKING-JAMAAH-RELATIONSHIP-CONTRACT-001
- Version: 1.0.0
- Status: APPROVED / LOCKED
- Scope: Booking ↔ Jamaah Relationship
- Owner: Booking Domain / Jamaah Domain according to ownership boundaries
- Authority: VENTRA Enterprise Architecture and approved Jamaah contracts

## Purpose

This contract defines the authoritative relationship between a Booking and a Jamaah without transferring identity ownership from the Jamaah Domain to the Booking Domain.

## Ownership

Jamaah is the authoritative owner of participant identity.

Booking is the authoritative owner of the travel transaction and journey context.

Booking Participant is a contextual relationship between Booking and Jamaah.

Booking Participant must not replace Jamaah as the authoritative participant identity.

## Relationship

A Booking may have multiple Booking Participants.

A Jamaah may participate in multiple Bookings across different journeys.

The relationship is tenant-scoped.

## Minimum Relationship Contract

A Booking Participant conceptually contains:

- participantId
- tenantContext
- bookingReference
- jamaahReference
- status
- lifecycle
- audit

Exact physical field names and persistence schema remain subject to the approved database contract.

## Identity Boundary

Booking Participant must reference Jamaah.

Booking Participant must not duplicate authoritative Jamaah identity attributes.

The following are explicitly outside the participant contract:

- full name
- national identity number
- passport data
- phone
- email
- address
- medical data
- payment data
- document data
- ticket data
- visa data
- hotel data

## Tenant Isolation

Every relationship operation must remain inside the effective tenant context.

Cross-tenant Booking ↔ Jamaah relationship access is prohibited.

Client-side tenant context is not the security boundary. Authoritative backend authorization remains the security boundary.

## Relationship Operations

The relationship contract supports:

- create relationship
- retrieve relationship
- retrieve participants by booking
- retrieve bookings by Jamaah
- update relationship state where authorized
- remove relationship where authorized

Every mutation must respect authorization and audit requirements.

## Integrity Rules

A Booking Participant must reference an existing authoritative Booking.

A Booking Participant must reference an existing authoritative Jamaah.

A relationship must not silently create a Jamaah.

A relationship must not silently duplicate a Jamaah.

A deleted or inaccessible Jamaah must not become accessible through a Booking Participant.

## Out of Scope

This contract does not define:

- Payment
- Invoice
- Document
- Ticket
- Visa
- Hotel
- Notification
- Location
- AI
- WhatsApp
- Identity & Access transport
- physical database implementation
- external API transport

## Security

No cross-tenant access.

No authorization bypass.

No direct UI-to-database relationship mutation.

No identity duplication as a security shortcut.

All critical mutations must remain auditable.

## Acceptance Criteria

The implementation is acceptable when:

1. A Booking can reference one or more Jamaah through Booking Participant.
2. A Jamaah can participate in multiple Bookings.
3. Jamaah remains the authoritative identity owner.
4. Booking remains the authoritative transaction owner.
5. Participant does not duplicate Jamaah identity.
6. Tenant isolation is enforced.
7. Relationship retrieval works by Booking.
8. Relationship retrieval works by Jamaah.
9. Authorized mutations are auditable.
10. Payment, Document, Ticket, Visa, Hotel and Notification remain outside this slice.
11. Identity & Access transport blocker remains unchanged.
12. Tests, analyze, regression and diff checks are GREEN.

## Governance

APPROVED / LOCKED.

Changes require a new decision record.
