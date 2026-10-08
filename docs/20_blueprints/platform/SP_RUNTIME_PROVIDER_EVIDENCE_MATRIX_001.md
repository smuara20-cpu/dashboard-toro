
# SP RUNTIME PROVIDER EVIDENCE MATRIX 001

**Document ID:** SP_RUNTIME_PROVIDER_EVIDENCE_MATRIX_001
**Version:** 1.0
**Domain:** Runtime Provider Evidence / Platform Integration / Governance
**Repository:** dashboard-toro
**Status:** APPROVED EVIDENCE MATRIX
**Implementation Status:** NOT IMPLEMENTED
**Provider Status:** UNVERIFIED

---

# 1. PURPOSE

Cross-platform evidence matrix untuk memverifikasi runtime provider VENTRA sebelum production adapter, transport implementation, provider SDK, atau runtime integration dibuat.

Dokumen ini dibuat setelah AMO-010, AMO-011, AMO-012, dan AMO-013.

# 2. PLATFORM NUMBERING

SP-203 = Identity & Access Platform
SP-204 = Security Platform
SP-205 = Audit Platform
SP-208 = Integration Platform

Evidence matrix ini menggunakan identifier tersendiri:
SP_RUNTIME_PROVIDER_EVIDENCE_MATRIX_001

# 3. GOVERNANCE

Evidence -> Verification -> Architecture Review -> Decision -> Implementation -> Validation -> Approval -> Commit / Push

No Guessing:
Provider, Endpoint, Authentication, Tenant Binding, API Contract, Webhook, AI Runtime, Booking Source, Payment Source.

Jika evidence belum tersedia: UNVERIFIED -> HOLD.

# 4. AUTH / SESSION

Existing evidence: Auth Session, Session Establishment, Session State, Tenant Context, Tenant Context Source, Auth Remote Data Source, Auth Repository, Auth Session Service.

Existing paths:
lib/features/auth/application/services/auth_session_service.dart
lib/features/auth/data/datasource/auth_remote_datasource.dart
lib/features/auth/data/repository/auth_repository_impl.dart
lib/features/auth/domain/entities/tenant_context.dart
lib/features/auth/domain/repository/auth_repository.dart
lib/features/auth/domain/repository/tenant_context_source.dart

AUTH / SESSION ARCHITECTURE = EVIDENCED
PRODUCTION PROVIDER = UNVERIFIED

# 5. TENANT CONTEXT

Existing evidence: TenantContext, TenantContextSource, Effective Tenant Access, tenantId, companyId.

LOGICAL TENANT CONTEXT = EVIDENCED
TENANT SOURCE = EVIDENCED
AUTHORITATIVE PROVIDER = UNVERIFIED
PROVIDER TENANT BINDING = HOLD

Tidak boleh diasumsikan: auth.uid() = tenant_id, auth.uid() = company_id, user_metadata.role = authoritative role, client-selected tenant_id = authority, client-selected company_id = authority, JWT claim = authoritative tenant binding.

# 6. SUPABASE

Existing evidence menunjukkan penggunaan supabase_flutter / Supabase.

SUPABASE APPLICATION DEPENDENCY = EVIDENCED
SUPABASE AS SP-203 AUTHORITY = UNVERIFIED

Dependency presence tidak otomatis membuktikan provider authority.

# 7. BOOKING DOMAIN

Existing evidence: Booking Controller, Booking Dashboard Controller, Booking Entities, Booking Mappers, Booking Presentation Pages, Create Booking Page, Booking Page, Booking Detail Page.

Existing paths:
lib/features/booking/application/controllers/booking_controller.dart
lib/features/booking/application/controllers/dashboard_controller.dart
lib/features/booking/presentation/pages/create_booking_page.dart
lib/features/booking/presentation/pages/booking_page.dart
lib/features/booking/presentation/pages/booking_detail_page.dart

