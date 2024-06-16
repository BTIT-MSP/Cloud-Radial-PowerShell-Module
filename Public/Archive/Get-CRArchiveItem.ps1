function Get-CRArchiveItem {
    param (
        [Parameter(Mandatory = $true)]
        [int]$ArchiveId,
        [string]$Condition,
        [string]$Direction,
        [string]$Filter,
        [string]$Order,
        [int]$Skip,
        [int]$Take,
        [string]$Value,
        [string]$ApiVersion = "1"
    )

    # Construct query parameters
    $query = @{}
    if ($Condition) { $query['Condition'] = $Condition }
    if ($Direction) { $query['Direction'] = $Direction }
    if ($Filter) { $query['Filter'] = $Filter }
    if ($Order) { $query['Order'] = $Order }
    if ($Skip) { $query['Skip'] = $Skip }
    if ($Take) { $query['Take'] = $Take }
    if ($Value) { $query['Value'] = $Value }
    $query['x-api-version'] = $ApiVersion

    # Invoke the API
    try {
        $response = Invoke-CloudRadialAPI -Method 'GET' -Path "/api/beta/archive/$ArchiveId/item" -QueryParams $query
        if ($response -eq $null) {
            Write-Error "Failed to retrieve archive items from CloudRadial API."
        } else {
            return $response.data
        }
    } catch {
        Write-Error "Error retrieving archive items: $_"
    }
}
