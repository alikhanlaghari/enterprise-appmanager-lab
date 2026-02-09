# Phase 5 – Monitoring

Log Analytics workspace created to centralize monitoring for Logic App and API Management activity.

- Logic App diagnostics enabled and sent to Log Analytics
- APIM (Consumption) gateway logs and metrics sent to Log Analytics via Azure Monitor.

### Log ingestion verification

- Used a discovery KQL query to confirm which tables were receiving data.
- At this stage, metrics were ingested while APIM diagnostic logs were pending.
