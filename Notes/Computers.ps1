# random snips

# When on the network

[System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest()

[System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()

$ForestRootDomain = (([System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()).Forest).Name
([System.DirectoryServices.ActiveDirectory.Forest]::GetForest((New-Object System.DirectoryServices.ActiveDirectory.DirectoryContext(‘Forest’, $ForestRootDomain)))).GetAllTrustRelationships()

([System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()).GetAllTrustRelationships()

