function Add-CRFeedback {
    param (
        [Parameter(Mandatory=$true)]
        [hashtable]$Body,
        [string]$ApiVersion = "1"
    )

    $headers = @{
        "x-api-version" = $ApiVersion
    }
    return Invoke-CRCloudRadialAPI -Method 'Post' -Path '/api/beta/feedback' -Body $Body -Headers $headers
}
