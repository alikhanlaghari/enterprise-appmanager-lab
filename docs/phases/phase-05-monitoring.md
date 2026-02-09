# Phase 5 – Monitoring

## Objective
Ensure production-level observability by centralizing logs and metrics for the enterprise workflow and API gateway.

This phase validates that monitoring is not only configured, but **actively ingesting data**, which is a key responsibility of an Application Manager.

---

## Implemented Components

- **Log Analytics Workspace**
  - Created to centralize monitoring data.
  - Acts as the single source of truth for operational visibility.

- **Diagnostic Settings**
  - Logic App diagnostics enabled and routed to Log Analytics.
  - API Management metrics and diagnostics configured via Azure Monitor.

---

## Log Ingestion Verification

To validate that data was flowing correctly, discovery KQL queries were executed in Log Analytics:

```kql
search *
| where TimeGenerated > ago(24h)
| summarize count() by $table
| order by count_ desc

---

## Validation

### PowerShell test

# Test via APIM (subscription key required)
$subKey = "**************************"
$uri = "https://apim-eam-lab.azure-api.net/enterprise-workflow/When_an_HTTP_request_is_received/paths/invoke"

Invoke-RestMethod -Method Post -Uri $uri `
  -Headers @{ "Ocp-Apim-Subscription-Key" = $subKey } `
  -ContentType "application/json" `
  -Body '{"input":"healthcheck"}'
---

## Results

- Metrics tables were confirmed as ingesting data.
- API Management diagnostic logs were observed in expected propagation state.
- Log ingestion validation confirmed the monitoring pipeline was functioning as designed.
---

## Outcome

- Centralized observability established.
- Monitoring configuration verified through real data ingestion.
- Operational readiness achieved for enterprise workflows.
