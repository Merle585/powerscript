## Hyper_V install windows server16.

Get-Help update 

#InternalSwitch 

New-VMSwitch -Name ex -SwitchType External

# server19: password P@ssw0rd

New-VM -Name "server16" -MemoryStartupBytes 16384mb -Generation 2 -Path D:\Hyper\server16 -NewVHDPath D:\Hyper\server16\server16.vhdx -NewVHDSizeBytes 125GB 

Set-VM -Name "server16" -ProcessorCount 4

Add-VMDvdDrive -VMName "server16" -Path D:\iso_folder\server-2016.ISO


## Dynamic resource provisioning and secured file sharing using virtualization

Get-VM  

vmconnect localhost "server16" /edit


## add Hard disk E drive for file server 
  
Get-Help New-vhd -Detailed

Get-Help New-VHD -full

Get-Help New-VirtualDisk -Detailed


New-VHD -Path D:\Hyper\server16\server16_E_drive.vhdx -SizeBytes 125Gb -Dynamic

Add-VMHardDiskDrive -VMName server16 -Path D:\Hyper\server16\server16_E_drive.vhdx



 

## Checkpoint

## Link: https://www.thomasmaurer.ch/2020/07/how-to-manage-hyper-v-vm-checkpoints-with-powershell/

Checkpoint-Vm -Name "server16" -SnapshotName "server16_before_Domain_module_is_Installet" 

Get-VMCheckpoint "server16"


## aften install of AD

Checkpoint-Vm -Name "server16" -SnapshotName "server16_Domain_module_is_Installet" 

Get-VMCheckpoint "server16"

## Export VM 

Get-VM

Export-VM  -Path D:\Hyper\Export\ServerAfterInstallForADDS  -Name 'server19' 


## import VM 

## import vm and keep the exacttly where they are 

Import-VM -Path C:\Users\ic\Documents\hyper_v\Export_02\test\Virtual Machines\DE5C7D36-EA19-4BB4-A3C8-3DA1C1F6BD61.vmcx 


## import vm copy and the files to are default locations (VHDs may be put in a directly locations in the configured locations)

Import-VM -Path C:\Users\ic\Documents\hyper_v\Export_02\test\Virtual Machines\DE5C7D36-EA19-4BB4-A3C8-3DA1C1F6BD61.vmcx -copy


## import vm copy and the files to are default locations (specify a locations for the disk files)

Import-VM -Path 'C:\Users\IC\Documents\hyper_v\Export_02\test\Virtual Machines\DE5C7D36-EA19-4BB4-A3C8-3DA1C1F6BD61.vmcx' -Copy -VhdDestinationPath C:\Users\ic\Documents\hyper_v\server-16

## Set NetAdapter

Set-NetAdapter -Name server-16 -SwitchName Internal

############################################################################

## AD install / config 


## update Get-Help

Get-Help update 


## Set-ExecutionPolicy 

Set-ExecutionPolicy Unrestricted



## Install google-chrome 

## https://www.ryadel.com/en/install-google-chrome-with-powershell-script/

$LocalTempDir = $env:TEMP; $ChromeInstaller = "ChromeInstaller.exe"; (new-object System.Net.WebClient).DownloadFile('http://dl.google.com/chrome/install/375.126/chrome_installer.exe', "$LocalTempDir\$ChromeInstaller"); & "$LocalTempDir\$ChromeInstaller" /silent /install; $Process2Monitor =  "ChromeInstaller"; Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound)


## update server 

##Date Windows

## Install module PSWindowsUpdate 

Install-Module PSWindowsUpdate

## See WindowsUpdate CMD

Get-WindowsUpdate

## Get all windows update module cmd 

Get-Command -Module PSWindowsUpdate

## Update Windows 

Install-WindowsUpdate

## Give Server et nyt navn  

Rename-Computer DC1


## get Netadapter -InterfaceIndex (ifIndex status) 

Get-NetAdapter


## set Static IP / Gateway

New-NetIPAddress -InterfaceIndex 4 -IPAddress 192.168.51.132 -PrefixLength 28 -DefaultGateway 192.168.51.130


## set Static DNS

Set-DnsClientServerAddress -InterfaceIndex 4 -ServerAddresses ("192.168.51.132","192.168.51.133")

## se den ip Static IP, Gateway og DNS

ipconfig /all  


## Restart PC

Restart-Computer -Force


## Install DNS Værktøjer

