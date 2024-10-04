## https://www.youtube.com/watch?v=cW9LOo755ys&t=201s
# Import AD Module

Import-Module ActiveDirectory

## SYNTAX Of AD User 

Get-Help New-ADUser

## Command AD Module

Get-Command -Module ActiveDirectory | more 

## Create OU 

Get-ADOrganizationalUnit -Filter 'Name -like "*"' | Format-Table Name, DistinguishedName -A

## Remove OU
 
Set-ADOrganizationalUnit "OU=IT w,DC=ic,DC=local" -ProtectedFromAccidentalDeletion $false

Remove-ADOrganizationalUnit -identity "OU=IT w,DC=ic,DC=local"

## Create AD User 

# New user  # username  # Fist Name      # last Name    # logoin Name                       # Display Name      # Email                           # OU Path                        # Password                                                                # Password Change At Logon
New-ADUser -Name "Kije" -GivenName "kim" -Surname "Jem" -UserPrincipalName "KiJe@ic.local" -DisplayName "kije" -EmailAddress "kije@ic.local.com" -Path "OU=test-OU,DC=ic,DC=local"  -AccountPassword (ConvertTo-SecureString "Vdoadd123" -AsPlaintext -Force) -ChangePasswordAtLogon $true -Enabled $true


## Remove AD Userad

Remove-ADUser -identity "name" -Confirm:$false 



