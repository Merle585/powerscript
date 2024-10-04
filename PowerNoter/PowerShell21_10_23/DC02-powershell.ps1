## Rename-Computer 

# link : https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/rename-computer?view=powershell-7.1
# link: https://www.youtube.com/watch?v=IwVMik-VyrI&t=209s

hostname

Rename-Computer "Name"


## Setting Static IP:

Get-NetAdapter

New-NetIPAddress -InterfaceIndex 13 -IPAddress 192.168.82.102 -PrefixLength 24 -DefaultGateway 192.168.82.254

Set-DnsClientServerAddress -InterfaceIndex 13 -ServerAddresses 192.168.82.102

ipconfig /all   

## Add Active Directory Domain Services (AD DS) with PowerShell

# link : https://thecloudeh.com/2011/06/17/add-active-directory-domain-services-ad-ds-with-powershell/

## ADDS

Install-windowsfeature -name AD-Domain-Services -IncludeAllSubFeature -IncludeManagementTools 

Import-Module ADDSDeployment

Restart-Computer -Force

Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "WinThreshold" `
-DomainName "ic.local" `
-DomainNetbiosName "IC" `
-ForestMode "WinThreshold" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true

#DHCP role Installation

Add-WindowsFeature –IncludeManagementTools DHCP

Get-Command -Module DHCPServer

#Create the security groups:

Netsh DHCP Add SecurityGroups

Add-DhcpServerSecurityGroup

#Restart the service. 

Restart-Service DHCPServer

#Authorize the DHCP server in AD DS:

Add-DHCPServerinDC 192.168.82.102

## DNS

Install-windowsfeature -name DNS -IncludeAllSubFeature -IncludeManagementTools

#Add DHCP Scope

## link: https://www.youtube.com/watch?v=hPF3jP2IF7M

Add-DhcpServerV4Scope -Name "Scope 1" -Description "Scope 1 ip addr "-StartRange 192.168.82.100 -EndRange 192.168.82.254 -SubnetMask 255.255.255.0

Get-DhcpServerV4Scope

Remove-DhcpServerv4Scope -Name

## ExclusionRange 

Add-DhcpServerv4ExclusionRange 
# -ScopeId 192.168.82.0
# startRange: 192.168.82.100
# EndRange : 192.168.82.109
# 255.255.255.0

## DNS

Set-DhcpServerV4OptionValue -DnsServer 192.168.82.102 -Router 192.168.82.101

Set-DhcpServerv4Scope -ScopeId 192.168.82.0 -LeaseDuration 1.00:00:00

Get-DhcpServerv4ExclusionRange 

Remove-Get-DhcpServerv4ExclusionRange -Name 



 
