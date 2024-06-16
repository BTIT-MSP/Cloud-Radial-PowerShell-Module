#TODO Requires testing
function Remove-CRArticle {
    param (
        [Parameter(Mandatory=$true)]
        [int]$ArticleId,
        [string]$ApiVersion = "1"
    )

    $headers = @{
        "x-api-version" = $ApiVersion
    }
    return Invoke-CRCloudRadialAPI -Method 'Delete' -Path "/api/beta/article/$ArticleId" -Headers $headers
}
