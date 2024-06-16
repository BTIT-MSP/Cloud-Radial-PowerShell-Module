function Get-CRCompany {
    param (
        [Parameter(Mandatory = $false)]
        [string]$Condition,
        [Parameter(Mandatory = $false)]
        [string]$Direction,
        [Parameter(Mandatory = $false)]
        [string]$Filter,
        [Parameter(Mandatory = $false)]
        [string]$Order,
        [Parameter(Mandatory = $false)]
        [int]$Skip,
        [Parameter(Mandatory = $false)]
        [int]$Take,
        [Parameter(Mandatory = $false)]
        [string]$Value,
        [Parameter(Mandatory = $false)]
        [string]$ApiVersion = "1"
    )

    # Construct query parameters
    $QueryParams = @{}
    if ($Condition) {
        $QueryParams['Condition'] = $Condition 
    }
    if ($Direction) {
        $QueryParams['Direction'] = $Direction 
    }
    if ($Filter) {
        $QueryParams['Filter'] = $Filter 
    }
    if ($Order) {
        $QueryParams['Order'] = $Order 
    }
    if ($Skip) {
        $QueryParams['Skip'] = $Skip 
    }
    if ($Take) {
        $QueryParams['Take'] = $Take 
    }
    if ($Value) {
        $QueryParams['Value'] = $Value 
    }
    $QueryParams['x-api-version'] = $ApiVersion

    # Invoke the API
    try {
        $response = Invoke-CloudRadialAPI -Method 'GET' -Path '/api/beta/company' -QueryParams $QueryParams
        if ($response -eq $null) {
            Write-Error "Failed to retrieve company information from CloudRadial API."
        }
        if ($Response.data) {
            return $response.data
        }
        else {
            return $response
        }

    }
    catch {
        Write-Error "Error retrieving company information: $_"
    }
}