BOOKING DOMAIN = EVIDENCED
BOOKING UI = EVIDENCED
BOOKING PROVIDER = UNVERIFIED
BOOKING API = UNVERIFIED

# 8. BOOKING PROVIDER

Required: official provider, ownership, official service, production endpoint, HTTP method, authentication, request, response, error, timeout, retry, environment/base URL, tenant binding, version.

BOOKING PROVIDER = UNVERIFIED
BOOKING API = UNVERIFIED
BOOKING ADAPTER = HOLD

# 9. BOOKING AVAILABILITY

Required authoritative source: Availability, Seat, Room, Departure, Package, Inventory, Capacity.

AUTHORITATIVE AVAILABILITY SOURCE = UNVERIFIED
INVENTORY AUTHORITY = UNVERIFIED

AI tidak boleh mengarang availability, seat count, room count, departure availability, atau inventory.

# 10. BOOKING PAYMENT

Required: payment provider, payment status authority, payment reference, payment confirmation, payment webhook/event, refund authority, payment error contract.

PAYMENT PROVIDER = UNVERIFIED
PAYMENT AUTHORITY = UNVERIFIED
PAYMENT CONFIRMATION = UNVERIFIED
PAYMENT WEBHOOK = UNVERIFIED
PAYMENT ADAPTER = HOLD

Customer statement bukan otomatis payment confirmation.

# 11. WHATSAPP PROVIDER

Required: official/authorized provider, official API, authentication, send message, receive webhook, message events, delivery status, conversation/session, contact identity, consent/opt-in, errors, retry, timeout, environment, tenant binding, version, ownership.

WHATSAPP PROVIDER = UNVERIFIED
WHATSAPP API = UNVERIFIED
WHATSAPP WEBHOOK = UNVERIFIED
WHATSAPP SEND = UNVERIFIED
WHATSAPP SESSION = UNVERIFIED
WHATSAPP ADAPTER = HOLD

# 12. WHATSAPP CONSENT

Required runtime evidence: consent authority, opt-in state, consent timestamp, consent scope, consent revocation, messaging eligibility.

CONSENT AUTHORITY = UNVERIFIED
OPT-IN RUNTIME = UNVERIFIED

# 13. AI RUNTIME PROVIDER

Required: Provider Abstraction, AI Runtime, Model Configuration, Policy Enforcement, Execution Boundary, Auditability.

AI RUNTIME PROVIDER = UNVERIFIED
AI PROVIDER ABSTRACTION = UNVERIFIED
AI PRODUCTION RUNTIME = UNVERIFIED

# 14. OPENAI

VENTRA architecture menetapkan OpenAI sebagai primary AI engine dengan provider abstraction mandatory.

Architecture approval bukan bukti production adapter.

OPENAI ARCHITECTURAL ROLE = DEFINED
OPENAI PRODUCTION ADAPTER = UNVERIFIED
OPENAI RUNTIME = UNVERIFIED

Tidak boleh hard-code OpenAI SDK ke business logic sebelum provider integration contract disetujui.

# 15. AI PROVIDER ABSTRACTION

Business Logic -> AI Provider Abstraction -> Provider Adapter -> Concrete AI Provider

Business Logic -> OpenAI SDK secara langsung = PROHIBITED

CONCRETE ADAPTER = UNVERIFIED

# 16. AI POLICY

AI recommendations wajib melewati Business Rules, Business Constraints, Governance Policies, Approval Policies, Security Policies, dan Tenant Boundary.

AI tidak boleh bebas menentukan Budget, Targeting, Booking, Payment, Revenue, CRM mutation, atau WhatsApp send.

AI POLICY RUNTIME = UNVERIFIED
IMPLEMENTATION = HOLD

# 17. AI EXECUTION / AUDIT

Required: AI execution ID, provider, model, tenant context, input boundary, output boundary, recommendation, policy result, human approval, error, timestamp, audit reference.

AI EXECUTION AUDIT CONTRACT = UNVERIFIED

# 18. TENANT BINDING

