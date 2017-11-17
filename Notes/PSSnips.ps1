# random snips

# When on the network

[System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest()

[System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()

$ForestRootDomain = (([System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()).Forest).Name
([System.DirectoryServices.ActiveDirectory.Forest]::GetForest((New-Object System.DirectoryServices.ActiveDirectory.DirectoryContext(‘Forest’, $ForestRootDomain)))).GetAllTrustRelationships()

([System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()).GetAllTrustRelationships()

[System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest().GlobalCatalogs

#List of admin accounts
Get-ADUser -filter {AdminCount -eq 1} -Properties Name,AdminCount,ServicePrincipalName,PasswordLastSet,LastLogonDate,MemberOf

# Get password policy for domain logged into
Get-ADFineGrainedPasswordPolicy -Filter *

# ADSI

#Get domain details
$domainname = $env:userdomain
#connect to the $domain
[ADSI]$domain = "WinNT://$domainname"
$domain | select *

$domain | Select @{Name="Name";Expression={$_.name.value}},
@{Name="PwdHistory";Expression={$_.PasswordHistoryLength.value}},
@{Name="MinPasswordAge";Expression={New-Timespan -seconds $_.MinPasswordAge.value}},
@{Name="MaxPasswordAge";Expression={New-Timespan -seconds $_.MaxPasswordAge.value}}

# Count of users groups and computers on domain.
$domain.children | group {$_.schemaclassname}

#####################
# Count of domain admins

$D = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
$Domain = [ADSI]"LDAP://$D"
$DN = $Domain.distinguishedName
$Admins = [ADSI]"LDAP://cn=Domain Admins,cn=Users,$DN"
"Members of " + $Admins.sAMAccountName

ForEach ($MemberDN In $Admins.Member){
    $Member = [ADSI]"LDAP://$MemberDN"
    "Pre-Windows 2000 logon name: " + $Member.sAMAccountName
    " Common Name: " + $Member.cn
    " Display Name: " + $Member.displayName
}

($Admins.Member).count

#################################



# When not on the network
