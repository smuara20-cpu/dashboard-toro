# AMO-012 — VENTRA CRM → WHATSAPP INTELLIGENCE & CONVERSATION CONTRACT

**Version:** 1.0
**Domain:** AI / Marketing Intelligence / CRM / WhatsApp / Conversation Intelligence
**Status:** APPROVED CONTRACT
**Implementation:** NOT IMPLEMENTED
**DB Implementation:** NONE
**CRM Implementation:** NONE
**WhatsApp API Implementation:** NONE
**AI Runtime Implementation:** NONE
**Booking Implementation:** NONE

---

# 1. PURPOSE

AMO-012 mendefinisikan kontrak CRM → WhatsApp Intelligence & Conversation sebagai layer penghubung antara CRM Intelligence dengan customer conversation.

Layer ini berada setelah:

- Lead Intelligence
- Marketing Attribution
- AI Lead Qualification
- CRM Intelligence

dan sebelum:

- Booking
- Revenue

AMO-012 mendefinisikan bagaimana conversation context dapat digunakan untuk intelligence, qualification, recommendation, human handoff, dan downstream workflow.

AMO-012 bukan implementasi WhatsApp API.

AMO-012 bukan implementasi CRM.

AMO-012 bukan implementasi autonomous WhatsApp agent.

---

# 2. STRATEGIC FLOW

VENTRA Marketing Intelligence:

SEO
SEM
Social
Website
        ↓
Lead Intelligence
        ↓
Marketing Attribution
        ↓
AI Lead Qualification
        ↓
CRM Intelligence
        ↓
CRM → WhatsApp Intelligence
        ↓
Conversation Intelligence
        ↓
Human / AI Assistance
        ↓
Booking
        ↓
Revenue

---

# 3. SCOPE

AMO-012 mencakup:

- CRM → WhatsApp handoff
- WhatsApp conversation intelligence
- Conversation context
- Conversation history boundary
- Conversation summary
- Conversation intent
- Conversation qualification signals
- Conversation sentiment boundary
- Conversation topic
- Conversation priority
- Next-best-question
- Recommended response
- Follow-up intelligence
- Human handoff
- AI assistance
- WhatsApp session/context
- Consent boundary
- Opt-in boundary
- Message authority
- Booking handoff boundary
- Conversation auditability
- Tenant isolation
- Privacy
- AI governance
- No-Guessing Rule
- Implementation Gate

---

# 4. OUT OF SCOPE

AMO-012 tidak mengimplementasikan:

- WhatsApp Cloud API
- WhatsApp Business API
- WhatsApp provider SDK
- WhatsApp database
- CRM database
- CRM API
- message transport engine
- message delivery engine
- autonomous outreach engine
- autonomous campaign messaging
- automatic booking
- automatic payment
- revenue modification
- AI provider runtime
- model SDK
- identity resolution engine
- tracking pixel
- cookie engine

---

# 5. SOURCE OF TRUTH

Authority order:

1. Official CRM source
2. Official WhatsApp source
3. Authorized integration
4. VENTRA normalized conversation data
5. AI conversation intelligence
6. AI recommendation

AI interpretation tidak menggantikan source state.

WhatsApp delivery state tetap berasal dari WhatsApp/provider source apabila tersedia.

CRM lifecycle state tetap berasal dari CRM source.

Booking state tetap berasal dari booking source.

Revenue tetap berasal dari financial source.

---

# 6. CRM → WHATSAPP HANDOFF

CRM dapat menjadi upstream source untuk conversation context apabila integration resmi tersedia.

Handoff dapat membawa logical context seperti:

- lead reference
- customer reference
- CRM lifecycle
- lead qualification
- lead priority
- source
- attribution
- product interest
- conversation context

Handoff hanya valid apabila relationship tersebut telah diverifikasi.

---

# 7. WHATSAPP CONVERSATION

Conversation merupakan kumpulan interaction antara customer/lead dan WhatsApp business channel.

Conversation dapat berisi:

- inbound message
- outbound message
- timestamp
- sender role
- recipient role
- message type
- delivery state
- conversation reference

Detail actual field bergantung pada official provider contract.

AMO-012 tidak mengasumsikan schema provider.

