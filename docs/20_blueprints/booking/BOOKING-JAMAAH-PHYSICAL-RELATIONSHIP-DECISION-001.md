# BOOKING-JAMAAH PHYSICAL RELATIONSHIP DECISION

Decision ID : BOOKING-JAMAAH-PHYSICAL-RELATIONSHIP-DECISION-001
Version     : 1.0.0
Status      : APPROVED / LOCKED
Authority   : Booking Business Rules + Jamaah ERD + Booking ERD + Domain Model + Existing DB Blueprint

## 1. Decision

The conceptual and business relationship between Jamaah and Booking is APPROVED and CONFIRMED.
The exact physical database mapping is NOT YET DEFINED by the existing database blueprint.
Physical implementation is therefore HOLD until an explicit physical schema decision is available.

## 2. Confirmed Facts

- Jamaah ERD defines Jamaah as having many Booking.
- Booking business rules require every Booking to have at least one Jamaah.
- Booking ERD defines Booking as having many Passenger.
- Domain Model defines Jamaah under Customer Domain.
- Domain Model defines Passenger under Booking Domain.
- Entity List contains Booking Passenger.
- Master Table List contains booking_passenger.

## 3. Physical Mapping Status

The following physical details are currently UNRESOLVED:

- booking_passenger foreign key to Jamaah.
- jamaah_id existence or naming.
- passenger_id existence or naming.
- Exact physical FK target.
- Physical uniqueness constraints.
- Physical enforcement of Booking minimum one Jamaah.

## 3. Physical Mapping Status

The following physical details are currently UNRESOLVED:

- booking_passenger foreign key to Jamaah.
- jamaah_id existence or naming.
- passenger_id existence or naming.
- Exact physical FK target.
- Physical uniqueness constraints.
- Physical enforcement of Booking minimum one Jamaah.

## 4. Explicit Non-Decisions

- No jamaah_id is introduced by this decision.
- No passenger_id is introduced by this decision.
- booking_passenger is not declared to be the Jamaah relationship table by this decision.
- Passenger is not declared identical to Jamaah by this decision.
- No booking_participant table is created.
- No existing table is modified.

## 5. Domain Ownership

- Jamaah remains authoritative for participant identity.
- Booking remains authoritative for transaction and journey context.
- Passenger remains a Booking-domain concept.
- Any future physical mapping must preserve these ownership boundaries.

## 6. Tenant and Security

- Jamaah ? Booking relationships are tenant-scoped.
- Cross-tenant relationships are prohibited.
- Backend/data-access enforcement remains the security boundary.
- Client/UI context is not the security boundary.

## 7. Implementation Gate

Physical implementation MUST remain HOLD.
No repository, entity, model, mapper, datasource, use case, controller, provider, UI, or database migration may be implemented from this decision alone.

Implementation requires a subsequent approved physical schema decision that explicitly defines the mapping.

## 8. Governance

Status: APPROVED / LOCKED

This decision records the current physical-definition gap and prevents silent schema invention.
Any future physical mapping requires an explicit versioned decision.
