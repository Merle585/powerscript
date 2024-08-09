##Date Windows

## Install module PSWindowsUpdate 
Install-Module PSWindowsUpdate

## See WindowsUpdate CMD
Get-WindowsUpdate

## Get all windows update module cmd 
Get-Command -Module PSWindowsUpdate

## Update Windows 
Install-WindowsUpdate

###################################

## all info on computer
systeminfo
 
###################################

## rename computer 

Rename-Computer "PCNAME"

## INSTALL programmers  

## install dynabook Service Station

$source ='https://content.us.dynabook.com/content/support/downloads/Dynabook%20Service%20Station-TCH0635100A.exe'
$destination = 'C:\Users\*\Downloads\Dynabook Service Station-TCH0635100A.exe'
Start-BitsTransfer -Source $source -Destination $destination

## Install program .exe: 

start "C:\Users\$Env:USERNAME\Downloads\Dynabook Service Station-TCH0635100A.exe" /S


## install firefox 

winget install -e --id Mozilla.Firefox.ESR

# install chrome

winget install -e --id Google.Chrome

## install VLC

winget install -e --id VideoLAN.VLC

## install notepad++

winget install -e --id Notepad++.Notepad++

##  install onenote 

winget install onenote 


## install balenaEtcher

winget install balenaEtcher

## install Rufus 

 winget install 9PC3H3V7Q9CH --accept-source-agreements --accept-package-agreements



start C:\Down


## enable hyper-v 

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

## enable linux subsystem 

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

##  ubuntu on wsl 

## update wsl 

wsl --update 

wsl --install -d Ubuntu 

## remove / uninstall app 

## Uninstall Xbox Live 
 
Get-AppxPackage *xbox* | Remove-AppxPackage 
 
## From <https://www.majorgeeks.com/content/page/how_to_uninstall_the_game_bar_in_windows_10.html>  
 
##How to Remove/Uninstall Cortana 
 
Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage

##Camera
 
Get-AppxPackage Microsoft.camera -AllUsers | Remove-AppxPackage 

Get-AppxPackage *Microsoft.weather* -AllUsers | Remove-AppxPackage
 
##Maps 

Get-AppxPackage *maps* | Remove-AppxPackage 

 ## uninstall the people app 

Get-AppxPackage *Microsoft.People* -AllUsers | Remove-AppxPackage


##  uninstall  get-help 

Get-AppxPackage *Microsoft.GetHelp* -AllUsers | Remove-AppxPackage

 ##  XboxGamingOverlay

Get-AppxPackage Microsoft.XboxGamingOverlay | Remove-AppxPackage


