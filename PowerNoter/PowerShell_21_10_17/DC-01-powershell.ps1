## Rename-Computer 

# link : https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/rename-computer?view=powershell-7.1

hostname

Rename-Computer "Name"


## Setting Static IP:

Get-NetAdapter

New-NetIPAddress -InterfaceIndex 13 -IPAddress 192.168.82.2 -PrefixLength 24 -DefaultGateway 192.168.82.1 

ipconfig 

## Add Active Directory Domain Services (AD DS) with PowerShell

# link : https://thecloudeh.com/2011/06/17/add-active-directory-domain-services-ad-ds-with-powershell/

Get-WindowsFeature

Install-windowsfeature -name AD-Domain-Services -IncludeManagementTools

Install-WindowsFeature -Name dhcp 

## Restart computer 

Restart-Computer -Force

## Active Directory environment using PowerShell

# link: https://social.technet.microsoft.com/wiki/contents/articles/52765.windows-server-2019-step-by-step-setup-active-directory-environment-using-powershell.aspx

Install-ADDSForest 
 
