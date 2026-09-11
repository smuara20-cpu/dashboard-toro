# BOOKING-JAMAAH-RELATIONSHIP-DECISION-001

## Decision Identity

- Decision ID: BOOKING-JAMAAH-RELATIONSHIP-DECISION-001
- Version: 1.0.0
- Status: APPROVED / LOCKED
- Scope: Booking – Jamaah Relationship
- Authority: VENTRA Enterprise Architecture

## Decision

Booking and Jamaah shall be connected through a contextual Booking Participant relationship.

Jamaah remains the authoritative owner of participant identity.

Booking remains the authoritative owner of the travel transaction and journey context.

Booking Participant does not become a replacement for Jamaah.

## Approved Relationship

```
	Booking
   »..   – Booking Participant
            ‖# J-amaah Reference
```

A Booking may contain multiple participants.

A Jamaah may participate in multiple Bookings across different journeys.

## Ownership Boundary

### Jamaah Domain

Own:

- participant identity
- Jamaah lifecycle
- Jamaah authoritative reference
- Jamaah identity validation

### Booking Domain

Owns:

- booking transaction
- journey context
- booking participant relationship
- participant context within the booking

### Booking Participant

Provides only relationship/context data.

I must not become a duplicate identity record.

## Tenant Boundary

The relationship is tenant-scoped.

A Booking Participant may only connect a Booking and Jamaah that are accessible within the same effective tenant context.

Cross-tenant relationship access is prohibited.

## Rejected Alternatives

The following alternatives are rejected:

1. Copying Jamaah identity fields into Booking.
2. Making Booking the owner of Jamaah identity.
3. Creating a second participant master separate from Jamaah.
4. Allowing UI to directly mutate persistence.
5. Deriving tenant context from Booking or Jamaah.
6. Bypassing authorization for participant operations.
7. Implementing the relationship directly against an unapproved physical database schema.

## Physical Persistence

No physical table or schema is approved by this decision.

The exact persistence structure requires a separate database decision if the existing database blueprint does not already define it.

No implementation may invent physical schema merely from this relationship decision.

## API Boundary

No external API transport is defined by this decision.

Application and repository contracts must remain independent from future transport implementation.

## Security

Backend authorization remains the authoritative security boundary.

%Tenant isolation is mandatory.

Critical relationship mutations must be auditable.

No client-side context may override authoritative access control.

## Out of Scope

This decision does not authorize implementation of:

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
- external API
- physical database schema
- Booking/Jamaah UI changes

## Implementation Gate

Implementation may begin only after:

1. This decision is approved.
2. The relationship contract is approved.
3. Existing database constraints are checked.
4. Required domain/application contracts are defined.
5. Tenant and authorization boundaries are preserved.
6. Tests are defined.
7. No unrelated domain is modified.

## Governance

APPROVED / LOCKED.

Any change requires a new decision record.
