# Phase 5 – Monitoring

Log Analytics workspace created to centralize monitoring for Logic App and API Management activity.

- Logic App diagnostics enabled and sent to Log Analytics
- APIM (Consumption) gateway logs and metrics sent to Log Analytics via Azure Monitor.

### Log ingestion verification

- Used a discovery KQL query to confirm which tables were receiving data.
- At this stage, metrics were ingested while APIM diagnostic logs were pending.

# Validation

### PowerShell test

# Test via APIM (subscription key required)
$subKey = "**************************"
$uri = "https://apim-eam-lab.azure-api.net/enterprise-workflow/When_an_HTTP_request_is_received/paths/invoke"

Invoke-RestMethod -Method Post -Uri $uri `
  -Headers @{ "Ocp-Apim-Subscription-Key" = $subKey } `
  -ContentType "application/json" `
  -Body '{"input":"healthcheck"}'