Install-windowsfeature -name DNS -IncludeAllSubFeature -IncludeManagementTools

Get-Command -Module DNSserver


## Install AD-Domain-Services

Install-windowsfeature -name AD-Domain-Services -IncludeAllSubFeature -IncludeManagementTools 
 

## Install ADDSDeployment Module

Import-Module ADDSDeployment 

Get-Command -Module ADDSDeployment


## Instal DHCP Værktøjer

Add-WindowsFeature –IncludeManagementTools DHCP


## Set up  DHCP Module

Get-Command -Module DHCPServer


#Create the security groups:

Netsh DHCP Add SecurityGroups

Add-DhcpServerSecurityGroup

#Restart the service. 

Restart-Service DHCPServer


## setup domæne name test.local password is P@ssw0rd

Install-ADDSForest -DomainName test.local


## setup  DHCP-serveren i AD DS

Add-DHCPServerinDC 192.168.51.132


## setup DHCP Scope

Add-DhcpServerV4Scope -Name "Vlan10" -Description "Scope 1 ip addr "-StartRange 192.168.51.9 -EndRange 192.168.51.44 -SubnetMask 255.255.255.192

Add-DhcpServerV4Scope -Name "Vlan20" -Description "Scope 2 ip addr "-StartRange 192.168.51.75 -EndRange 192.168.51.110 -SubnetMask 255.255.255.192

Add-DhcpServerV4Scope -Name "Vlan30" -Description "Scope 3 ip addr "-StartRange 192.168.51.135 -EndRange 192.168.51.140 -SubnetMask 255.255.255.240

Add-DhcpServerV4Scope -Name "Vlan50" -Description "Scope 5 ip addr "-StartRange 192.168.10.140 -EndRange 192.168.10.150 -SubnetMask 255.255.255.128


## Hvis scope  der er på DC

Get-DhcpServerV4Scope 


## install IIS tooles

Install-WindowsFeature -name Web-Server -IncludeManagementTools


## install File server and documents 

Install-WindowsFeature File-Services


## install File Server  Resource Manager

Install-WindowsFeature -Name FS-Resource-Manager, RSAT-FSRM-Mgmt


## Install Printer and Docmens Services 

Install-WindowsFeature Print-Services


## set static DNS again  APIA after restart.


## se den ip Static IP, Gateway og DNS

ipconfig /all 


## get Netadapter -InterfaceIndex (ifIndex status) 

Get-NetAdapter
  

Set-DnsClientServerAddress -InterfaceIndex 4 -ServerAddresses ("192.168.51.132","192.168.51.133")


## se den ip Static IP, Gateway og DNS

ipconfig /all  


###############################################################################################################################################################


## Add foldes 

mkdir E:\RoamingProfile
mkdir E:\Software 
mkdir E:\Home
mkdir E:\Firma1\web
mkdir E:\Firma1\Administratoropgaver
mkdir E:\Firma1\Ledelse
mkdir E:\Firma1\Bestyrelsmøde
mkdir E:\Firma1\Repsedler
mkdir E:\Firma1\Elever
mkdir E:\Firma1\Personaleforening
mkdir E:\Firma1\VærksFørere
mkdir E:\Firma1\SalgIndkøb
mkdir E:\Firma1\Manualer
mkdir E:\Firma1\Progammer
mkdir E:\Firma1\PersonalSager
mkdir E:\Firma1\Afdelinger\Administrator
mkdir E:\Firma1\Afdelinger\Indkøb
mkdir E:\Firma1\Afdelinger\IT
mkdir E:\Firma1\Afdelinger\Salg
mkdir E:\Firma1\Afdelinger\Diretion
mkdir E:\Firma1\Afdelinger\Personale
mkdir E:\Firma1\Afdelinger\Økonomi
mkdir E:\Firma1\Afdelinger\Produktionsafdeling
mkdir E:\Firma1\Afdelinger\Produktionsafdeling\Lager
mkdir E:\Firma1\Afdelinger\Produktionsafdeling\Produktions
mkdir E:\Firma1\Afdelinger\Produktionsafdeling\Reparation




##############################################################################################

## New Objest - Orgenizational Unit 

## Link: https://theitbros.com/active-directory-organizational-unit-ou/

New-ADOrganizationalUnit -Name "Firma1"

## New Objest - Orgenizational Unit in to existing container,

New-ADOrganizationalUnit -Name "Web" -Path "OU=Firma1,DC=test,DC=local" –PassThru

