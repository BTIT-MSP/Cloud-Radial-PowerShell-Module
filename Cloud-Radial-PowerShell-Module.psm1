# Import Public functions recursively
Get-ChildItem -Path $PSScriptRoot\Public -Recurse -Filter *.ps1 | ForEach-Object {
    Write-Host "Loading function from $($_.FullName)"
    . $_.FullName
}

# Import Private functions
Get-ChildItem -Path $PSScriptRoot\Private -Recurse -Filter *.ps1 | ForEach-Object {
    Write-Host "Loading private function from $($_.FullName)"
    . $_.FullName
}

# Export Public functions
Export-ModuleMember -Function 'Connect-CloudRadialAPI', 'Get-CRArchive', 'Add-CRArchive', 'Add-CRArchiveItem', 'Remove-CRArchive', 'Get-CRArchiveItem', 'Add-CRArchiveItem', 'Remove-CRArchiveItem', 'Get-CRArticle', 'Add-CRArticle', 'Remove-CRArticle', 'Get-CRCompany', 'Get-CRFeedback', 'Add-CRFeedback', 'Remove-CRFeedback', 'Get-CRToken', 'Add-CRToken', 'Remove-CRToken'
