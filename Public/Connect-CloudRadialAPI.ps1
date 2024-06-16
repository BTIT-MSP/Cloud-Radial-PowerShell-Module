function Connect-CloudRadialAPI {
    param (
        [Parameter(Mandatory = $true)]
        [string]$APIPublicKey,
        [Parameter(Mandatory = $true)]
        [string]$APIPrivateKey
    )

    $authString = "$($APIPublicKey):$($APIPrivateKey)"
    $authBytes = [System.Text.Encoding]::UTF8.GetBytes($authString)
    $base64Auth = [Convert]::ToBase64String($authBytes)
    $authHeader = "Basic $base64Auth"

    $global:CloudRadialAPIHeaders = @{
        "Authorization" = $authHeader
        "Content-Type"  = "application/json"
    }
    $global:CloudRadialApiBaseUrl = "https://api.us.cloudradial.com"
    
    try {
        # Test the connection by making a simple request
        $testResponse = Invoke-RestMethod -Method Get -Uri "$global:CloudRadialApiBaseUrl/api/beta/company" -Headers $global:CloudRadialAPIHeaders
        $global:Connected = $true
        Write-Host "Connected to CloudRadial API successfully."
    } catch {
        $global:Connected = $false
        Write-Error "Failed to connect to CloudRadial API: $_"
    }
}
