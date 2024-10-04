## Set-ExecutionPolicy Ubegrænset

Set-ExecutionPolicy Unrestricted

## ser hvad Server heder 

hostname

## Give Server et nyt navn  

Rename-Computer DC2

## Se Netadapter så -InterfaceIndex kan sættes 

Get-NetAdapter

## Sætte Static IP / Gateway

New-NetIPAddress -InterfaceIndex 4  -IPAddress 192.168.51.133 -PrefixLength 28 -DefaultGateway 192.168.51.34

## Sætte Static DNS

Set-DnsClientServerAddress -InterfaceIndex 4 -ServerAddresses ("192.168.51.133","192.168.51.132")

## se den ip Static IP, Gateway og DNS

ipconfig /all  

## Genstart PC

Restart-Computer -Force

## meld ind i domæne og genstart PC  er bruger administrator Passeword P@ssw0rd

Add-Computer -DomainName gruppe1.datamek.dk -Restart  


## installere DNS

Install-windowsfeature -name DNS -IncludeAllSubFeature -IncludeManagementTools

## installere AD-Domain-Services

Install-windowsfeature -name AD-Domain-Services -IncludeAllSubFeature -IncludeManagementTools 
 
## installere ADDSDeployment Module

Import-Module ADDSDeployment 


## installere DHCP Værktøjer

Add-WindowsFeature –IncludeManagementTools DHCP

## Set om DHCP Module

Get-Command -Module DHCPServer

## Add DHCP add security groups:

Netsh DHCP Add SecurityGroups

Add-DhcpServerSecurityGroup

## Genstart DHCPServer service. 

Restart-Service DHCPServer

## Godkend DHCP-serveren i AD DS

Add-DHCPServerinDC 192.168.51.133


## Tilføj DHCP Scope

Add-DhcpServerV4Scope -Name "Vlan10" -Description "Scope 1 ip addr "-StartRange 192.168.51.9 -EndRange 192.168.51.44 -SubnetMask 255.255.255.192

Add-DhcpServerV4Scope -Name "Vlan20" -Description "Scope 2 ip addr "-StartRange 192.168.51.75 -EndRange 192.168.51.110 -SubnetMask 255.255.255.192

Add-DhcpServerV4Scope -Name "Vlan30" -Description "Scope 3 ip addr "-StartRange 192.168.51.135 -EndRange 192.168.51.140 -SubnetMask 255.255.255.240

Add-DhcpServerV4Scope -Name "Vlan50" -Description "Scope 5 ip addr "-StartRange 192.168.10.140 -EndRange 192.168.10.150 -SubnetMask 255.255.255.128

## Hvis scope  der er på DC

Get-DhcpServerV4Scope 

## Installation af IIS Værktøjer

Install-WindowsFeature -name Web-Server -IncludeManagementTools


## Installation af File server 

Install-WindowsFeature File-Services


## Installation af File Server  Resource Manager

Install-WindowsFeature -Name FS-Resource-Manager, RSAT-FSRM-Mgmt

## Install Printer og Dokument Services 

Install-WindowsFeature Print-Services

# Tilføj et nyt domæne i en eksisterende skov password P@ssw0rd

Install-ADDSDomainController -DomainName gruppe1.datamek.dk


## se den ip Static IP, Gateway og DNS

ipconfig /all  



