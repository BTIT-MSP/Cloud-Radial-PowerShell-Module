function Remove-CRArchive {
    param (
        [Parameter(Mandatory = $true)]
        [int]$ArchiveId,
        [string]$ApiVersion = "1"
    )

    # Construct headers
    $headers = @{
        "x-api-version" = $ApiVersion
    }

    # Invoke the API
    try {
        $response = Invoke-CloudRadialAPI -Method 'DELETE' -Path "/api/beta/archive/$ArchiveId" -Headers $headers
        if ($response -eq $null) {
            Write-Error "Failed to remove archive from CloudRadial API."
        } else {
            Write-Output "Archive removed successfully."
        }
    } catch {
        Write-Error "Error removing archive: $_"
    }
}
