# VENTRA AI MARKETING AGENT CONTRACT

# Document ID: AMO-002
# Version: 1.0
# Status: DRAFT FOR VALIDATION
# Domain: AI / Marketing Intelligence
# Capability: VENTRA AI Marketing Agent
# Phase: Contract Definition
# First Specialist Agent: Ads Analyst Agent
# Implementation Status: NOT IMPLEMENTED
# Database/API Changes: NONE

---

# 1. PURPOSE

AMO-002 defines the logical contract for the VENTRA AI Marketing Agent.

This contract establishes the boundaries between:

- Marketing Intelligence
- AI Marketing Orchestrator
- Specialist Agents
- AI Provider Abstraction
- AI Model Routing
- AI Governance
- Policy
- Business Rules
- Guardrails
- Recommendation
- Human Approval
- Controlled Execution
- AI Operations
- Audit and Observability

The contract is designed so that VENTRA AI Marketing can evolve from one specialist agent into a multi-agent enterprise marketing intelligence platform without coupling business logic to a specific AI provider.


# 2. CONTRACT STATUS

This document is a logical contract definition.

It does not implement:

- database tables
- database migrations
- SQL
- provider credentials
- production AI API calls
- advertising API mutations
- campaign mutations
- budget mutations
- audience mutations
- autonomous advertising

All structures in this document are conceptual contracts until implementation evidence is established.


# 3. PRODUCT SCOPE

VENTRA AI Marketing Agent is a controlled enterprise AI marketing capability.

The target product consists of:

VENTRA AI MARKETING AGENT
|
+-- Marketing Intelligence Layer
|
+-- AI Marketing Orchestrator
|
+-- Specialist Agents
|   |
|   +-- Ads Analyst Agent
|   +-- Campaign Analyst
|   +-- Audience Analyst
|   +-- Creative Analyst
|   +-- Lead Intelligence Agent
|   +-- Funnel Analyst
|   +-- Attribution Analyst
|   +-- WhatsApp Analyst
|   +-- Content Analyst
|   +-- SEO/AEO/GEO Analyst
|   +-- Marketing Forecast Agent
|
+-- AI Provider Abstraction
|   |
|   +-- OpenAI Provider
|   +-- Gemini Provider
|   +-- Future Providers
|
+-- AI Model Router
|
+-- Policy / Rules / Guardrails
|
+-- Recommendation Layer
|
+-- Human Approval
|
+-- Controlled Execution
|
+-- AI Operations
|
+-- AI Audit / Observability


# 4. CONTRACT PRINCIPLES

## 4.1 Authoritative Data

AI does not become the source of truth.

Business data remains authoritative.

AI may interpret authorized data but may not fabricate authoritative business facts.


## 4.2 Tenant Isolation

Every AI request must operate within an authorized tenant context.

No cross-tenant inference, retrieval, recommendation, or execution is permitted.


## 4.3 Provider Independence

Specialist agents must not contain vendor-specific business logic.

Provider-specific behavior belongs behind the AI Provider Abstraction.


## 4.4 Recommendation Does Not Equal Execution

An AI recommendation is not an authorization to execute.

Execution requires:

- policy validation
- business-rule validation
- security validation
- tenant validation
- approval where required
- execution authorization


## 4.5 Evidence-Based Output

AI output must identify the evidence supporting important conclusions.

If evidence is insufficient, the contract requires an explicit insufficient-data state.


## 4.6 Governance First

No specialist agent may bypass:

- authorization
- tenant rules
- security rules
- business rules
- AI policy
- guardrails
- approval policy


# 5. TENANT CONTEXT CONTRACT

Every AI Marketing request operates inside a tenant context.

Conceptual structure:

TenantContext
    tenant_id
    company_id
    authorization_context
    user_context
    scope


The exact physical source of tenant context must follow the authoritative VENTRA authentication and tenant architecture.

