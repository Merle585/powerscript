 
## Get All  ADOrganizationalUnit  

Get-ADOrganizationalUnit -Filter 'Name -like "*"' | Format-Table Name, DistinguishedName -A

# Get-ADGroup distinguishedname:

Get-ADGroup -Filter "Name -like '*'" | ft

## Get One ADOrganizationalUnit 

Get-ADOrganizationalUnit -Filter 'Name -like "OUName"' | Format-Table Name, DistinguishedName -A

Get-ADOrganizationalUnit -identity "OU=Member Computers,DC=Reinders,DC=local" | Set-ADObject -ProtectedFromAccidentalDeletion:$false -PassThru | Remove-ADOrganizationalUnit -Confirm:$false

## Get One ADOrganizationalUnit 

Get-ADOrganizationalUnit -Filter 'Name -like "Direktør"' | Format-Table Name, DistinguishedName -A

## Remove OU

# Get-ADOrganizationalUnit -identity "OU=Direktør,OU=Firma1,DC=gruppe1,DC=datamek,DC=dk" | Set-ADObject -ProtectedFromAccidentalDeletion:$false -PassThru | Remove-ADOrganizationalUnit -Confirm:$false

## Rename OU

# Rename-ADObject -Identity "OU=\ Sekretør,OU=\ Direktion,OU=Firma1,DC=gruppe1,DC=datamek,DC=dk" -NewName "Sekretær"

## List local groups

get-localgroup

## Remove localgroup

# get-adgroup -filter 'Name -like "G_Direktion *"' | remove-adgroup


# Get-ADGroup distinguishedname:

Get-ADGroup -Filter "Name -like '*'" | ft

#################################################################

## Create OU

## Link: https://learn.microsoft.com/en-us/powershell/module/activedirectory/new-adorganizationalunit?view=windowsserver2022-ps
 
#######################################################################

## Firma1 for all OU:

## OU Firma1

New-ADOrganizationalUnit -Name "Firma1" -Path "DC=gruppe1,DC=datamek,DC=dk"

#######################################################################

## Direktion for Direktør and Sekretør:

## OU Direktion:  Direktion, Direktør, and Sekretør:

New-ADOrganizationalUnit -Name "Direktion" -Path "OU=Firma1,DC=gruppe1,DC=datamek,DC=dk"

## OU Direktør

New-ADOrganizationalUnit -Name "Direktør" -Path "OU=\ Direktion,OU=Firma1,DC=gruppe1,DC=datamek,DC=dk"

## OU Sekretør:

New-ADOrganizationalUnit -Name "Sekretær" -Path "OU=\ Direktion,OU=Firma1,DC=gruppe1,DC=datamek,DC=dk"

#######################################################################


## OU Salgafdeling:

New-ADOrganizationalUnit -Name "Salgafdeling" -Path "OU=Firma1,DC=gruppe1,DC=datamek,DC=dk"

#######################################################################

## OU Indkøbafdeling:

New-ADOrganizationalUnit -Name "Indkøbafdeling" -Path "OU=Firma1,DC=gruppe1,DC=datamek,DC=dk"

#######################################################################

## OU Personaleadeling:

New-ADOrganizationalUnit -Name "Personaleadeling" -Path "OU=Firma1,DC=gruppe1,DC=datamek,DC=dk"

#######################################################################

## Produkionsafdelen for Produkionschef, Produkions, Reparation and Lager:

## OU Produkionsafdelen:

New-ADOrganizationalUnit -Name "Produkionsafdelen" -Path "OU=Firma1,DC=gruppe1,DC=datamek,DC=dk"

## OU Produkionschef:

New-ADOrganizationalUnit -Name "Produkionschef" -Path "OU=Firma1,DC=gruppe1,DC=datamek,DC=dk"

## OU Produkions:

New-ADOrganizationalUnit -Name "Produkions" -Path "OU=Firma1,DC=gruppe1,DC=datamek,DC=dk"

## OU Reparation:

New-ADOrganizationalUnit -Name "Reparation" -Path "OU=Firma1,DC=gruppe1,DC=datamek,DC=dk"

## OU Lager:

New-ADOrganizationalUnit -Name "Lager" -Path "OU=Firma1,DC=gruppe1,DC=datamek,DC=dk"

#######################################################################

## OU Økonmiafdelen: 

New-ADOrganizationalUnit -Name "Økonmiafdelen" -Path "OU=Firma1,DC=gruppe1,DC=datamek,DC=dk"

#######################################################################

## OU Administrator_Afd:

New-ADOrganizationalUnit -Name "Administrator_Afd" -Path "OU=Firma1,DC=gruppe1,DC=datamek,DC=dk"

#######################################################################

## OU IT_afdeling:

New-ADOrganizationalUnit -Name "IT_afdeling" -Path "OU=Firma1,DC=gruppe1,DC=datamek,DC=dk"

#######################################################################

## Computer: 

New-ADOrganizationalUnit -Name "Computer" -Path "OU=Firma1,DC=gruppe1,DC=datamek,DC=dk"

#######################################################################

## Grupper for Domain local and Global:

## OU Grupper:

New-ADOrganizationalUnit -Name "Grupper" -Path "OU=Firma1,DC=gruppe1,DC=datamek,DC=dk"

## OU Domain_local

New-ADOrganizationalUnit -Name "Domain_local" -Path " OU=Grupper,OU=Firma1,DC=gruppe1,DC=datamek,DC=dk"

## OU Global:

New-ADOrganizationalUnit -Name "Global" -Path " OU=Grupper,OU=Firma1,DC=gruppe1,DC=datamek,DC=dk"

#######################################################################