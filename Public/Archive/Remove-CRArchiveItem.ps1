function Remove-CRArchiveItem {
    param (
        [Parameter(Mandatory = $true)]
        [int]$ArchiveId,
        [Parameter(Mandatory = $true)]
        [int]$ItemId,
        [string]$ApiVersion = "1"
    )

    # Construct headers
    $headers = @{
        "x-api-version" = $ApiVersion
    }

    # Invoke the API
    try {
        $response = Invoke-CloudRadialAPI -Method 'DELETE' -Path "/api/beta/archive/$ArchiveId/item/$ItemId" -Headers $headers
        if ($response -eq $null) {
            Write-Error "Failed to remove archive item from CloudRadial API."
        } else {
            Write-Output "Archive item removed successfully."
        }
    } catch {
        Write-Error "Error removing archive item: $_"
    }
}
