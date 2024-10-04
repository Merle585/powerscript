## Åben Powershell som administrator

Set-ExecutionPolicy Unrestricted

##PC_01 

## se ved klinet heder 

hostname

## Give klinet et ny navn 
 
Rename-Computer PC1

## genstart PC   

Restart-Computer -Force

## meld ind i domæne og genstart PC  

add-computer –domainname gruppe1.datamek.dk -restart –force 

#####################################################################################################

##PC_02

## Give klinet et ny navn 
 
Rename-Computer PC2

## genstart PC   

Restart-Computer -Force

## meld ind i domæne og genstart PC  

add-computer –domainname gruppe1.datamek.dk -restart –force  

#####################################################################################################

##LaerPC_03

## Give klinet et ny navn 
 
Rename-Computer PC3

## genstart PC 

Restart-Computer -Force

## Se Netadapter så -InterfaceIndex kan sættes 

Get-NetAdapter

## Sætte Static IP / Gateway

New-NetIPAddress -InterfaceIndex 2 -IPAddress 192.168.10.4 -PrefixLength 26 -DefaultGateway 192.168.10.1

#####################################################################################################

##GaestPC_04

## Give klinet et ny navn 
 
Rename-Computer PC4

## genstart PC   

Restart-Computer -Force







 


