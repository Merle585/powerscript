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

## install danabook Service Station

wget https://content.us.dynabook.com/content/support/downloads/Dynabook%20Service%20Station-TCH0635100A.exe

## install firefox 

$SourceURL = "https://download.mozilla.org/?product=firefox-msi-latest-ssl&os=win64&lang=en-US";
$Installer = $env:TEMP + "\firefox.exe";
Invoke-WebRequest $SourceURL -OutFile $Installer;
Start-Process -FilePath $Installer -Args "/s" -Verb RunAs -Wait;
Remove-Item $Installer;

# install chrome

$LocalTempDir = $env:TEMP; $ChromeInstaller = "ChromeInstaller.exe"; (new-object System.Net.WebClient).DownloadFile('http://dl.google.com/chrome/install/375.126/chrome_installer.exe', "$LocalTempDir\$ChromeInstaller"); & "$LocalTempDir\$ChromeInstaller" /silent /install; $Process2Monitor = "ChromeInstaller"; Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound)

## install firefox 

winget install  Mozilla.Firefox

## enable linux subsystem 

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

##  ubuntu on wsl 

## update wsl 

wsl --update 

wsl --install -d Ubuntu 

## remove app 

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


## unistall 