The AI layer must not invent or independently resolve tenant identity.


# 6. AI AGENT IDENTITY CONTRACT

Every specialist agent must have a stable logical identity.

Conceptual structure:

AgentIdentity
    agent_id
    agent_name
    agent_version
    capability
    status
    policy_profile


Example:

agent_id:
ads_analyst

agent_name:
Ads Analyst Agent

capability:
advertising_performance_analysis


Agent identity must be auditable.


# 7. AI MARKETING REQUEST CONTRACT

Conceptual request:

AIMarketingRequest

    request_id
    tenant_context
    user_context
    agent_id
    operation
    analysis_scope
    data_scope
    objective
    constraints
    requested_output
    execution_mode


Possible operations:

ANALYZE
EXPLAIN
RECOMMEND
SUMMARIZE
COMPARE
DETECT_ANOMALY
FORECAST


The requested operation must be validated against the agent capability.


# 8. ANALYSIS SCOPE CONTRACT

Analysis scope may contain:

    period
    comparison_period
    channel
    campaign
    campaign_group
    audience
    geography
    product
    package
    funnel_stage


Only supported dimensions may be used.

Unsupported scope must return a controlled validation result.


# 9. DATA SCOPE CONTRACT

The AI agent receives only authorized data.

Conceptual:

DataScope

    source
    entities
    fields
    period
    filters
    tenant_scope
    authorization


The agent must not retrieve arbitrary data outside the authorized scope.


# 10. ADS ANALYST REQUEST CONTRACT

The first specialist agent uses:

AdsAnalysisRequest

    tenant_context
    request_id
    analysis_period
    comparison_period
    channel_scope
    campaign_scope
    objective
    available_metrics
    constraints


Supported analytical objectives may include:

PERFORMANCE_SUMMARY

PERIOD_COMPARISON

ANOMALY_DETECTION

PERFORMANCE_DIAGNOSIS

CAMPAIGN_COMPARISON

RECOMMENDATION


# 11. REQUIRED DATA RULE

The agent must determine whether sufficient data exists before analysis.

Possible states:

DATA_READY

PARTIAL_DATA

INSUFFICIENT_DATA

INVALID_DATA

UNAUTHORIZED_DATA


The agent must not infer missing business facts as if they were present.


# 12. METRIC CONTRACT

Conceptual advertising metrics may include:

- spend
- impressions
- reach
- clicks
- CTR
- CPC
- CPM
- frequency
- leads
- conversations
- conversions
- revenue
- ROAS

The physical availability of each metric must be verified before implementation.

A metric must not be displayed as authoritative if the source does not provide it.


# 13. MARKETING INTELLIGENCE CONTRACT

Marketing Intelligence provides normalized analytical information to AI.

Conceptual domains include:

- paid media
- organic search
- social media
- leads
- CRM
- WhatsApp
- booking
- payment
- revenue
- attribution
- campaign performance
- funnel performance


The AI layer consumes normalized information.

It does not own the underlying business data.


# 14. MARKETING FUNNEL CONTRACT

The long-term intelligence flow is:

Paid Media
    |
    v
Lead
    |
    v
Conversation
    |
    v
Qualified Lead
    |
    v
CRM
    |
    v
Booking
    |
    v
Payment
    |
    v
Revenue


Each stage must have validated data before being used for analytical conclusions.


# 15. AI MARKETING ORCHESTRATOR CONTRACT

The AI Marketing Orchestrator is responsible for:

1. receiving request
2. validating tenant
3. validating authorization
4. validating agent
5. validating operation
6. validating data scope
7. selecting model/provider capability
8. invoking specialist agent
9. validating agent output
10. applying policy
11. applying guardrails
12. producing recommendation
13. recording audit evidence


The orchestrator is the central control point for AI Marketing execution.


# 16. SPECIALIST AGENT CONTRACT

Every specialist agent should expose a common logical interface.

Conceptual:

