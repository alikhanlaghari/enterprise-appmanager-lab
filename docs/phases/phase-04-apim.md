# Phase 4 – API Management (Front Door) & Secure Workflow Exposure

# Objective

Expose the internal Logic App workflow through Azure API Management (APIM) to provide controlled, secure, and governed access for external consumers.

## Architecture Overview

In this phase, the Logic App HTTP-triggered workflow was imported into Azure API Management. APIM acts as a secure gateway that abstracts backend implementation details while enforcing authentication, throttling, and monitoring.

Direct access to the Logic App endpoint is avoided. All external traffic is routed through APIM.

## Implementation Steps

- Created an API Management service (apim-eam-lab)
- Imported Logic App HTTP trigger as an API operation
- Configured API path and POST operation
- Applied subscription-based access control
- Associated API with a product to enforce subscription key usage
- Verified backend routing from APIM to Logic App

## Security Controls

- Subscription key required via Ocp-Apim-Subscription-Key header
- Unauthorized requests correctly rejected with 401
- Backend Logic App protected from direct public exposure
- 
## Validation & Testing

API tested successfully using:

- APIM Test Console
- PowerShell (Invoke-RestMethod)

## Confirmed:

- 404 errors for incorrect paths
- 401 errors for invalid subscription keys
- 200 OK for valid, authenticated requests

## Outcome

The workflow is now securely exposed through a managed API layer with enforced access control, enabling safe external integration while maintaining backend isolation.

## Key Learnings

- APIM provides governance and security beyond basic HTTP exposure
- Subscription keys are effective for consumer-level access control
- Correct API paths and products are critical for successful invocation
