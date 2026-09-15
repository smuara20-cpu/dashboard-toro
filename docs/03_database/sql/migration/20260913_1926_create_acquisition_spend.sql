-- CAC Acquisition Spend Migration
-- Decision: CAC_ACQUISITION_SPEND_PHYSICAL_DECISION_001
-- Status: APPROVED / LOCKED

CREATE TABLE acquisition_spend (
    id UUID PRIMARY KEY,
    tenant_id UUID NOT NULL,
    campaign_id UUID NOT NULL,
    spend_date DATE NOT NULL,
    amount NUMERIC NOT NULL CHECK (amount > 0),
    currency VARCHAR NOT NULL,
    source VARCHAR NOT NULL,
    external_reference VARCHAR NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE NULL
);

CREATE INDEX idx_acquisition_spend_tenant
    ON acquisition_spend (tenant_id);

CREATE INDEX idx_acquisition_spend_campaign
    ON acquisition_spend (campaign_id);

CREATE INDEX idx_acquisition_spend_spend_date
    ON acquisition_spend (spend_date);

CREATE INDEX idx_acquisition_spend_tenant_spend_date
    ON acquisition_spend (tenant_id, spend_date);

CREATE INDEX idx_acquisition_spend_tenant_campaign_spend_date
    ON acquisition_spend (tenant_id, campaign_id, spend_date);
