# SP-203 RUNTIME INTEGRATION REQUEST

> **Runtime Dependency Request for VENTRA Identity & Access Platform**

---

# DOCUMENT CONTROL

| Item | Value |
|---|---|
| Document ID | SP-203-RUNTIME-INTEGRATION-REQUEST-001 |
| Document Name | SP-203 Runtime Integration Request |
| Platform | SP-203 Identity & Access Platform |
| Consumer | VENTRA Flutter Application / `dashboard-toro` |
| Provider | SP-203 Identity & Access Platform |
| Domain | Identity & Access |
| Category | Runtime Integration Dependency |
| Edition | Enterprise Edition v2.0 |
| Version | 1.0.0 |
| Status | REQUESTED / AWAITING PROVIDER CONTRACT |
| Authority | SP-203 Identity & Access Platform |
| Consumer Owner | VENTRA Application Platform |
| Provider Owner | Identity & Access Platform |
| Security Authority | SP-204 Security Platform |
| Data Authority | Enterprise Data Architecture |
| Integration Authority | SP-208 Integration Platform |

---

# 1. PURPOSE

Dokumen ini merupakan dependency request resmi dari:

```text
VENTRA Flutter Application
        ↓
dashboard-toro
```

kepada:

```text
SP-203 Identity & Access Platform
```

untuk memperoleh runtime integration contract yang diperlukan
agar application dapat mengonsumsi Identity & Access capability
secara authoritative.

Dokumen ini:

- tidak mendefinisikan endpoint;
- tidak mendefinisikan transport yang belum dipublikasikan;
- tidak membuat schema baru;
- tidak menetapkan role;
- tidak menetapkan permission;
- tidak menetapkan tenant mapping;
- tidak menetapkan RLS mechanism;
- tidak mengasumsikan implementation internal SP-203.

Semua detail runtime harus diberikan oleh provider
yang berwenang.

---

# 1A. GATE SAFETY

Gate kita tetap aman.

Dokumen ini hanya menambah:

```text
Evidence
Request
Governance
Dependency Definition
```

Tidak ada:

```text
Runtime Code Change
Database Schema Change
RLS Policy Change
Authentication Logic Change
Authorization Logic Change
Tenant Mapping Change
Endpoint Implementation
```

Tidak ada endpoint fiktif yang dibuat atau diasumsikan.

Dokumen ini hanya mendokumentasikan dependency request
kepada authoritative provider SP-203.

Dengan demikian:

```text
Gate
  ↓
SAFE

Runtime
  ↓
UNCHANGED

Endpoint
  ↓
NOT INVENTED

Authority
  ↓
REMAINS SP-203
```

File ini ditempatkan pada:

```text
docs/20_blueprints/platform/SP-203_RUNTIME_INTEGRATION_REQUEST_001.md
```

Status tetap:

```text
APPROVED REQUEST /
AWAITING SP-203 PROVIDER CONTRACT
```

---

# 2. ARCHITECTURAL BASIS

SP-203 merupakan authoritative enterprise platform untuk:

```text
Identity
Authentication
Authorization
Role Management
Permission Management
Access Policy
Session Management
Tenant Access Context
Organization Access Context
Identity Lifecycle
Access Lifecycle
```

Consumer wajib menggunakan governed SP-203 contract.

Consumer tidak boleh membuat:

```text
Local Identity Authority
Local Authentication Authority
Local Authorization Authority
Duplicate Permission Authority
Duplicate Role Authority
Local Tenant Authority
```

tanpa approved architecture exception.

SP-203 tetap menjadi source of truth untuk Identity & Access
dalam architectural scope yang telah ditetapkan.

---

# 3. CURRENT RUNTIME POSITION

Current VENTRA application telah memiliki:

```text
Supabase Runtime Foundation
        ↓
Supabase Authentication Binding
        ↓
Session Establishment Boundary
        ↓
TenantContextSource abstraction
        ↓
RBAC architectural boundary
```

Namun concrete SP-203 runtime provider belum tersedia.

Current state:

```text
SP-203 Authority
        GREEN

SP-203 Architecture
        GREEN

SP-203 Governance
        GREEN

Consumer Abstraction
        GREEN

Concrete Runtime Transport
        HOLD

Official Endpoint
        HOLD

Runtime Provider Adapter
        HOLD
```