---

# 8. MESSAGE AUTHORITY

Message source harus dapat dibedakan.

Logical source:

- CUSTOMER
- HUMAN_AGENT
- AI_ASSISTANT
- SYSTEM
- UNKNOWN

UNKNOWN tidak boleh diperlakukan sebagai known sender.

---

# 9. CONVERSATION CONTEXT

Conversation context dapat digunakan untuk memahami:

- current topic
- customer intent
- requested information
- unresolved question
- qualification signal
- objection
- urgency
- next action recommendation

Context harus berasal dari conversation evidence.

---

# 10. CONVERSATION SUMMARY

AI dapat menghasilkan summary seperti:

- conversation summary
- customer request
- unresolved issue
- qualification signals
- product interest
- next recommended action

Summary merupakan derived intelligence.

Summary bukan source of truth.

---

# 11. CONVERSATION INTENT

Conversation intent dapat memiliki logical state:

- UNKNOWN
- INFORMATIONAL
- PRODUCT_INQUIRY
- PRICE_INQUIRY
- AVAILABILITY_INQUIRY
- COMPARISON
- OBJECTION
- PURCHASE_INTENT
- BOOKING_INTENT
- SUPPORT
- OTHER

Classification harus berdasarkan conversation evidence.

---

# 12. QUALIFICATION SIGNAL

Conversation dapat menghasilkan qualification signal untuk AMO-011.

Contoh:

- destination interest
- package interest
- travel timing
- group size
- budget statement
- preferred departure
- customer requirement
- objection
- urgency
- booking question

Signal harus dibedakan antara:

`STATED`

dan

`INFERRED`

AI tidak boleh mengubah inferred signal menjadi stated fact.

---

# 13. STATED VS INFERRED

Contoh:

Customer berkata:

"Saya ingin berangkat bulan Desember."

Maka:

`travel_timing = STATED`

Jika AI menyimpulkan:

"Customer kemungkinan siap booking."

Maka:

`booking_readiness = INFERRED`

Keduanya tidak boleh diperlakukan sama.

---

# 14. CONVERSATION TOPIC

Conversation topic dapat digunakan untuk grouping.

Contoh:

- PACKAGE
- PRICE
- SCHEDULE
- HOTEL
- FLIGHT
- VISA
- DOCUMENT
- PAYMENT
- BOOKING
- UMROH
- HAJI
- TOUR
- SUPPORT
- OTHER
- UNKNOWN

Topic classification adalah intelligence.

---

# 15. CONVERSATION PRIORITY

Conversation priority dapat digunakan untuk membantu human agent.

Logical state:

- LOW
- NORMAL
- HIGH
- CRITICAL
- UNKNOWN

Priority tidak otomatis mengubah CRM state.

---

# 16. SENTIMENT BOUNDARY

Sentiment dapat menjadi optional analytical signal.

Logical state:

- POSITIVE
- NEUTRAL
- NEGATIVE
- MIXED
- UNKNOWN

Sentiment bukan fakta bisnis.

Sentiment tidak boleh digunakan untuk membuat keputusan material tanpa additional evidence.

---

# 17. CUSTOMER QUESTION

AI dapat mengidentifikasi:

- answered question
- unanswered question
- repeated question
- clarification needed
- escalation needed

AI tidak boleh mengklaim question sudah answered jika evidence tidak tersedia.

---

# 18. NEXT-BEST-QUESTION

AI dapat merekomendasikan pertanyaan berikutnya berdasarkan missing information.

Contoh:

- tanggal keberangkatan
- jumlah jamaah
- pilihan paket
- kebutuhan kamar
- kebutuhan lansia
- kebutuhan penerbangan
- dokumen yang belum tersedia

Recommendation harus sesuai business policy.

---

# 19. RECOMMENDED RESPONSE

AI dapat menghasilkan recommended response.

Recommended response harus diperlakukan sebagai draft/recommendation sampai authorized workflow mengizinkan pengiriman.

AI tidak otomatis mengirim message hanya karena response telah dibuat.

---

# 20. RESPONSE SAFETY

AI response recommendation harus:

- menggunakan verified information
- tidak mengarang harga
- tidak mengarang seat availability
- tidak mengarang hotel
- tidak mengarang jadwal
- tidak mengarang promo
- tidak mengarang visa requirement
- tidak mengarang payment status
- tidak mengarang booking status

Jika data tidak tersedia:

`UNKNOWN`

atau meminta human verification.

---

# 21. WHATSAPP MESSAGE AUTHORITY

AMO-012 membedakan:

### READ

AI dapat membaca conversation apabila authorized.

### ANALYZE

AI dapat menganalisis conversation.

### RECOMMEND

AI dapat membuat recommendation/draft.

### SEND

Pengiriman message membutuhkan explicit approved authority.

Phase 1:

`SEND = NOT AUTHORIZED FOR AUTONOMOUS AI`

---

# 22. HUMAN HANDOFF

Human handoff dapat terjadi apabila:

- customer meminta manusia
- AI confidence rendah
- sensitive issue
- complaint
- payment issue
- booking issue
- exception
- policy restriction
- unsupported question
- high-value opportunity
- safety concern

---

# 23. HUMAN OVERRIDE

Human agent dapat memberikan override terhadap AI recommendation sesuai authorization.

Override harus dapat diaudit apabila implementation tersedia.

AI tidak boleh silently reverse human decision.

---

# 24. CONVERSATION STATE

Logical conversation state dapat mencakup:

- OPEN
- ACTIVE
- WAITING_CUSTOMER
- WAITING_AGENT
- ESCALATED
- RESOLVED
- CLOSED
- UNKNOWN

State resmi hanya boleh berasal dari verified source/workflow.

---

# 25. SESSION BOUNDARY

WhatsApp session/context harus mengikuti official provider rules.

AMO-012 tidak menetapkan sendiri:

- session duration
- conversation window
- message window
- template requirement
- delivery policy

Nilai tersebut harus diverifikasi dari official provider documentation/integration contract.

---

# 26. OPT-IN / CONSENT

WhatsApp communication harus mengikuti applicable consent/opt-in requirements.

AMO-012 tidak menganggap:

"lead memiliki nomor WhatsApp"

sebagai bukti otomatis bahwa:

"lead mengizinkan seluruh jenis komunikasi."

Consent harus memiliki source dan authority yang dapat diverifikasi.

---

# 27. MARKETING COMMUNICATION

Marketing communication membutuhkan policy dan consent boundary.

AI tidak boleh mengirim promotional communication secara autonomous tanpa approved communication policy.

---

# 28. PERSONAL DATA

Conversation dapat mengandung personal data.

Implementasi harus mempertimbangkan:

- data minimization
- tenant isolation
- access control
- secure storage
- retention
- authorized processing
- privacy
- auditability

---

# 29. SENSITIVE CONVERSATION

Conversation yang mengandung sensitive issue dapat membutuhkan human review.

Contoh:

- payment dispute
- complaint
- legal issue
- identity issue
- security issue
- medical/sensitive personal information
- refund dispute

AI harus melakukan escalation sesuai governance.

---

# 30. AI CONVERSATION ANALYST

AI Conversation Analyst dapat:

- summarize conversation
- identify intent
- identify topic
- identify qualification signals
- identify objections
- detect unanswered questions
- detect escalation requirement
- recommend next question
- recommend response
- prioritize conversation
- summarize customer context
- explain recommendation

---

# 31. AI AUTHORITY

AI boleh:

- READ
- ANALYZE
- COMPARE
- SUMMARIZE
- DETECT
- EXPLAIN
- RECOMMEND
- DRAFT

AI tidak boleh autonomous:

- SEND_WHATSAPP
- DELETE_MESSAGE
- MODIFY_CRM
- CHANGE_CRM_STATUS
- CHANGE_OWNER
- CREATE_BOOKING
- MODIFY_BOOKING
- MODIFY_PAYMENT
- MODIFY_REVENUE

---

# 32. BOOKING HANDOFF

Conversation dapat menghasilkan:

`BOOKING_INTENT`

Namun:

`BOOKING_INTENT != BOOKING`

Booking hanya dianggap terjadi jika booking source system mengonfirmasi booking state.

---

# 33. BOOKING READINESS

AI dapat memberikan:

- NOT_READY
- POTENTIALLY_READY
- SALES_READY
- BOOKING_READY
- UNKNOWN

Booking readiness merupakan intelligence.

Bukan booking transaction.

---

# 34. PAYMENT BOUNDARY

Conversation statement seperti:

"Saya sudah transfer."

tidak otomatis menjadi payment confirmation.

Payment state harus berasal dari official financial/payment source.

---

# 35. PRICE BOUNDARY

AI tidak boleh mengarang:

- package price
- discount
- promo
- deposit
- installment
- balance

Jika pricing source tidak tersedia:

`UNKNOWN`

---

# 36. AVAILABILITY BOUNDARY

AI tidak boleh mengarang:

- seat availability
- room availability
- flight availability
- package availability

Availability harus berasal dari authoritative source.

---

# 37. CRM SYNCHRONIZATION

Conversation intelligence dapat menjadi input CRM intelligence.

Namun AMO-012 tidak mengimplementasikan CRM mutation.

Logical flow:

WhatsApp Conversation
        ↓
Conversation Intelligence
        ↓
Recommendation
        ↓
Approved CRM Workflow
        ↓
CRM

---

# 38. CRM STATUS MUTATION

AI tidak boleh autonomous:

- create lead
- close lead
- reopen lead
- qualify lead
- disqualify lead
- change pipeline
- assign owner
- merge lead
- delete lead

kecuali approved execution contract tersedia.

---

# 39. ATTRIBUTION CONTEXT

Conversation dapat menggunakan attribution context dari AMO-010.

Namun conversation tidak otomatis membuktikan attribution.

Attribution tetap mengikuti AMO-010.

---

# 40. LEAD QUALIFICATION RELATIONSHIP

Conversation qualification signal dapat digunakan AMO-011.

Flow:

Conversation
        ↓
Conversation Signal
        ↓
Lead Qualification Intelligence
        ↓
CRM Intelligence

AMO-012 tidak menggantikan AMO-011.

---

# 41. AI PROVIDER ABSTRACTION

AMO-012 tidak menetapkan AI provider tertentu.

Provider abstraction wajib.

AI business logic tidak boleh hard-code provider.

Provider capability harus diverifikasi sebelum implementation.

---

# 42. MODEL GOVERNANCE

Production AI harus memiliki:

- model identity
- version context
- policy context
- audit context
- tenant context

jika implementation mendukung AI execution.

---

# 43. AI POLICY

Conversation AI harus tunduk pada:

- business rules
- communication policy
- tenant policy
- privacy policy
- security policy
- AI governance
- human approval

AI tidak boleh bypass policy.

---

# 44. CONVERSATION CONFIDENCE

AI classification dapat memiliki:

- HIGH
- MEDIUM
- LOW
- UNKNOWN

Confidence bukan truth.

Low confidence dapat memicu human review.

---

# 45. EXPLAINABILITY

Recommendation harus dapat menjelaskan:

- conversation signal
- source message/context
- classification
- confidence
- limitation
- missing information

AI tidak boleh mengklaim evidence yang tidak ada.

---

# 46. NO-GUESSING RULE

VENTRA dilarang mengarang:

- customer identity
- conversation state
- customer intent
- budget
- travel date
- package
- price
- discount
- availability
- payment
- booking
- revenue
- consent
- attribution
- CRM state

Jika evidence tidak tersedia:

`UNKNOWN`

---

# 47. MULTI-TENANT

Conversation harus selalu tenant-scoped.

Conversation tenant A tidak boleh:

- terlihat tenant B
- digunakan AI tenant B
- digunakan sebagai training context tenant B
- digunakan sebagai benchmark tenant B
- masuk ke recommendation tenant B

---

# 48. AUDITABILITY

Jika implementation tersedia, audit context minimal dapat mencakup:

- tenant
- conversation reference
- message/source reference
- classification
- recommendation
- confidence
- model/version
- timestamp
- human override
- execution result

---

# 49. DATA FRESHNESS

Conversation intelligence harus memperhatikan freshness.

Latest conversation state tidak boleh digantikan oleh stale context tanpa indication.

---

# 50. ERROR BOUNDARY

Implementation harus membedakan:

- WhatsApp unavailable
- CRM unavailable
- authorization failure
- permission denied
- conversation unavailable
- identity unresolved
- AI unavailable
- timeout
- rate limit
- stale conversation
- provider error

Error tidak boleh diubah menjadi fabricated result.

---

# 51. RATE LIMIT

WhatsApp/CRM rate limit harus mengikuti provider contract.

AMO-012 tidak menetapkan angka rate limit tanpa official evidence.

---

# 52. MESSAGE DELIVERY

Message delivery state hanya dapat dianggap factual apabila berasal dari official provider/source.

AI recommendation bukan delivery confirmation.

---

# 53. RETRY

Retry behavior harus mengikuti provider contract.

AI tidak boleh mengasumsikan message telah terkirim hanya karena retry telah dijalankan.

---

# 54. DASHBOARD

Conversation Intelligence dashboard dapat menampilkan:

- active conversations
- unresolved conversations
- high-priority conversations
- intent distribution
- qualification signals
- escalation
- response recommendation
- booking intent
- human handoff
- conversation health

Hanya verified data yang boleh dianggap factual.

---

# 55. CEO DASHBOARD

CEO dapat melihat aggregated intelligence:

- conversation volume
- high-intent conversation
- booking intent
- escalation volume
- response performance
- unresolved conversation
- lead qualification relationship
- conversion context
- AI recommendation summary

Tenant isolation tetap wajib.

---

# 56. DIGITAL MARKETING DASHBOARD

Digital Marketing dapat menggunakan:

- conversation source
- lead quality
- intent
- campaign context
- attribution
- conversion context
- follow-up intelligence
- booking intent

untuk marketing intelligence.

---

# 57. CUSTOMER SERVICE / SALES DASHBOARD

Authorized sales/service users dapat melihat:

- conversation summary
- customer request
- unanswered questions
- qualification signals
- recommended response
- priority
- handoff
- booking readiness

Access harus mengikuti role/tenant authorization.

---

# 58. NORMALIZED OBJECT

Logical normalized object:

`ConversationIntelligenceData`

Dapat memuat:

- tenant_context
- conversation_reference
- customer_reference
- source_context
- conversation_state
- message_context
- topic
- intent
- qualification_signals
- sentiment
- priority
- summary
- unanswered_questions
- recommendation
- confidence
- consent_context
- handoff_state
- limitation
- timestamp

Object tersebut belum merupakan DB schema.

---

# 59. CAPABILITY STATUS

Capability dapat memiliki:

- VERIFIED
- PARTIALLY_VERIFIED
- NOT_VERIFIED
- UNSUPPORTED
- DEPRECATED
- UNKNOWN

UNKNOWN tidak boleh diperlakukan sebagai AVAILABLE.

---

# 60. OFFICIAL API BOUNDARY

WhatsApp capability harus diverifikasi melalui official/authorized API.

Scraping bukan primary architecture.

Provider-specific capability harus diverifikasi sebelum implementation.

---

# 61. VERSION GOVERNANCE

WhatsApp/CRM API version harus dapat dicatat apabila integration implementation tersedia.

Deprecated API tidak boleh digunakan tanpa explicit compatibility decision.

---

# 62. SECURITY

Security requirements:

- tenant isolation
- least privilege
- credential protection
- token security
- access control
- audit logging
- secure transport
- sensitive data protection
- no secret exposure

---

# 63. PRIVACY

Conversation data harus diperlakukan sebagai potentially sensitive customer data.

Implementation harus mengikuti:

- applicable privacy requirements
- consent requirements
- retention policy
- access control
- data minimization
- tenant isolation

---

# 64. RECONCILIATION

Conversation intelligence dapat berubah jika:

- new message masuk
- message delivery berubah
- CRM state berubah
- lead qualification berubah
- booking state berubah
- policy berubah
- model berubah

Derived intelligence harus dapat direcalculate tanpa mengubah source message.

---

# 65. HUMAN GOVERNANCE

Human authority tetap diperlukan untuk:

- customer complaint
- payment dispute
- booking exception
- sensitive issue
- high-value customer
- policy exception
- communication approval
- CRM mutation
- booking confirmation

---

# 66. AUTONOMOUS MODE

