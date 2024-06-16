function Get-CRToken {
    param (
        [int]$CompanyId
    )

    if (-not $global:Connected) {
        Write-Error "Not connected to CloudRadial API. Please use Connect-CloudRadialAPI first."
        return $null
    }

    $queryParams = @{
        companyId = $CompanyId
    }

    $headers = @{
        "x-api-version" = "1"
    }

    try {
        $response = Invoke-CloudRadialAPI -Method Get -Path "/api/beta/token" -QueryParams $queryParams -Headers $headers
        if ($response -eq $null) {
            Write-Error "Failed to retrieve tokens from CloudRadial API."
        }
        if ($response.Data) {
            return $response.Data
        }
        else {
            return $response
        }
        
    }
    catch {
        Write-Error "Error fetching tokens: $_"
        return $null
    }
}
