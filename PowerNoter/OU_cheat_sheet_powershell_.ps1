 
## Get ADOrganizationalUnit All 

Get-ADOrganizationalUnit -Filter 'Name -like "*"' | Format-Table Name, DistinguishedName -A

## Get ADOrganizationalUnit One 

Get-ADOrganizationalUnit -Filter 'Name -like "OUName"' | Format-Table Name, DistinguishedName -A


## Remove OU

Get-ADOrganizationalUnit -identity "OU=Member Computers,DC=Reinders,DC=local" | Set-ADObject -ProtectedFromAccidentalDeletion:$false -PassThru | Remove-ADOrganizationalUnit -Confirm:$false

## Rename OU

Rename-ADObject -Identity "CN=HQ,CN=Sites,CN=Configuration,DC=FABRIKAM,DC=COM" -NewName "UnitedKingdomHQ"

## Create OU

## Link: https://learn.microsoft.com/en-us/powershell/module/activedirectory/new-adorganizationalunit?view=windowsserver2022-ps
 
New-ADOrganizationalUnit -Name "test" -Path "DC=gruppe1,DC=datamek,DC=dk"