SpecialistAgent

    identity()
    capabilities()
    validateRequest()
    analyze()
    explain()
    recommend()
    validateOutput()


Not every agent must implement every operation.

Unsupported operations must return a controlled unsupported-operation result.


# 17. ADS ANALYST AGENT CONTRACT

Ads Analyst Agent supports:

ANALYZE

EXPLAIN

COMPARE

DETECT_ANOMALY

RECOMMEND

SUMMARY


Ads Analyst Agent does NOT directly execute advertising actions.


# 18. ADS ANALYST OUTPUT CONTRACT

Conceptual response:

AdsAnalysisResponse

    request_id
    tenant_context
    agent_id
    status
    summary
    insights
    evidence
    anomalies
    recommendations
    confidence
    limitations
    policy_status
    audit_reference


Possible status values:

SUCCESS

PARTIAL

INSUFFICIENT_DATA

INVALID_REQUEST

UNAUTHORIZED

POLICY_REJECTED

PROVIDER_FAILURE

INVALID_OUTPUT


# 19. INSIGHT CONTRACT

Conceptual:

Insight

    insight_id
    category
    title
    observation
    evidence
    impact
    confidence


An insight must distinguish:

OBSERVATION

from

INTERPRETATION

from

HYPOTHESIS


# 20. EVIDENCE CONTRACT

Conceptual:

Evidence

    source
    metric
    value
    period
    comparison
    relationship
    evidence_strength


Evidence must be traceable to authorized input data.

No synthetic evidence is permitted.


# 21. CONFIDENCE CONTRACT

Allowed logical states:

HIGH

MEDIUM

LOW

INSUFFICIENT


Confidence expresses analytical certainty.

Confidence does not grant execution permission.


# 22. RECOMMENDATION CONTRACT

Conceptual:

Recommendation

    recommendation_id
    category
    priority
    recommendation
    rationale
    evidence
    expected_impact
    confidence
    policy_status
    approval_required
    execution_status


Possible priority:

CRITICAL

HIGH

MEDIUM

LOW

INFORMATIONAL


# 23. RECOMMENDATION STATUS

Possible logical states:

DRAFT

VALIDATING

APPROVED

REJECTED

EXPIRED

EXECUTED

FAILED

BLOCKED


The AI agent must not directly set EXECUTED.


# 24. POLICY STATUS CONTRACT

Possible values:

ALLOWED

REQUIRES_APPROVAL

BLOCKED

NOT_APPLICABLE

INSUFFICIENT_POLICY_CONTEXT


Policy status must be evaluated independently from model confidence.


# 25. AI PROVIDER CONTRACT

Conceptual interface:

AIProvider

    providerId()
    modelId()
    generate()
    generateStructured()
    validateAvailability()
    providerMetadata()


Providers are implementation adapters.

They are not business logic.


# 26. PROVIDER IMPLEMENTATIONS

Architectural targets:

OpenAIProvider

GeminiProvider

FutureProvider


Provider implementation must remain replaceable.

The Ads Analyst Agent must not directly depend on OpenAI or Gemini SDK behavior.


# 27. AI MODEL ROUTING CONTRACT

VENTRA may route AI requests according to:

- capability
- complexity
- latency requirement
- cost policy
- availability
- context size
- quality requirement
- governance policy


Conceptual:

AIModelRouter

    selectProvider()
    selectModel()
    validatePolicy()
    returnRoutingDecision()


Model routing must remain policy controlled.


# 28. AI OPERATIONS CONTRACT

VENTRA AI Operations must eventually provide operational visibility into AI usage.

Conceptual metrics:

- total tokens
- input tokens
- output tokens
- total requests
- successful requests
- failed requests
- responses
- chat completions
- latency
- prompt cache usage
- provider usage
- model usage
- AI cost
- credit balance
- error rate


These are operational metrics.

They are not automatically business KPIs.


# 29. AI COST CONTRACT

