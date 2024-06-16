function Remove-CRToken {
    param (
        [Parameter(Mandatory = $true)]
        [int]$CompanyId,
        [Parameter(Mandatory = $true)]
        [string]$TokenName
    )

    # Construct the body
    $body = @{
        companyId = $CompanyId
        token     = $TokenName
    }

    # Construct headers
    $headers = @{
        "x-api-version" = "1"
    }

    # Invoke the API
    try {
        $response = Invoke-CloudRadialAPI -Method 'DELETE' -Path '/api/beta/token' -Body $body -Headers $headers
        if ($response -eq $null) {
            Write-Error "Failed to remove token from CloudRadial API."
        } else {
            Write-Output "Token removed successfully."
        }
    } catch {
        Write-Error "Error removing token: $_"
    }
}
