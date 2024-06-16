function Add-CRToken {
    param (
        [Parameter(Mandatory = $true)]
        [int]$CompanyId,
        [Parameter(Mandatory = $true)]
        [string]$TokenName,
        [Parameter(Mandatory = $true)]
        [string]$TokenValue
    )

    # Construct the body
    $body = @{
        companyId = $CompanyId
        token     = $TokenName
        value     = $TokenValue
    }

    # Invoke the API
    try {
        $response = Invoke-CloudRadialAPI -Method 'POST' -Path '/api/beta/token' -Body $body
        if ($response -eq $null) {
            Write-Error "Failed to add token to CloudRadial API."
        } else {
            Write-Host "Token added successfully."
        }
    } catch {
        Write-Error "Error adding token: $_"
    }
}