New-ADOrganizationalUnit -Name "Drietion" -Path "OU=Firma1,DC=test,DC=local" –PassThru

New-ADOrganizationalUnit -Name "Direktor" -Path "OU=Drietion,OU=Firma1,DC=test,DC=local" –PassThru

New-ADOrganizationalUnit -Name "Sekreter" -Path "OU=Drietion,OU=Firma1,DC=test,DC=local" –PassThru

New-ADOrganizationalUnit -Name "Salgafdeling" -Path "OU=Firma1,DC=test,DC=local" –PassThru

New-ADOrganizationalUnit -Name "Indkobafdeling" -Path "OU=Firma1,DC=test,DC=local" –PassThru

New-ADOrganizationalUnit -Name "Personaleadeling" -Path "OU=Firma1,DC=test,DC=local" –PassThru

New-ADOrganizationalUnit -Name "Produkionsafdelen" -Path "OU=Firma1,DC=test,DC=local" –PassThru

New-ADOrganizationalUnit -Name "Produkionschef" -Path "OU=Produkionsafdelen,OU=Firma1,DC=test,DC=local" –PassThru

New-ADOrganizationalUnit -Name "Produkions" -Path "OU=Produkionsafdelen,OU=Firma1,DC=test,DC=local" –PassThru

New-ADOrganizationalUnit -Name "Reparation" -Path "OU=Produkionsafdelen,OU=Firma1,DC=test,DC=local" –PassThru

New-ADOrganizationalUnit -Name "Lager" -Path "OU=Produkionsafdelen,OU=Firma1,DC=test,DC=local" –PassThru

New-ADOrganizationalUnit -Name "okonmiafdelen" -Path "OU=Firma1,DC=test,DC=local" –PassThru

New-ADOrganizationalUnit -Name "Administrator-afd" -Path "OU=Firma1,DC=test,DC=local" –PassThru

New-ADOrganizationalUnit -Name "IT-afdeling" -Path "OU=Firma1,DC=test,DC=local" –PassThru

New-ADOrganizationalUnit -Name "Computer" -Path "OU=Firma1,DC=test,DC=local" –PassThru

New-ADOrganizationalUnit -Name "Grupper" -Path "OU=Firma1,DC=test,DC=local" –PassThru

New-ADOrganizationalUnit -Name "Domain-local" -Path "OU=Grupper,OU=Firma1,DC=test,DC=local" –PassThru

New-ADOrganizationalUnit -Name "Global" -Path "OU=Grupper,OU=Firma1,DC=test,DC=local" –PassThru

######################################################################################################################

## Add New Object - Group / GroupScope Global

Import-Module ActiveDirectory 


## Add GroupScope DomainLocal

## Global

New-ADGroup "G_Web" -Path "OU=Global,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope Global -PassThru –Verbose

New-ADGroup "G_Drietion" -Path "OU=Global,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope Global -PassThru –Verbose

New-ADGroup "G_Direktor" -Path "OU=Global,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope Global -PassThru –Verbose

New-ADGroup "G_Sekreter" -Path "OU=Global,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope Global -PassThru –Verbose

New-ADGroup "G_Salgafdeling" -Path "OU=Global,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope Global -PassThru –Verbose

New-ADGroup "G_Indkobafdeling" -Path "OU=Global,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope Global -PassThru –Verbose

New-ADGroup "G_Personaleadeling" -Path "OU=Global,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope Global -PassThru –Verbose

New-ADGroup "G_Produkionsafdelen" -Path "OU=Global,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope Global -PassThru –Verbose

New-ADGroup "G_Produkionschef" -Path "OU=Global,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope Global -PassThru –Verbose

New-ADGroup "G_Reparation" -Path "OU=Global,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope Global -PassThru –Verbose

New-ADGroup "G_Lager" -Path "OU=Global,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope Global -PassThru –Verbose

New-ADGroup "G_okonmiafdelen" -Path "OU=Global,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope Global -PassThru –Verbose

New-ADGroup "G_Administrator-afd" -Path "OU=Global,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope Global -PassThru –Verbose

New-ADGroup "G_IT-afdeling" -Path "OU=Global,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope Global -PassThru –Verbose

New-ADGroup "G_Computer" -Path "OU=Global,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope Global -PassThru –Verbose


## Domain local

New-ADGroup "DL_Web_RX" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose

New-ADGroup "DL_Web_M" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose 

