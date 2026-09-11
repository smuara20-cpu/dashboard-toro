# BOOKING-JAMAAH-RELATIONSHIP-DECISION-002

## Decision Identity
- Decision ID: BOOKING-JAMAAH-RELATIONSHIP-DECISION-002
- Version: 1.0.0
- Status: APPROVED / LOCKED
- Scope: Booking ? Jamaah Relationship
- Authority: Booking Business Rules + Booking/Jamaah Relationship Contract

## Decision
1. A Booking MUST have at least one Jamaah.
2. A Booking without a Jamaah is business-invalid.
3. A Booking MAY have multiple Jamaah participants.
4. A Jamaah MAY participate in multiple Bookings across different journeys.
5. The minimum participant cardinality is 1 and the maximum is N.

## Domain Ownership
- Jamaah remains the authoritative owner of participant identity.
- Booking remains the authoritative owner of travel transaction and journey context.
- Booking Participant is a contextual relationship between Booking and Jamaah.
- Booking Participant does not replace or become the authoritative Jamaah identity.

## Tenant and Security Rules
- The Booking ? Jamaah relationship is tenant-scoped.
- Cross-tenant Booking ? Jamaah relationships are prohibited.
- Tenant isolation is enforced by the authoritative backend/data-access boundary.
- Client/UI state is not a security boundary.

## Implementation Boundary
- This decision does NOT approve a physical database schema.
- This decision does NOT define a concrete API transport.
- This decision does NOT change Payment, Invoice, Document, Ticket, Visa, Hotel, Notification, Location, AI, WhatsApp, Identity & Access, Router, or UI.
- Physical persistence requires a separate database decision and contract.

## Acceptance Criteria
- Booking creation or completion must not produce a business-valid Booking with zero Jamaah.
- Participant relationship must remain tenant-scoped.
- Jamaah identity remains owned by the Jamaah Domain.
- Booking journey/transaction context remains owned by the Booking Domain.
- Implementation may begin only after the relationship contract, physical DB contract/decision, domain/application contract, tenant/authorization contract, and tests are GREEN.

## Governance
- Decision status: APPROVED / LOCKED
- No silent schema invention is permitted.
- No implementation may bypass the approved Booking ? Jamaah relationship boundary.
- Any change to cardinality or ownership requires a new approved decision/version.
