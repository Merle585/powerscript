## Set ExecutionPolicy Unrestricted

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

#######################################################################

## Import PSWindowsUpdate PSWindowsUpdate

## install packkage Nuget

Install-PackageProvider Nuget –Force

## Install module PSWindowsUpdate 

Install-Module -Name PSWindowsUpdate –Force

## See WindowsUpdate CMD
Get-WindowsUpdate

## Get all windows update module cmd 
Get-Command -Module PSWindowsUpdate  

## Update Windows 
Install-WindowsUpdate -AcceptAll

## update Get-help 

Get-Help update

##############################################################

## Sæt VM Network Adapter To Config vm ser i file DC1_DC_02_win_server_Hyper_V_config_file.ps1 
## Line 40: VM Network Adapter To Config vm 


##############################################################

## Give Server et nyt navn 

Rename-Computer DC1

## Se Netadapter så -InterfaceIndex kan sættes 

Get-NetAdapter

## Sætte Static IP / Gateway

New-NetIPAddress -InterfaceIndex 4 -IPAddress 192.168.51.132 -PrefixLength 28 -DefaultGateway 192.168.51.130

## Sætte Static DNS

Set-DnsClientServerAddress -InterfaceIndex 4 -ServerAddresses ("192.168.51.132","192.168.51.133")

## se den ip Static IP, Gateway og DNS

ipconfig /all  

## Genstart PC

Restart-Computer -Force

#######################################################################

## installere DNS

Install-windowsfeature -name DNS -IncludeAllSubFeature -IncludeManagementTools

## installere AD-Domain-Services

Install-windowsfeature -name AD-Domain-Services -IncludeAllSubFeature -IncludeManagementTools 
 
## installere ADDSDeployment Module

Import-Module ADDSDeployment 

## Lave domæne nave gruppe1.datamek.dk og password er P@ssw0rd

Install-ADDSForest -DomainName gruppe1.datamek.dk

## Sætte Static DNS

Set-DnsClientServerAddress -InterfaceIndex 4 -ServerAddresses ("192.168.51.132","192.168.51.133")

## se den ip Static IP, Gateway og DNS

ipconfig /all 

##############################################################

## Enable Remote Desktop:

Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0

Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

## Add users to localgroup Remote Desktop Users

net localgroup "Remote Desktop Users" "Administrator" /add


## Disable Remote Desktop:

# Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 1

# Disable-NetFirewallRule -DisplayGroup "Remote Desktop"

##############################################################

## Install and config DC_2/File_server