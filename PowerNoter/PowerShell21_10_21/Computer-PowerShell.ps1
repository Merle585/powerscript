

Restart-Computer -Force

hostname

Rename-Computer "Name"

add-computer –domainname "YourDomainName"  -restart

## Setting Static IP:

Get-NetAdapter

New-NetIPAddress -InterfaceIndex 13 -IPAddress 192.168.82.2 -PrefixLength 24 -DefaultGateway 192.168.82.1 

ipconfig 

# Domain-Name

Get-ADDomain

Get-WMIObject Win32_ComputerSystem| Select-Object -ExpandProperty Domain



