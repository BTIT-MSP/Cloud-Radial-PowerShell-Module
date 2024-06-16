function Get-CRFeedback {
    param (
        [string]$Condition,
        [string]$Direction,
        [string]$Filter,
        [string]$Order,
        [int]$Skip,
        [int]$Take,
        [string]$Value,
        [string]$ApiVersion = "1"
    )

    $query = @{
        Condition = $Condition
        Direction = $Direction
        Filter = $Filter
        Order = $Order
        Skip = $Skip
        Take = $Take
        Value = $Value
        }
        $headers = @{
        "x-api-version" = $ApiVersion
        }
        return Invoke-CRCloudRadialAPI -Method 'Get' -Path '/api/beta/feedback' -Query $query -Headers $headers
        }