New-ADGroup "DL_Drietion_RX" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose

New-ADGroup "DL_Drietion_M" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_Direktor_RX" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_Direktor_M" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_Sekreter_RX" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_Sekreter_M" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_Salgafdeling_RX" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_Salgafdeling_M" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_Indkobafdeling_RX" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_Indkobafdeling_M" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_Personaleadeling_RX" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_Personaleadeling_M" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_Produkionsafdelen_RX" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_Produkionsafdelen_M" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose  

New-ADGroup "DL_Produkionschef_RX" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_Produkionschef_M" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose     

New-ADGroup "DL_Reparation_RX" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_Reparation_M" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_Lager_RX" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_Lager_M" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_okonmiafdelen_RX" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_okonmiafdelen_M" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_Administrator-afd_RX" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose                                                

New-ADGroup "DL_Administrator-afd_M" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_IT-afdeling_RX" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_IT-afdeling_M" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_Computer_RX" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    

New-ADGroup "DL_Computer_M" -Path "OU=Domain-local,OU=Grupper,OU=Firma1,DC=test,DC=local" -GroupCategory Security -GroupScope DomainLocal -PassThru –Verbose    
 

## Create OU 

Get-ADOrganizationalUnit -Filter 'Name -like "*"' | Format-Table Name, DistinguishedName -A


######################################################################################################################


## Add Users

## Creating AD Users from CSV with Powershell | ServerAcademy.com
## Link: https://www.youtube.com/watch?v=9WAcQE-Q9xo&ab_channel=ServerAcademy

## New-ADUser

## Link https://learn.microsoft.com/en-us/powershell/module/activedirectory/new-aduser?view=windowsserver2022-ps

## Import required modules 

Import-Module ActiveDirectory

## Prompt user for CSV file pathe

$filepath = Read-Host -Prompt "Enter the path to CSV file"

## Import file into into a variable

$Users = Import-Csv $filepath

## Loop Through eash row and gathar information 

ForEach ($user in $users) {
    

    # Gather the user`s information

    $Fullname = $user. 'Name'
    $Fname = $user. 'First Name'
    $Lname = $user. 'Last Name'
    $Logname = $user. 'Login Name'  
    $Uname = $user. 'User Name'
    $Jtittle = $user.'Job Title'
    $Dname = $user.'Display Name'
    $desciper = $user. 'Description'
    $email = $user.'Email'
    $OUpath = $user.'Organizational Unit'
    $secpasswd = $user.'Password'

    # Create New Ad User for each user in CSV file. Password is P@ssw0rd

    New-ADUser -Name "$Fullname" -GivenName "$Fname" -Surname "$Lname" -UserPrincipalName "$Logname" -DisplayName "$Dname" -EmailAddress "$email" -Path "$OUpath" -Description "$desciper" -Accountpassword (Read-Host -AsSecureString "$secpasswd") -ChangePasswordAtLogon $false -Enabled $true
   
    
     # -ChangePasswordAtLogon $false -Enabled $true

    echo "Account created for $Fullname $OUpath"

    ## For testing 

    # echo $Fullname $Fname $Lname $Logname $Uname $Jtittle $Dname $desciper $email $OUpath  $password
}


######################################################################################################################
 
 ## windows 10 client VM

 # windows10: password P@ssw0rd

New-VM -Name "windows10" -MemoryStartupBytes 8192mb -Generation 2 -Path D:\Hyper\windows10 -NewVHDPath D:\Hyper\windows10\windows10.vhdx -NewVHDSizeBytes 125GB 

Set-VM -Name "windows10" -ProcessorCount 2

Add-VMDvdDrive -VMName "windows10" -Path D:\iso_folder\enterprise.iso

Set-NetAdapter -Name "windows10" -SwitchName Internal


######################################################################################################################

##PC_01 

Set-ExecutionPolicy Unrestricted


## se ved klinet heder 

hostname

## Give klinet et ny navn 
 
Rename-Computer PC1

## update server 

##Date Windows

## Install module PSWindowsUpdate 

Install-Module PSWindowsUpdate

## See WindowsUpdate CMD

Get-WindowsUpdate

## Get all windows update module cmd 

Get-Command -Module PSWindowsUpdate

## Update Windows 

Install-WindowsUpdate

## genstart PC   

Restart-Computer -Force

## meld ind i domæne og genstart PC  

add-computer –domainname test.local -restart –force 





