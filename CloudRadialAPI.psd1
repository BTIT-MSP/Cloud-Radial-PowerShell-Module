@{
    # Script module or binary module file associated with this manifest.
    RootModule = 'CloudRadialAPI.psm1'

    # Version number of this module.
    ModuleVersion = '1.0.0'

    # ID used to uniquely identify this module
    GUID = '3247fec2-895a-405b-b7d0-9a8c3bcedb84'

    # Author of this module
    Author = 'Chris Davis'

    # Company or vendor of this module
    CompanyName = 'Bay Technologies'

    # Copyright statement for this module
    Copyright = 'Bay Technologies (c) 2024. All rights reserved.'

    # Description of the functionality provided by this module
    Description = 'A PowerShell module for interacting with the CloudRadial API.'

    # Minimum version of the PowerShell engine required by this module
    PowerShellVersion = '5.1'

    # Functions to export from this module
    FunctionsToExport = @(
        'Connect-CloudRadialAPI',
        'Get-CRArchive',
        'Add-CRArchive',
        'Remove-CRArchive',
        'Get-CRArchiveItem',
        'Add-CRArchiveItem',
        'Remove-CRArchiveItem',
        'Get-CRArticle',
        'Add-CRArticle',
        'Remove-CRArticle',
        'Get-CRCompany',
        'Get-CRFeedback',
        'Add-CRFeedback',
        'Remove-CRFeedback',
        'Get-CRToken',
        'Add-CRToken',
        'Remove-CRToken'
    )

    # Cmdlets to export from this module
    CmdletsToExport = @()

    # Variables to export from this module
    VariablesToExport = @()

    # Aliases to export from this module
    AliasesToExport = @()

    # DSC resources to export from this module
    DscResourcesToExport = @()

    # List of all modules packaged with this module
    NestedModules = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess
    PrivateData = @{}

    # HelpInfo URI for this module
    HelpInfoURI = ''

    # Default prefix for commands exported from this module. Override the default prefix using Export-ModuleMember -Function.
    DefaultCommandPrefix = ''

    # Module metadata
    ModuleList = @()
    FileList = @()
    RequiredAssemblies = @()
    RequiredModules = @()

    # Additional metadata attributes.
    # These attributes are meant to inform consumers about the module capabilities.
    # They don't affect module loading.
    CompatiblePSEditions = @('Core', 'Desktop')
}
