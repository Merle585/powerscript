﻿## Set-ExecutionPolicy Unrestricted

#######################################################################
## Import PSWindowsUpdate PSWindowsUpdate

## Lisk: https://pureinfotech.com/install-windows-10-update-powershell/


## Install module PSWindowsUpdate 
##Install-Module PSWindowsUpdate

## See WindowsUpdate CMD
##Get-WindowsUpdate

## Get all windows update module cmd 
##Get-Command -Module PSWindowsUpdate

## Update Windows 
##Install-WindowsUpdate

#######################################################################

## install winget 

$source ='https://github.com/microsoft/winget-cli/releases/download/v1.4.10173/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'
$destination = 'C:\Users\$Env:USERNAME\Downloads\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'
Start-BitsTransfer -Source $source -Destination $destination
start C:\Users\test_w10_01\Downloads\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle

#Pause for 120 seconds per loop
## Link: https://lazyadmin.nl/powershell/start-sleep/
Do {
    # Do stuff
    # Sleep 120 seconds
    Start-Sleep -s 120
}
while ($condition -eq $true)


## install from winget åber microsoft store og søg efter app installer eller winget 

## install Google-Chrome

winget install Google.Chrome --accept-source-agreements --accept-package-agreements 

## install Google-Drive

winget install Google.Drive --accept-source-agreements --accept-package-agreements 

## install bitwarden 

winget install Bitwarden.Bitwarden --accept-source-agreements --accept-package-agreements

## install 7.Zip

winget install 7zip.7zip --accept-source-agreements --accept-package-agreements

## install VideoLAN.VLC

winget install  VideoLAN.VLC  --accept-source-agreements --accept-package-agreement  

## install ONLYOFFICE

$source ='https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v7.3.0/DesktopEditors_x64.exe'
$destination = 'C:\Users\$Env:USERNAME\Downloads\DesktopEditors_x64.exe'
Start-BitsTransfer -Source $source -Destination $destination

start C:\Users\cli\Downloads\DesktopEditors_x64.exe
  

#######################################################################

## uninstall from winget 

## Microsoft Tips                       

winget uninstall Microsoft.Getstarted_8wekyb3d8bbwe 

## Paint 3D                              

winget uninstall Microsoft.MSPaint_8wekyb3d8bbwe

## WindowsMaps

winget uninstall Microsoft.WindowsMaps_8wekyb3d8bbwe

##  Films & TV

winget uninstall  Microsoft.ZuneVideo_8wekyb3d8bbwe

## Uninstall 3D viewer
winget uninstall 9NBLGGH42THS

## Uninstall Disney+

winget uninstall Disney+



#######################################################################

## uninstall from PowerShell 

## Uninstall Xbox Live 

Get-AppxPackage | select Name, PackageFullName | Format-List
 
Get-AppxPackage *xbox* | Remove-AppxPackage 
 
## From <https://www.majorgeeks.com/content/page/how_to_uninstall_the_game_bar_in_windows_10.html>  
 
## Uninstall Cortana 
 
Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage

## Uninstall Camera
 
Get-AppxPackage Microsoft.camera -AllUsers | Remove-AppxPackage 

## Uninstall weather

Get-AppxPackage *BingWeather* | Remove-AppxPackage
 
## Uninstall Maps 

Get-AppxPackage *maps* | Remove-AppxPackage 

## uninstall the people app 

Get-AppxPackage *Microsoft.People* -AllUsers | Remove-AppxPackage

##  uninstall  get-help 

Get-AppxPackage *Microsoft.GetHelp* -AllUsers | Remove-AppxPackage

## Uninstall XboxGamingOverlay

Get-AppxPackage Microsoft.XboxGamingOverlay | Remove-AppxPackage


## Uninstall Mail and Calendar

Get-Appxpackage *microsoft.windowscommunicationsapps* | Remove-appxpackage

## Uninstall FeedbackHub

Get-AppxPackage Microsoft.WindowsFeedbackHub| Remove-AppxPackage

## Uninstall Skype
Get-AppxPackage *SkypeApp* | Remove-AppxPackage

## Uninstall Solitaire Collection
Get-AppxPackage *MicrosoftSolitaireCollection* | Remove-AppxPackage

## Uninstall Sticky Notes	
Get-AppxPackage *MicrosoftStickyNotes* | Remove-AppxPackage

## Uninstall Music app	
Get-AppxPackage *ZuneMusic* | Remove-AppxPackage

## uninstall Mixed Reality Portal
Get-AppxPackage Microsoft.MixedReality.Portal | Remove-AppxPackage

## Uninstall Spotify
Get-AppxPackage *SpotifyAB.SpotifyMusic* | Remove-AppxPackage

## enable

## enable hyper-v 

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

## enable linux subsystem 

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux


Restart-Computer 


