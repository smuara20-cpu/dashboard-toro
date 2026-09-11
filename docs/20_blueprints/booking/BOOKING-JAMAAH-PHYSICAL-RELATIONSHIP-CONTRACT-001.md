# BOOKING-JAMAAH PHYSICAL RELATIONSHIP CONTRACT

Contract ID : BOOKING-JAMAAH-PHYSICAL-RELATIONSHIP-CONTRACT-001
Version     : 1.0.0
Status      : APPROVED / LOCKED
Authority   : Booking Business Rules + Jamaah ERD + Booking ERD + Domain Model + Existing DB Blueprint

## 1. Purpose

This contract defines the governed boundary for the physical persistence relationship between Jamaah and Booking.
The conceptual relationship is already established, while the exact physical mapping remains subject to a separate DB decision.

## 2. Scope

- Jamaah ? Booking physical relationship boundary.
- Existing booking_passenger physical table as an existing DB blueprint artifact.
- Tenant-scoped relationship requirements.
- Constraints required before implementation.

## 3. Existing SSOT Facts

- Jamaah ERD defines Jamaah as having many Booking.
- Booking business rules require every Booking to have at least one Jamaah.
- Booking ERD defines Booking as having many Passenger.
- Domain Model defines Jamaah under Customer Domain and Passenger under Booking Domain.
- Entity List contains Booking Passenger.
- Master Table List contains booking_passenger.
- Current DB blueprint does not define jamaah_id or passenger_id mapping for booking_passenger.

## 4. Relationship Boundary

Conceptual relationship:

Jamaah 1 : N Booking

Business cardinality:

- Booking minimum Jamaah participation = 1.
- Booking maximum Jamaah participation = N.
- Jamaah may participate in multiple Bookings.

## 5. Domain Ownership

- Jamaah remains the authoritative owner of participant identity.
- Booking remains the authoritative owner of transaction and journey context.
- Passenger remains a Booking-domain concept.
- Passenger MUST NOT be assumed to be identical to Jamaah without explicit approved evidence.

## 6. Physical Mapping Rule

- The existence of booking_passenger is acknowledged as an existing DB blueprint artifact.
- This contract does not declare booking_passenger as the final Jamaah relationship table.
- This contract does not introduce jamaah_id.
- This contract does not introduce passenger_id.
- This contract does not create booking_participant.
- Exact physical FK/cardinality/storage mapping requires a separate approved DB decision.

## 7. Tenant and Security

- Relationship data is tenant-scoped.
- Cross-tenant Jamaah ? Booking relationships are prohibited.
- Backend/data-access enforcement remains the security boundary.
- Client/UI context is not a security boundary.

## 8. Implementation Gate

Implementation MUST NOT begin until the physical relationship DB decision is approved.

Required before code:

1. Approved physical relationship DB decision.
2. Defined FK and cardinality behavior.
3. Tenant isolation constraints.
4. Domain relationship contract.
5. Application/use-case contract.
6. Acceptance and regression tests.

## 9. Governance

Status: APPROVED / LOCKED

No silent physical schema invention is permitted.
Any change to this contract requires an explicit versioned decision.
