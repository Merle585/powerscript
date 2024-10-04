## Set-ExecutionPolicy Ubegrænset

Set-ExecutionPolicy Unrestricted

## ser hvad Server heder 

hostname

## Give Server et nyt navn  

Rename-Computer DC1

## Se Netadapter så -InterfaceIndex kan sættes 

Get-NetAdapter

## Sætte Static IP / Gateway

New-NetIPAddress -InterfaceIndex 2 -IPAddress 192.168.51.32 -PrefixLength 28 -DefaultGateway 192.168.51.34

## Sætte Static DNS

Set-DnsClientServerAddress -InterfaceIndex 2 -ServerAddresses ("192.168.51.32","192.168.51.33")

## se den ip Static IP, Gateway og DNS

ipconfig /all  

## Genstart PC

Restart-Computer -Force

## installere AD-Domain-Services

Install-windowsfeature -name AD-Domain-Services -IncludeAllSubFeature -IncludeManagementTools 
 
## installere ADDSDeployment Module

Import-Module ADDSDeployment 

## installere DNS

Install-windowsfeature -name DNS -IncludeAllSubFeature -IncludeManagementTools

## Lave domæne nave gruppe1.datamek.dk og password er P@ssw0rd

Install-ADDSForest 

## installere DHCP Værktøjer

Add-WindowsFeature –IncludeManagementTools DHCP

## Set om DHCP Module

Get-Command -Module DHCPServer
 
## Tilføj DHCP sikkerhedsgrupper:

Netsh DHCP Add SecurityGroups

Add-DhcpServerSecurityGroup

## Genstart DHCPServer service. 

Restart-Service DHCPServer

## Godkend DHCP-serveren i AD DS

Add-DHCPServerinDC 192.168.51.32


## Tilføj DHCP Scope

Add-DhcpServerV4Scope -Name "Vlan10" -Description "Scope 1 ip addr "-StartRange 192.168.51.9 -EndRange 192.168.51.44 -SubnetMask 255.255.255.192

Add-DhcpServerV4Scope -Name "Vlan20" -Description "Scope 2 ip addr "-StartRange 192.168.51.75 -EndRange 192.168.51.110 -SubnetMask 255.255.255.192

Add-DhcpServerV4Scope -Name "Vlan30" -Description "Scope 3 ip addr "-StartRange 192.168.51.135 -EndRange 192.168.51.140 -SubnetMask 255.255.255.240

Add-DhcpServerV4Scope -Name "Vlan50" -Description "Scope 3 ip addr "-StartRange 192.168.10.140 -EndRange 192.168.10.150 -SubnetMask 255.255.255.128


# Hvis scope  der er på DC

Get-DhcpServerV4Scope 









 


