<#
Runbook: API Smoke Test
Purpose : Verify APIM endpoint and backend workflow execution
Owner   : Application Manager
#>

$subscriptionKey = "<APIM_SUBSCRIPTION_KEY>"
$uri = "https://apim-eam-lab.azure-api.net/enterprise-workflow/When_an_HTTP_request_is_received/paths/invoke"

$body = @{
    input = "healthcheck"
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod `
        -Method Post `
        -Uri $uri `
        -Headers @{ "Ocp-Apim-Subscription-Key" = $subscriptionKey } `
        -ContentType "application/json" `
        -Body $body

    Write-Host "API Smoke Test SUCCESS" -ForegroundColor Green
    $response
}
catch {
    Write-Host "API Smoke Test FAILED" -ForegroundColor Red
    $_.Exception.Message
}
