# Enterprise Application Manager Lab (Azure)

## Overview
This repository demonstrates how an **Enterprise Application Manager** designs, secures, and operates an internal business application using Microsoft Azure.

The lab focuses on **real operational responsibilities**, including secure access, API governance, workflow orchestration, monitoring, and validation — not just resource creation.

---

## Objectives

- Implement secure, controlled access to backend workflows
- Enforce API governance using Azure API Management
- Centralize monitoring and diagnostics
- Validate operational readiness using real telemetry
- Demonstrate production-oriented decision making

---

## Architecture Summary

The solution consists of:

- **Azure Logic Apps**  
  Used to orchestrate an enterprise workflow triggered via HTTP.

- **Azure API Management (APIM)**  
  Acts as a secure gateway, exposing the workflow while enforcing subscription-based access control.

- **Azure Monitor & Log Analytics**  
  Provides centralized observability for metrics and diagnostics across services.

External consumers interact only with API Management. Backend workflows remain protected and observable.

---

## Implementation Phases

### Phase 1 – Resource Group & Foundation
Established a structured Azure foundation to host all resources with consistent naming and scope.

### Phase 2 – Storage
Prepared storage components required for future workflow and diagnostic expansion.

### Phase 3 – Logic App Workflow
Implemented an HTTP-triggered Logic App representing a business workflow entry point.

### Phase 4 – API Management Integration
Securely exposed the Logic App through Azure API Management:
- Imported Logic App as an API operation
- Enforced subscription-key authentication
- Validated access via APIM Test Console and PowerShell
- Confirmed correct rejection of unauthorized and invalid requests

### Phase 5 – Monitoring & Diagnostics
Established production-grade observability:
- Centralized logs and metrics in Log Analytics
- Enabled diagnostic settings for APIM and Logic App
- Verified telemetry ingestion using KQL discovery queries

---

## Validation Evidence

The solution was validated using:
- Azure API Management Test Console
- PowerShell (`Invoke-RestMethod`)
- Log Analytics KQL queries

Successful `200 OK` responses confirmed correct routing and authorization.
Monitoring queries confirmed active data ingestion.

---

## Lessons Learned

- **Security must be designed, not patched later**  
  Backend workflows should never be directly exposed.

- **APIs require governance, not just endpoints**  
  Subscription keys, correct paths, and products are critical in enterprise environments.

- **Monitoring must be verified, not assumed**  
  Diagnostic settings only matter once logs are confirmed in Log Analytics.

- **Operational thinking matters more than tools**  
  Understanding failure modes, access control, and observability is key for Application Managers.

- **Small labs can demonstrate real-world responsibility**  
  This project mirrors how enterprise systems are actually operated.

---

## Disclaimer

This repository contains a **mock / educational lab** created strictly for **learning and portfolio demonstration purposes**.

- No real business data is used
- Resource names and workflows are illustrative

---

## Author Notes

This lab was intentionally built to reflect **how enterprise applications are managed in practice**, focusing on access control, monitoring, and operational validation rather than simple deployment.