AI cost tracking should distinguish:

- provider
- model
- request
- tenant
- agent
- operation
- token usage
- estimated cost
- actual cost where available


AI cost must not be fabricated if provider billing information is unavailable.


# 30. AI MODEL INTELLIGENCE CONTRACT

VENTRA may provide a model intelligence layer.

Conceptual model information:

AIModel

    provider
    model
    capability
    quality_profile
    latency_profile
    cost_profile
    availability
    recommendation_status


The system may recommend a model according to policy and workload.


# 31. MODEL RECOMMENDATION CONTRACT

A model recommendation may consider:

- analytical complexity
- expected output quality
- cost
- latency
- workload volume
- context requirements
- structured-output capability


The model recommendation must not bypass provider policy.


# 32. AI GOVERNANCE CONTRACT

AI governance applies to:

- agent selection
- provider selection
- model selection
- data access
- output generation
- recommendation
- execution


Governance must remain external to the model itself.


# 33. GUARDRAIL CONTRACT

Guardrails must validate:

- tenant
- authorization
- data scope
- operation
- prohibited actions
- output format
- policy
- recommendation boundary
- execution boundary


Possible result:

ALLOW

WARN

BLOCK


BLOCK must stop the prohibited operation.


# 34. HUMAN APPROVAL CONTRACT

Operations requiring approval must enter:

PENDING_APPROVAL


Human decision may be:

APPROVE

REJECT

MODIFY

ESCALATE


The AI agent cannot approve its own recommendation.


# 35. CONTROLLED EXECUTION CONTRACT

Future execution flow:

Recommendation
    |
    v
Policy Validation
    |
    v
Approval
    |
    v
Execution Adapter
    |
    v
Execution
    |
    v
Result
    |
    v
Audit


Execution adapters may eventually support:

- advertising platforms
- CRM
- WhatsApp
- content systems
- other approved marketing systems


Phase 1 Ads Analyst does not execute these actions.


# 36. EXECUTION SAFETY CONTRACT

The following actions are protected:

- budget changes
- campaign activation
- campaign pause
- audience mutation
- bid changes
- creative publication
- messaging actions
- campaign creation
- campaign deletion


Each future execution must have explicit authorization.


# 37. AI MEMORY / CONTEXT CONTRACT

AI context may contain:

- current tenant
- current user
- current task
- current analysis scope
- authorized business context
- previous relevant agent output
- approved policy context


AI context must respect tenant and security boundaries.

Memory must not become an uncontrolled source of business truth.


# 38. AI CONVERSATION CONTRACT

The Marketing Agent may eventually support conversational interaction.

Example:

User:

"Kenapa leads Meta Ads minggu ini turun?"

AI:

1. identify tenant
2. identify time period
3. retrieve authorized marketing intelligence
4. analyze
5. explain evidence
6. provide confidence
7. recommend action if appropriate


The conversation must remain grounded in available evidence.


# 39. AI DASHBOARD CONTRACT

VENTRA AI Marketing Dashboard should eventually expose:

## Executive KPI

- revenue
- registrants
- leads
- conversations
- payment conversion


## Performance

- registration and revenue
- lead and conversation
- funnel
- chat busy hours


## Advertising

- spend
- impressions
- reach
- clicks
- CTR
- CPC
- CPM
- leads
- conversion
- ROAS


## AI Intelligence

- insights
- anomalies
- recommendations
- confidence
- evidence
- pending approvals


# 40. AI OPERATIONS DASHBOARD CONTRACT

VENTRA AI Operations may expose:

- total tokens
- requests
- responses
- completion count
- prompt cache / hit rate
- provider spend
- credit usage
- model usage
- latency
- provider health
- agent health
- failure rate


Time ranges may include:

24H

7D

14D

30D


The exact UI is an implementation concern.


# 41. AI AGENT CENTER CONTRACT