Phase 1:

`AUTONOMOUS WHATSAPP MESSAGE = NOT AUTHORIZED`

Future autonomous capability hanya dapat dibuka melalui:

- explicit policy
- approved execution contract
- communication rules
- consent validation
- tenant authorization
- auditability
- kill switch
- rollback/recovery
- human escalation

---

# 67. IMPLEMENTATION PRINCIPLE

AMO-012 tidak memberikan bukti bahwa:

- WhatsApp API tersedia
- CRM API tersedia
- conversation data tersedia
- message sending tersedia
- consent data tersedia
- booking integration tersedia
- AI runtime tersedia

Semua harus diverifikasi.

---

# 68. IMPLEMENTATION GATE

Implementation baru boleh dimulai setelah:

1. CRM source verified.
2. WhatsApp source/provider verified.
3. Official API verified.
4. Authorization verified.
5. Tenant binding verified.
6. Conversation identity verified.
7. Message source verified.
8. Consent/opt-in boundary verified.
9. Conversation lifecycle verified.
10. AI provider abstraction verified.
11. AI policy approved.
12. Human handoff approved.
13. CRM mutation boundary approved.
14. Booking handoff verified.
15. Pricing source verified.
16. Availability source verified.
17. Payment source verified.
18. Rate limit verified.
19. Retry policy verified.
20. Auditability approved.
21. Privacy approved.
22. Test strategy approved.

---

# 69. TESTABILITY

Future implementation harus menguji:

- tenant isolation
- conversation isolation
- message source classification
- intent classification
- qualification signal extraction
- stated vs inferred
- UNKNOWN behavior
- confidence
- hallucination prevention
- consent enforcement
- human handoff
- unauthorized send prevention
- CRM mutation prevention
- booking boundary
- payment boundary
- availability boundary
- auditability
- regression

---

# 70. RELATIONSHIP WITH AMO-010

AMO-010 menyediakan:

- lead source
- attribution
- touchpoint
- channel context
- booking relationship
- revenue relationship

AMO-012 menggunakan attribution context apabila linkage tersedia.

---

# 71. RELATIONSHIP WITH AMO-011

AMO-011 menyediakan:

- lead quality
- lead scoring
- intent
- readiness
- priority
- qualification intelligence

AMO-012 dapat menyediakan conversation signals kepada AMO-011.

---

# 72. RELATIONSHIP WITH AMO-004

Ads Analyst dapat menggunakan conversation-derived conversion intelligence apabila verified linkage tersedia.

AMO-012 tidak mengubah campaign/budget secara autonomous.

---

# 73. RELATIONSHIP WITH AMO-005

AMO-005 AI Operations Intelligence menjadi governance/operational context.

AMO-012 harus tunduk pada AI operations governance.

---

# 74. CONTRACT RULE

Dokumen ini bukan bukti bahwa integration telah tersedia.

Tidak ada DB schema, API endpoint, OAuth flow, provider SDK, atau production AI runtime yang boleh dianggap tersedia hanya karena kontrak ini.

---

# 75. APPROVAL

Approval terhadap AMO-012 berarti approval terhadap architectural contract.

Approval tidak berarti approval terhadap implementation.

Implementation tetap membutuhkan Implementation Gate.

---

# 76. FINAL STATUS

**AMO-012 STATUS: APPROVED CONTRACT**

**Implementation: NOT IMPLEMENTED**

**CRM Implementation: NONE**

**WhatsApp API Implementation: NONE**

**AI Runtime: NONE**

**Conversation Intelligence Engine: NONE**

**Autonomous WhatsApp Messaging: NOT AUTHORIZED**

**Autonomous CRM Mutation: NOT AUTHORIZED**

**Autonomous Booking Action: NOT AUTHORIZED**

**Payment Confirmation: SOURCE SYSTEM REQUIRED**

**Availability Confirmation: SOURCE SYSTEM REQUIRED**

**AI Conversation Analyst: CONTRACT DEFINED**

**Human Handoff: REQUIRED**

**Consent Boundary: REQUIRED**

**No-Guessing Rule: REQUIRED**

**Multi-Tenant Boundary: REQUIRED**

**Implementation Gate: REQUIRED**