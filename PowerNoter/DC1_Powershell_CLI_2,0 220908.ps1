## Set-ExecutionPolicy Ubegrænset 

Set-ExecutionPolicy Unrestricted

## ser hvad Server heder 

hostname

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












 


