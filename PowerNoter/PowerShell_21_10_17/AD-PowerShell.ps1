##PowerShell create  users

## https://www.alitajran.com/create-active-directory-users-from-csv-with-powershell/


## Nothing up my sleeve

Get-WindowFeature -Name *rsat*


## Install the PowerShell bite 

Add-WindowsFeature -Name RSAT-AD-PowerShell

## see what`s in there 

Get-Command -Module ActiveDirectory | more 

## help New-ADUser

help New-ADUser

help NewADUser -Examples

## update Help 

update-Help

## create  users 

New-ADUser -Name test1 -OtherAttributes @{title-"janitor";mail "test1@tkdemo.com"} -AccountPassword (ConvertTo-SecureString "password123" -AsPlainText -Force) -Enabled $true

## Finde users 

Get-ADuser -Filter "*" | select name

## Get ActiveDirectory Module

Get-Module ActiveDirectory 

## Create OU 

New-ADOrganizationalUnit -Name "test-OU" 

## Import csv

Import-Csv C:\Temp\NewUsersFinal.csv -Delimiter ";" | Format-Table

## Run the Add-NewUsers PowerShell script

C:\>cd C:\Scripts\

C:\Scripts> .\Add-NewUsers.ps1




