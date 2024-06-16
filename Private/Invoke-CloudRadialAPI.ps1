function Invoke-CloudRadialAPI {
    param (
        [string]$Method,
        [string]$Path,
        [hashtable]$QueryParams = @{},
        [hashtable]$Body = @{},
        [hashtable]$Headers = @{}
    )

    if (-not $global:Connected) {
        Write-Error "Not connected to CloudRadial API. Please use Connect-CloudRadialAPI first."
        return $null
    }

    # Merge headers
    $allHeaders = $global:CloudRadialAPIHeaders + $Headers

    # Construct the query string
    $queryString = ($QueryParams.GetEnumerator() | ForEach-Object { "$($_.Key)=$($_.Value)" }) -join "&"
    $baseUrl = "https://api.us.cloudradial.com"
    $url = "$($baseUrl)$($Path)"
    if ($queryString) {
        $url = "$($url)?$($queryString)"
    }

    # Debugging output
    #Write-Host "Debug: Method = $Method"
    #Write-Host "Debug: Path = $Path"
    #Write-Host "Debug: QueryParams = $($QueryParams | Out-String)"
    #Write-Host "Debug: Headers = $($allHeaders | Out-String)"
    #Write-Host "Debug: URL = $url"

    try {
        if ($Method -eq 'GET' -or $Method -eq 'DELETE') {
            if ($Method -eq 'DELETE' -and $Body) {
                $response = Invoke-RestMethod -Method $Method -Uri $url -Headers $allHeaders -Body (ConvertTo-Json -InputObject $Body)
            } else {
                $response = Invoke-RestMethod -Method $Method -Uri $url -Headers $allHeaders
            }
        } else {
            $response = Invoke-RestMethod -Method $Method -Uri $url -Headers $allHeaders -Body ($Body | ConvertTo-Json)
        }
        return $response
    } catch {
        Write-Error "Error invoking CloudRadial API: $_"
        return $null
    }
}
