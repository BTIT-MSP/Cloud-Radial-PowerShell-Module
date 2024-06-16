# Cloud-Radial-PowerShell-Module
Module written by Chris Davis from Bay Technologies for use with Cloud Radial beta API.

Use at your own risk! This is highly experimental. 

# Examples
Initial server connection:
Connect-CloudRadialAPI -APIPublicKey "<YourKeyHere>>" -APIPrivateKey "<YourKeyHere>>"

Get list of companies:
Get-CRCompany

Get only top 5 companies:
Get-CRCompany -Take 5

Get companies where the name contains the word "goat"
Get-CRCompany -Filter "name" -Condition "contains" -Value "goat"

# Get CR Tokens (aka variables used in the Cloud Radial App)
For partner level tokens:
Get-CRToken -CompanyID 0

For client level tokens
Get-CRToken -CompanyID <SomeID>

# Common API params
Skip - The number of records to skip over before returning results. Leave blank or enter 0 for the first page.
Take - The number of records to return. The default is 10. Using a Skip value of 10 and a Take value of 10 returns the second page of records.
Order - The field to sort the results by.
Direction - The sort order of the results.
    a - Ascending
    d - Descending.
Filter - Enter a field name for the filter.
Condition - Enter a test condition.
    eq - Equals
    contains - Contains
Value - Enter a value to test the filter against

