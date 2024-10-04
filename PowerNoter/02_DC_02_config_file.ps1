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

#######################################################################

## Sæt VM Network Adapter To Config vm ser i file DC1_DC_02_win_server_Hyper_V_config_file.ps1 
##line 65: VM Network Adapter To Config vm 

##############################################################


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


##############################################################

## meld ind i domæne og genstart PC  er bruger administrator Passeword P@ssw0rd

Add-Computer -DomainName gruppe1.datamek.dk -Restart  

##############################################################

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


##############################################################

## Disk_02 / E_Disk. 

## Format Disk fra CMD. "RUN AS Admin": 
#Diskpart 
#sel disk 1 
#clean 
#online disk
#create partition primary 
#format fs=ntfs
#assign letter=E

## Format Disk_02 / Disk_E:

Get-Disk | Format-Table -Auto

Initialize-Disk -Number 1 -PartitionStyle GPT

New-Partition -DiskNumber 1 -Size 124GB -DriveLetter E

Format-Volume -DriveLetter E -FileSystem NTFS -NewFileSystemLabel "DATA"

##############################################################

## Enable Remote Desktop:

Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0

Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

## Add users to localgroup Remote Desktop Users

net localgroup "Remote Desktop Users" "Administrator" /add


## Disable Remote Desktop:

# Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 1

# Disable-NetFirewallRule -DisplayGroup "Remote Desktop"









