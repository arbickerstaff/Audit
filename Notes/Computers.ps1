# random snips

# When on the network

[System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest()

[System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()

$ForestRootDomain = (([System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()).Forest).Name
([System.DirectoryServices.ActiveDirectory.Forest]::GetForest((New-Object System.DirectoryServices.ActiveDirectory.DirectoryContext(‘Forest’, $ForestRootDomain)))).GetAllTrustRelationships()

([System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()).GetAllTrustRelationships()

[System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest().GlobalCatalogs

Get-ADUser -filter {AdminCount -eq 1} -Properties Name,AdminCount,ServicePrincipalName,PasswordLastSet,LastLogonDate,MemberOf

# When not on the network