Setiap production provider harus membuktikan tenant identifier, tenant source, session binding, authorization binding, provider binding, RLS/security binding, audit binding.

APPLICATION TENANT CONTEXT = EVIDENCED
PROVIDER TENANT BINDING = UNVERIFIED
RLS BINDING = UNVERIFIED FOR NEW PROVIDERS

# 19. SECURITY

SP-204 tetap Security Platform.

Required provider evidence: Authentication, Authorization, Tenant isolation, Secret handling, Transport security, RLS/security binding, Auditability, Error handling.

SECURITY ARCHITECTURE = EXISTING
PROVIDER SECURITY CONTRACT = UNVERIFIED

# 20. ERROR / RETRY / TIMEOUT

Required: HTTP/API errors, Authentication errors, Authorization errors, Tenant errors, Validation errors, Rate limits, Timeouts, Transient failures, Permanent failures, Retryability, Idempotency.

BOOKING ERROR CONTRACT = UNVERIFIED
WHATSAPP ERROR CONTRACT = UNVERIFIED
AI ERROR CONTRACT = UNVERIFIED

# 21. OWNERSHIP

Required: Provider Owner, Integration Owner, Contract Owner, Security Owner, Operational Owner.

BOOKING PROVIDER OWNER = UNVERIFIED
WHATSAPP PROVIDER OWNER = UNVERIFIED
AI PROVIDER OWNER = UNVERIFIED

# 22. VERSION / COMPATIBILITY

Required: Provider version, API version, Contract version, SDK version, Compatibility policy, Deprecation policy, Breaking-change policy.

BOOKING = UNVERIFIED
WHATSAPP = UNVERIFIED
AI = UNVERIFIED

# 23. EVIDENCE MATRIX

| Capability | Existing Evidence | Provider Evidence | Status |
|---|---|---|---|
| Auth / Session | Yes | Not confirmed | EVIDENCED / HOLD |
| Tenant Context | Yes | Not confirmed | EVIDENCED / HOLD |
| Supabase | Yes | Authority not confirmed | PARTIAL |
| Booking Domain | Yes | Provider not confirmed | EVIDENCED / HOLD |
| Booking API | No authoritative contract | No | UNVERIFIED |
| Booking Availability | No authoritative source | No | UNVERIFIED |
| Booking Payment | No authoritative provider | No | UNVERIFIED |
| WhatsApp API | No authoritative provider | No | UNVERIFIED |
| WhatsApp Webhook | No authoritative contract | No | UNVERIFIED |
| WhatsApp Consent | Governance defined | Runtime not confirmed | PARTIAL |
| AI Provider Abstraction | Architecture defined | Runtime not confirmed | PARTIAL |
| OpenAI Adapter | Architecture role defined | Production not confirmed | PARTIAL |
| AI Runtime | No concrete evidence | No | UNVERIFIED |
| AI Policy Runtime | Governance defined | Runtime not confirmed | PARTIAL |
| AI Audit Runtime | Required | Runtime not confirmed | UNVERIFIED |
| Tenant Provider Binding | Logical architecture | Provider not confirmed | UNVERIFIED |
| Provider Security Binding | Architecture exists | Contract not confirmed | UNVERIFIED |

# 24. PROVIDER ACCEPTANCE GATE

[ ] Provider authority confirmed
[ ] Official service confirmed
[ ] Endpoint/service binding confirmed
[ ] Transport confirmed
[ ] Authentication confirmed
[ ] Authorization confirmed
[ ] Tenant binding confirmed
[ ] Request contract confirmed
[ ] Response contract confirmed
[ ] Error contract confirmed
[ ] Timeout confirmed
[ ] Retry confirmed
[ ] Idempotency confirmed where applicable
[ ] Version confirmed
[ ] Ownership confirmed
[ ] Security binding confirmed
[ ] Auditability confirmed
[ ] Environment configuration confirmed

# 25. IMPLEMENTATION GATE

