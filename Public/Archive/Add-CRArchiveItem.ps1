function Add-CRArchiveItem {
    param (
        [Parameter(Mandatory = $true)]
        [int]$ArchiveId,
        [Parameter(Mandatory = $true)]
        [string]$FilePath,
        [Parameter(Mandatory = $true)]
        [string]$ApiVersion = "1"
    )

    if (-not (Test-Path -Path $FilePath)) {
        Write-Error "File does not exist: $FilePath"
        return $false
    }

    $headers = @{
        "x-api-version" = $ApiVersion
    }

    $form = @{
        file = Get-Item -Path $FilePath
    }

    try {
        $response = Invoke-CloudRadialAPI -Method 'Post' -Path "/api/beta/archive/$ArchiveId/item" -Headers $headers -Body $form
        return $response
    } catch {
        Write-Error "Failed to add archive item to CloudRadial API: $_"
        return $null
    }
}
