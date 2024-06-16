function Remove-CRFeedback {
    param (
        [Parameter(Mandatory=$true)]
        [int]$FeedbackId,
        [string]$ApiVersion = "1"
    )

    $headers = @{
        "x-api-version" = $ApiVersion
    }
    return Invoke-CRCloudRadialAPI -Method 'Delete' -Path "/api/beta/feedback?id=$FeedbackId" -Headers $headers
}
