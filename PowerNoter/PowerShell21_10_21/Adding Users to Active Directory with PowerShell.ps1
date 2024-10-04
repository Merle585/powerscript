## https://www.youtube.com/watch?v=cW9LOo755ys&t=201s
# Import AD Module

Import-Module ActiveDirectory

## SYNTAX Of AD User 

Get-Help New-ADUser

## Command AD Module

Get-Command -Module ActiveDirectory | more 

## Create AD user 

# New user  # Full Name     # Fist Name      # last Name    # logoin Name                         # Display Name               # Email                     # Password                                                               # Password Change At Logon
New-ADUser -Name "Kim Jen" -GivenName "kim" -Surname "Jen" -UserPrincipalName "Kim Jen@ic.local" -DisplayName "kije" -Path "" -EmailAddress "kije@ic.com" -AccountPassword (ConvertTo-SecureString "Vdoadd123" -AsPlaintext -Force) -ChangePasswordAtLogon $true -Enabled $true

## Create OU 

New-ADOrganizationalUnit -Name "test-OU" 

Get-ADOrganizationalUnit -Filter 'Name -like "*"' | Format-Table Name, DistinguishedName -A