HOLD tersebut merupakan dependency terhadap provider contract,
bukan izin untuk membuat implementation assumption.

---

# 4. REQUEST A — AUTHENTICATION RUNTIME CONTRACT

Mohon SP-203 menyediakan authoritative runtime contract untuk
authentication.

Required information:

```text
[ ] Authentication service / endpoint
[ ] Transport mechanism
[ ] Authentication method
[ ] Request schema
[ ] Response schema
[ ] Authentication credential / token model
[ ] Token acquisition mechanism
[ ] Token propagation mechanism
[ ] Token expiration semantics
[ ] Token refresh semantics
[ ] Token revocation semantics
[ ] Logout semantics
[ ] Authentication failure contract
[ ] Session expiry behavior
[ ] Contract version
```

Tidak ada nilai yang boleh diasumsikan oleh consumer.

---

# 5. REQUEST B — EFFECTIVE TENANT ACCESS

Logical operation:

```text
Resolve Effective Tenant Access
```

SP-203 diminta menyediakan:

```text
[ ] Official service / endpoint
[ ] Transport method
[ ] Request contract
[ ] Response contract
[ ] Authentication requirement
[ ] Authorization requirement
[ ] Effective tenant representation
[ ] Effective company / organization representation
[ ] Membership semantics
[ ] Multi-tenant membership semantics
[ ] Default tenant semantics, if applicable
[ ] Tenant switching semantics, if applicable
[ ] Unauthorized response
[ ] No-access response
[ ] Session-expired response
[ ] Contract version
```

Consumer tidak akan menerima:

```text
tenant_id
company_id
organization_id
```

sebagai authority selector dari UI/client kecuali secara
eksplisit ditetapkan oleh SP-203 contract.

SP-203 tetap menjadi authority untuk menentukan effective access.

---

# 6. REQUEST C — ROLE CONTEXT

Mohon SP-203 menyediakan authoritative runtime contract untuk:

```text
Resolve Effective Role
```

Required information:

```text
[ ] Official service / endpoint
[ ] Transport method
[ ] Request schema
[ ] Response schema
[ ] Role identity representation
[ ] Role name representation
[ ] Role type representation
[ ] Role scope
[ ] Role status
[ ] Tenant relationship
[ ] Organization relationship
[ ] Session relationship
[ ] Failure semantics
[ ] Contract version
```

Consumer tidak akan membuat role enum berdasarkan asumsi
seperti:

```text
CEO
ADMIN
MARKETING
FINANCE
IT
```

kecuali role tersebut secara authoritative dipublikasikan
oleh SP-203.

---

# 7. REQUEST D — PERMISSION CONTEXT

Mohon SP-203 menyediakan authoritative runtime contract untuk:

```text
Resolve Effective Permissions
```

Required information:

```text
[ ] Official service / endpoint
[ ] Transport method
[ ] Request schema
[ ] Response schema
[ ] Permission identity
[ ] Permission code
[ ] Resource semantics
[ ] Action semantics
[ ] Scope semantics
[ ] Role-to-permission relationship
[ ] Tenant scoping
[ ] Organization scoping
[ ] Permission status
[ ] Authorization failure semantics
[ ] Contract version
```

Consumer tidak akan hard-code permission authority.

---

# 8. REQUEST E — AUTHORIZATION DECISION

Apabila SP-203 menyediakan centralized authorization decision,
mohon dipublikasikan contract untuk:

```text
Authorization Decision
```

Required information:

```text
[ ] Official service / endpoint
[ ] Transport method
[ ] Request schema
[ ] Response schema
[ ] Subject representation
[ ] Tenant representation
[ ] Organization representation
[ ] Resource representation
[ ] Action representation
[ ] Policy context
[ ] Allow semantics
[ ] Deny semantics
[ ] Reason representation
[ ] Failure semantics
[ ] Contract version
```

Baseline authorization behavior:

```text
UNKNOWN / UNAUTHORIZED
        ↓
DENY
```

kecuali SP-203 secara authoritative menetapkan policy berbeda.

---

# 9. REQUEST F — SESSION LIFECYCLE

Mohon SP-203 mendefinisikan lifecycle contract:

```text
Authenticate
    ↓
Session Established
    ↓
Session Active
    ↓
Session Refresh
    ↓
Session Expiration
    ↓
Session Revocation
    ↓
Logout
```