VENTRA may provide an Agent Center showing:

- agent
- capability
- status
- provider
- model
- version
- execution count
- success rate
- last execution
- policy profile


Initial agent:

Ads Analyst Agent


Future agents:

Campaign Analyst
Audience Analyst
Creative Analyst
Lead Intelligence Agent
Funnel Analyst
Attribution Analyst
WhatsApp Analyst
Content Analyst
SEO/AEO/GEO Analyst
Marketing Forecast Agent


# 42. AUDIT CONTRACT

AI operations must be auditable.

Conceptual audit:

AIAudit

    audit_id
    tenant
    user
    timestamp
    request_id
    agent
    operation
    data_scope
    provider
    model
    policy
    result
    recommendation
    confidence
    approval
    execution
    outcome


Audit information must not expose secrets.


# 43. OBSERVABILITY CONTRACT

Observability should distinguish:

AGENT_EXECUTION

PROVIDER_EXECUTION

MODEL_ROUTING

POLICY_VALIDATION

GUARDRAIL_VALIDATION

RECOMMENDATION

APPROVAL

EXECUTION

FAILURE


This allows diagnosis of whether a failure occurred in:

- data
- agent
- provider
- model
- policy
- execution


# 44. ERROR CONTRACT

Controlled error categories:

INVALID_REQUEST

INVALID_TENANT

UNAUTHORIZED

DATA_UNAVAILABLE

INSUFFICIENT_DATA

INVALID_DATA

UNSUPPORTED_OPERATION

AGENT_UNAVAILABLE

PROVIDER_UNAVAILABLE

PROVIDER_TIMEOUT

INVALID_PROVIDER_RESPONSE

POLICY_REJECTED

GUARDRAIL_BLOCKED

APPROVAL_REQUIRED

EXECUTION_FAILED


Errors must be explicit and auditable.


# 45. NO-GUESSING CONTRACT

The AI Marketing Agent must never invent:

- revenue
- spend
- leads
- conversions
- ROAS
- campaign state
- customer information
- booking status
- payment status
- platform status
- provider status


If the required information does not exist:

INSUFFICIENT_DATA


# 46. CROSS-DOMAIN CONTRACT

The future AI Marketing Agent may correlate:

Ads
    |
Lead
    |
Conversation
    |
CRM
    |
Booking
    |
Payment
    |
Revenue


Each correlation requires validated identifiers and authorized data.

The agent must not infer cross-domain relationships from unsupported assumptions.


# 47. EXTERNAL PLATFORM CONTRACT

Future external adapters may include:

Meta Ads Adapter

Google Ads Adapter

TikTok Ads Adapter

WhatsApp Adapter

CRM Adapter

Booking Adapter

Payment / Revenue Adapter


The AI agent consumes normalized data.

External API-specific behavior belongs in adapters.


# 48. SECURITY CONTRACT

The implementation must enforce:

- no secrets in source
- secure provider credentials
- tenant isolation
- authorization
- least privilege
- protected audit data
- controlled external API access
- protected execution
- no policy bypass


# 49. PERFORMANCE CONTRACT

AI architecture should support:

- asynchronous operations where appropriate
- timeout handling
- provider retry policy
- controlled concurrency
- caching where policy permits
- structured output
- observability


Performance optimization must not bypass governance.


# 50. SCALABILITY CONTRACT

The architecture must support:

- multiple tenants
- multiple agents
- multiple providers
- multiple models
- multiple marketing channels
- multiple data sources
- multiple execution adapters


New providers or agents should be added through abstractions rather than rewriting business logic.


# 51. PHASE 1 CONTRACT BOUNDARY

Phase 1 supports:

READ

ANALYZE

EXPLAIN

COMPARE

DETECT

RECOMMEND


Phase 1 does not support:

CREATE CAMPAIGN

DELETE CAMPAIGN

PAUSE CAMPAIGN

ACTIVATE CAMPAIGN