BOOKING ADAPTER = HOLD
WHATSAPP ADAPTER = HOLD
AI PROVIDER ADAPTER = HOLD
OPENAI RUNTIME = HOLD
PAYMENT ADAPTER = HOLD

Dokumen ini tidak mengotorisasi production implementation.

# 26. PROHIBITED ASSUMPTIONS

Supabase Auth = SP-203 authority
auth.uid() = tenant_id
auth.uid() = company_id
user_metadata.role = authoritative role
client-selected tenant_id = authoritative tenant
client-selected company_id = authoritative company
JWT claim = authoritative tenant binding
generic REST endpoint = official provider
Supabase RPC = provider contract
Supabase Edge Function = provider contract
test fake = production provider
mock = production provider
architecture document = runtime implementation
dependency presence = provider integration
AI recommendation = transaction
customer statement = payment confirmation
conversation intent = booking confirmation

# 27. NO-GUESSING

VENTRA tidak boleh mengarang Endpoint, HTTP method, API field, Authentication header, Token source, Tenant ID source, Provider ID, Booking ID, Payment status, Availability, Price, Seat, Room, Webhook event, AI model, Provider configuration.

Jika evidence tidak ada: UNKNOWN
Jika implementation bergantung kepadanya: HOLD

# 28. NEXT EVIDENCE COLLECTION

BOOKING: provider, endpoint, authentication, request/response, availability, payment boundary, tenant binding.
WHATSAPP: provider, official API, webhook, send/receive, session, delivery status, consent, tenant binding.
AI: provider abstraction, runtime, model configuration, OpenAI adapter, policy enforcement, execution/audit, error/retry, tenant binding.
SECURITY: authentication, authorization, RLS/security binding, secret/configuration handling.

# 29. DECISION

Existing Auth/Session Architecture = GREEN
Existing Tenant Context = GREEN
Existing Booking Domain = GREEN
Supabase Dependency Evidence = GREEN

Concrete Booking Provider = HOLD
Concrete WhatsApp Provider = HOLD
Concrete AI Runtime Provider = HOLD
Concrete OpenAI Adapter = HOLD
Concrete Payment Provider = HOLD
Provider Tenant Binding = HOLD
Provider Security Contract = HOLD

DECISION = EVIDENCE COLLECTION CONTINUES

# 30. FINAL STATUS

DOCUMENT ID = SP_RUNTIME_PROVIDER_EVIDENCE_MATRIX_001
STATUS = APPROVED EVIDENCE MATRIX
IMPLEMENTATION = NOT IMPLEMENTED
BOOKING PROVIDER = UNVERIFIED / HOLD
WHATSAPP PROVIDER = UNVERIFIED / HOLD
AI RUNTIME PROVIDER = UNVERIFIED / HOLD
OPENAI PRODUCTION ADAPTER = UNVERIFIED / HOLD
PAYMENT PROVIDER = UNVERIFIED / HOLD
TENANT PROVIDER BINDING = UNVERIFIED / HOLD
SECURITY PROVIDER CONTRACT = UNVERIFIED / HOLD
NEXT STEP = AUTHORITATIVE PROVIDER EVIDENCE COLLECTION
NO-GUESSING = ENFORCED
MULTI-TENANT = REQUIRED
AUDITABILITY = REQUIRED
SP-204 = REMAINS SECURITY PLATFORM

# 31. APPROVAL

VENTRA GOVERNANCE
Artifact = SP_RUNTIME_PROVIDER_EVIDENCE_MATRIX_001
Decision = APPROVED FOR EVIDENCE PHASE
Implementation = NOT AUTHORIZED BY THIS ARTIFACT
Provider Assumption = PROHIBITED
Tenant Authority Assumption = PROHIBITED
Production Adapter = HOLD UNTIL CONTRACT EVIDENCE IS VERIFIED

END OF SP_RUNTIME_PROVIDER_EVIDENCE_MATRIX_001