Required information:

```text
[ ] Session establishment
[ ] Session identity
[ ] Session expiration
[ ] Session refresh
[ ] Session revocation
[ ] Logout
[ ] Concurrent session semantics
[ ] Authentication state change
[ ] Tenant context invalidation
[ ] Authorization context invalidation
[ ] Error semantics
```

---

# 10. REQUEST G — RLS / DATABASE SECURITY BINDING

Mohon SP-203 bersama authority terkait memberikan
authoritative security binding antara:

```text
Authenticated Identity
        ↓
SP-203 Access Context
        ↓
Effective Tenant
        ↓
Database Security Boundary
        ↓
RLS / Equivalent Security Enforcement
```

Required information:

```text
[ ] Identity-to-tenant binding mechanism
[ ] Tenant-to-database security binding
[ ] Authorization-to-data binding
[ ] RLS enforcement mechanism, if applicable
[ ] Database security context mechanism
[ ] Session claim mechanism, if applicable
[ ] Token claim mechanism, if applicable
[ ] Security function / policy mechanism, if applicable
[ ] Cross-tenant protection mechanism
[ ] Fail-closed behavior
```

Consumer secara khusus tidak akan mengasumsikan:

```text
auth.uid() → tenant_id
auth.uid() → company_id
user_metadata.role → authoritative role
client tenant_id → authority
client company_id → authority
```

tanpa authoritative contract.

---

# 11. REQUEST H — ERROR CONTRACT

Mohon SP-203 menyediakan standardized error semantics
untuk minimal:

```text
Authentication Failed
Authentication Expired
Session Expired
Session Revoked
Tenant Access Denied
Tenant Context Unavailable
Role Resolution Failed
Permission Resolution Failed
Authorization Denied
Unauthorized
Forbidden
Provider Unavailable
Invalid Request
Contract Version Mismatch
```

Required:

```text
[ ] Error code
[ ] Error category
[ ] HTTP / status representation where applicable
[ ] Safe client message
[ ] Retry semantics
[ ] Logging requirement
[ ] Audit requirement
[ ] Correlation ID
```

---

# 12. REQUEST I — SECURITY CONTRACT

Mohon SP-203 memberikan:

```text
[ ] Authentication security requirement
[ ] Token security requirement
[ ] Session security requirement
[ ] Transport security requirement
[ ] Credential handling requirement
[ ] Secret handling requirement
[ ] Client storage requirement
[ ] Logging restriction
[ ] Telemetry restriction
[ ] Replay protection requirement
[ ] Revocation requirement
```

Sensitive credentials tidak boleh dipublikasikan
ke source code, repository, log, atau client bundle.

---

# 13. REQUEST J — OBSERVABILITY CONTRACT

Mohon SP-203 menyediakan requirement untuk:

```text
[ ] Correlation ID
[ ] Request ID
[ ] Authentication tracing
[ ] Authorization tracing
[ ] Tenant resolution tracing
[ ] Session tracing
[ ] Error tracing
[ ] Audit reference
[ ] Metrics requirement
[ ] Logging requirement
[ ] Sensitive-data masking requirement
```

---

# 14. REQUEST K — VERSION & COMPATIBILITY

Mohon SP-203 menyediakan:

```text
[ ] Contract ID
[ ] Version
[ ] Current version
[ ] Supported versions
[ ] Compatibility rule
[ ] Breaking-change rule
[ ] Deprecation policy
[ ] Migration policy
[ ] Sunset policy
```

Consumer implementation harus mengacu pada
versi contract yang authoritative.

---

# 15. REQUEST L — PROVIDER OWNERSHIP

Mohon ditetapkan:

```text
Provider:
SP-203 Identity & Access Platform

Provider Owner:
Identity & Access Platform

Technical Owner:
TBD by SP-203

Security Owner:
TBD by SP-203 / SP-204

Integration Owner:
TBD by SP-208 / SP-203

Contract Owner:
TBD by SP-203
```

Owner tidak boleh di-invent oleh consumer.

---

# 16. REQUIRED PROVIDER DELIVERABLE

SP-203 diminta memberikan minimal satu
authoritative runtime integration package yang mencakup:

```text
1. Authentication Contract
2. Tenant Access Contract
3. Role Contract
4. Permission Contract
5. Authorization Contract
6. Session Contract
7. Error Contract
8. Security Contract
9. Observability Contract
10. Version / Compatibility Contract
11. Database / RLS Security Binding
```

Format dapat berupa:

```text
API Specification
OpenAPI
Platform API Contract
Integration Blueprint
Service Contract
Event Contract
Official SDK Contract
```

sesuai architecture SP-203.

---

# 17. CONSUMER ACCEPTANCE CRITERIA

Consumer implementation baru boleh dimulai apabila:

```text
[ ] Provider authority confirmed
[ ] Official service confirmed
[ ] Official endpoint / service binding confirmed
[ ] Transport confirmed
[ ] Authentication contract confirmed
[ ] Tenant contract confirmed
[ ] Role contract confirmed
[ ] Permission contract confirmed
[ ] Authorization contract confirmed
[ ] Session contract confirmed
[ ] Error contract confirmed
[ ] Security contract confirmed
[ ] RLS / security binding confirmed
[ ] Version confirmed
[ ] Ownership confirmed
```

Setelah seluruh evidence tersedia:

```text
Evidence
    ↓
Architecture Review
    ↓
Decision
    ↓
Adapter Implementation
    ↓
Validation
    ↓
Approval
```

---

# 18. PROHIBITED ASSUMPTIONS

Sebelum provider contract diterima,
consumer dilarang mengasumsikan:

```text
Supabase Auth = SP-203 Authority
auth.uid() = tenant_id
auth.uid() = company_id
user_metadata.role = authoritative role
client-selected tenant_id = authority
client-selected company_id = authority
hardcoded role = authoritative role
hardcoded permission = authoritative permission
Supabase RPC = SP-203 transport
Supabase Edge Function = SP-203 endpoint
REST endpoint = SP-203 endpoint
JWT claim = SP-203 tenant binding
```

Semua hal tersebut memerlukan evidence authoritative.

---

# 19. CURRENT IMPLEMENTATION POLICY

Sampai dependency ini dipenuhi:

```text
TenantContextSource
        ↓
ABSTRACTION ONLY
```

Tidak boleh dibuat:

```text
ConcreteTenantContextSource
FakeTenantContextSource
HardcodedTenantContextSource
SupabaseTenantContextSource
```

sebagai production implementation tanpa provider contract.

Demikian pula:

```text
RBAC
RLS
Authorization Enforcement
```

tetap berada pada controlled HOLD apabila
provider runtime contract belum tersedia.

---

# 20. CURRENT GATE IMPACT

Dependency ini mempengaruhi:

```text
015D.16T TenantContext
015D.16V RBAC
015D.16W RLS
```

Current status:

```text
015D.16T
PASS WITH CONTROLLED HOLD

015D.16V
PASS WITH CONTROLLED HOLD

015D.16W
PASS WITH CONTROLLED HOLD
```

Tidak mengubah status:

```text
015D.16Q GREEN
015D.16R GREEN
015D.16S GREEN
015D.16U GREEN
```

---

# 21. DECISION

Decision:

```text
REQUEST PROVIDER RUNTIME CONTRACT
```

Status:

```text
APPROVED FOR DEPENDENCY REQUEST
```

Implementation:

```text
NOT AUTHORIZED YET
```

Endpoint:

```text
NOT DEFINED
```

Transport:

```text
NOT DEFINED
```

Provider implementation:

```text
NOT ASSUMED
```

---

# 22. NEXT ACTION

```text
VENTRA
   ↓
Submit SP-203 Runtime Integration Request
   ↓
SP-203 Provider Response
   ↓
Evidence Review
   ↓
Contract Acceptance
   ↓
Runtime Adapter Decision
```

Tidak ada runtime code change sebelum
provider contract diterima dan diverifikasi.

---

# 23. FINAL STATUS

```text
SP-203 RUNTIME INTEGRATION REQUEST
==================================

Architecture Basis        GREEN
Provider Authority         GREEN
Consumer Boundary          GREEN

Runtime Contract           REQUESTED
Concrete Transport         HOLD
Official Endpoint          HOLD
Tenant Adapter             HOLD
RBAC Adapter               HOLD
RLS Binding                HOLD

STATUS:
APPROVED REQUEST /
AWAITING SP-203 PROVIDER CONTRACT
```

---

# END OF DOCUMENT