CHANGE BUDGET

CHANGE AUDIENCE

CHANGE BID

PUBLISH CREATIVE

AUTONOMOUS ADVERTISING


# 52. PHASED AGENT ROADMAP

PHASE 1

Ads Analyst Agent


PHASE 2

Campaign Analyst
Audience Analyst
Creative Analyst


PHASE 3

Lead Intelligence
Funnel Analyst
Attribution Analyst


PHASE 4

WhatsApp Analyst
Content Analyst
SEO/AEO/GEO Analyst
Marketing Forecast


PHASE 5

Controlled Execution


PHASE 6

Policy-Controlled Autonomous Marketing


# 53. CONTRACT ACCEPTANCE CRITERIA

AMO-002 is ready for approval when:

- tenant context is defined
- request contract is defined
- data scope is defined
- agent identity is defined
- specialist-agent interface is defined
- Ads Analyst request is defined
- Ads Analyst response is defined
- evidence contract is defined
- confidence contract is defined
- recommendation contract is defined
- provider abstraction is defined
- model routing is defined
- AI Operations contract is defined
- AI Model Intelligence is defined
- AI Governance is defined
- guardrails are defined
- approval is defined
- controlled execution is defined
- audit is defined
- observability is defined
- error states are defined
- no-guessing rule is defined
- Phase 1 execution boundary is defined


# 54. EXPLICIT NON-GOALS

This contract does not implement:

- database migration
- SQL
- Supabase schema changes
- OpenAI SDK integration
- Gemini SDK integration
- Meta Ads API
- Google Ads API
- TikTok Ads API
- WhatsApp API
- campaign mutation
- budget mutation
- audience mutation
- bid mutation
- creative publication
- autonomous marketing
- authentication changes
- tenant resolution changes
- SP-203 changes


# 55. IMPLEMENTATION SEQUENCE

After AMO-002 approval:

AMO-003
Marketing Agent Data Flow Contract

        |

AMO-004
Ads Analyst Agent Contract

        |

AMO-005
AI Operations / Model Contract

        |

Implementation Decision

        |

VENTRA AI Foundation

        |

AI Provider Abstraction

        |

AI Model Router

        |

AI Marketing Orchestrator

        |

AI Policy / Guardrails

        |

Recommendation Layer

        |

AI Audit / Observability

        |

Ads Analyst Agent

        |

Marketing Intelligence Adapter

        |

Tests

        |

Validation

        |

Approval

        |

Commit / Push


# 56. ARCHITECTURE GUARANTEE

The contract is designed so that:

- Ads Analyst is not hard-coded to one provider
- provider can change without rewriting the agent
- new agents can be added without redesigning the orchestrator
- AI governance remains centralized
- tenant isolation remains mandatory
- recommendations remain separate from execution
- AI operations remain observable
- model selection remains policy controlled
- future controlled autonomy remains possible without weakening current safety boundaries


# 57. FINAL CONTRACT DECISION

VENTRA AI Marketing Agent is defined as a multi-layer enterprise capability:

Marketing Intelligence
        |
        v
AI Marketing Orchestrator
        |
        v
Specialist Agents
        |
        v
AI Provider Abstraction
        |
        v
AI Model Router
        |
        v
Policy / Rules / Guardrails
        |
        v
Recommendation Layer
        |
        v
Human Approval
        |
        v
Controlled Execution
        |
        v
Audit / Observability


AI Operations and Model Intelligence operate across the AI layer.

Ads Analyst Agent is the first implementation target.

Phase 1 remains:

READ
ANALYZE
EXPLAIN
RECOMMEND


# 58. GOVERNANCE STATEMENT

VENTRA AI Marketing must remain:

evidence-based

tenant-aware

provider-independent

policy-controlled

security-controlled

auditable

explainable

approval-controlled

business-rule constrained


AI capability must never silently become business authority.

# END OF AMO-002
