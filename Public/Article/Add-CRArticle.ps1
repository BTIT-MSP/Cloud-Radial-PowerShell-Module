#TODO Requires testing
function Add-CRArticle {
    param (
        [Parameter(Mandatory=$true)]
        [hashtable]$Body,
        [string]$ApiVersion = "1"
    )

    $headers = @{
        "x-api-version" = $ApiVersion
    }
    return Invoke-CRCloudRadialAPI -Method 'Post' -Path '/api/beta/article' -Body $Body -Headers $headers
}
