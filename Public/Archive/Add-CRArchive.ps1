#Cloud radial API documentation is terrible. It's not clear that you can pass all the values in the body. I commented out ones that look obviously wrong for new archive.
function Add-CRArchive {
    param (
        [Parameter(Mandatory = $true)]
        [int]$CompanyId,
        [string]$AlertKeywords,
        [bool]$AlwaysSendAlert,
        [string]$Category,
        [string]$CompanyGroups,
       # [datetime]$DateLastReceived,
        [string]$EmailNoticeList,
        [datetime]$EndDate,
        [double]$EstimatedTime,
        [string]$FlowPartnerWebhook,
        [string]$InboundAddress,
        [bool]$IsSendOnEveryError,
        [bool]$IsSendToPsa,
        [bool]$IsShowMessage,
      #  [int]$ItemCount,
        [string]$JsonPartnerWebhook,
      #  [datetime]$LastErrorDays,
       # [datetime]$LastErrorKeywords,
        [string]$Name,
        [string]$PartnerEmailList,
        [string]$PsaBoard,
        [string]$PsaCategory,
        [string]$PsaItem,
        [string]$PsaPriority,
        [string]$PsaSource,
        [string]$PsaStatus,
        [string]$PsaSubType,
        [string]$PsaType,
        [string]$RequiredKeywords,
        [int]$RetainForDays,
        [string]$SlackPartnerWebhook,
        [string]$SlackWebhook,
        [datetime]$StartDate,
        [string]$TeamsPartnerWebhook,
        [string]$TeamsWebhook,
      #  [int]$TotalItemSize,
        [string]$UserGroups,
        [int]$WarnOnPastDays,
        [string]$ApiVersion = "1"
    )

    # Construct the body
    $body = @{}
    if ($AlertKeywords) { $body['alertKeywords'] = $AlertKeywords }
    if ($AlwaysSendAlert) { $body['alwaysSendAlert'] = $AlwaysSendAlert }
    if ($Category) { $body['category'] = $Category }
    if ($CompanyGroups) { $body['companyGroups'] = $CompanyGroups }
    $body['companyId'] = $CompanyId
    if ($DateLastReceived) { $body['dateLastReceived'] = $DateLastReceived }
    if ($EmailNoticeList) { $body['emailNoticeList'] = $EmailNoticeList }
    if ($EndDate) { $body['endDate'] = $EndDate }
    if ($EstimatedTime) { $body['estimatedTime'] = $EstimatedTime }
    if ($FlowPartnerWebhook) { $body['flowPartnerWebhook'] = $FlowPartnerWebhook }
    if ($InboundAddress) { $body['inboundAddress'] = $InboundAddress }
    if ($IsSendOnEveryError) { $body['isSendOnEveryError'] = $IsSendOnEveryError }
    if ($IsSendToPsa) { $body['isSendToPsa'] = $IsSendToPsa }
    if ($IsShowMessage) { $body['isShowMessage'] = $IsShowMessage }
    if ($ItemCount) { $body['itemCount'] = $ItemCount }
    if ($JsonPartnerWebhook) { $body['jsonPartnerWebhook'] = $JsonPartnerWebhook }
    if ($LastErrorDays) { $body['lastErrorDays'] = $LastErrorDays }
    if ($LastErrorKeywords) { $body['lastErrorKeywords'] = $LastErrorKeywords }
    if ($Name) { $body['name'] = $Name }
    if ($PartnerEmailList) { $body['partnerEmailList'] = $PartnerEmailList }
    if ($PsaBoard) { $body['psaBoard'] = $PsaBoard }
    if ($PsaCategory) { $body['psaCategory'] = $PsaCategory }
    if ($PsaItem) { $body['psaItem'] = $PsaItem }
    if ($PsaPriority) { $body['psaPriority'] = $PsaPriority }
    if ($PsaSource) { $body['psaSource'] = $PsaSource }
    if ($PsaStatus) { $body['psaStatus'] = $PsaStatus }
    if ($PsaSubType) { $body['psaSubType'] = $PsaSubType }
    if ($PsaType) { $body['psaType'] = $PsaType }
    if ($RequiredKeywords) { $body['requiredKeywords'] = $RequiredKeywords }
    if ($RetainForDays) { $body['retainForDays'] = $RetainForDays }
    if ($SlackPartnerWebhook) { $body['slackPartnerWebhook'] = $SlackPartnerWebhook }
    if ($SlackWebhook) { $body['slackWebhook'] = $SlackWebhook }
    if ($StartDate) { $body['startDate'] = $StartDate }
    if ($TeamsPartnerWebhook) { $body['teamsPartnerWebhook'] = $TeamsPartnerWebhook }
    if ($TeamsWebhook) { $body['teamsWebhook'] = $TeamsWebhook }
    if ($TotalItemSize) { $body['totalItemSize'] = $TotalItemSize }
    if ($UserGroups) { $body['userGroups'] = $UserGroups }
    if ($WarnOnPastDays) { $body['warnOnPastDays'] = $WarnOnPastDays }

    # Construct headers
    $headers = @{
        "x-api-version" = $ApiVersion
    }

    # Invoke the API
    try {
        $response = Invoke-CloudRadialAPI -Method 'POST' -Path '/api/beta/archive' -Body $body -Headers $headers
        if ($response -eq $null) {
            Write-Error "Failed to add archive to CloudRadial API."
        } else {
            return $response
        }
    } catch {
        Write-Error "Error adding archive: $_"
    }
}
