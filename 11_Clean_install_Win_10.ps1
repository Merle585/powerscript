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


#Pause for 60  seconds per loop
## Link: https://lazyadmin.nl/powershell/start-sleep/
Do {
    # Do stuff
    # Sleep 60 seconds
    Start-Sleep -s 60
}
while ($condition -eq $true)

#######################################################################

## update Microsoft stor 

Function WSUSUpdate {
$Criteria = "IsInstalled=0 and Type='Software'"
$Searcher = New-Object -ComObject Microsoft.Update.Searcher
try {
    $SearchResult = $Searcher.Search($Criteria).Updates
    if ($SearchResult.Count -eq 0) {
        Write-Output "There are no applicable updates."
        exit
    } 
    else {
        $Session = New-Object -ComObject Microsoft.Update.Session
        $Downloader = $Session.CreateUpdateDownloader()
        $Downloader.Updates = $SearchResult
        $Downloader.Download()
        $Installer = New-Object -ComObject Microsoft.Update.Installer
        $Installer.Updates = $SearchResult
        $Result = $Installer.Install()
    }
}
catch {
    Write-Output "There are no applicable updates."
    }
}

WSUSUpdate
If ($Result.rebootRequired) { Restart-Computer } 

#######################################################################

## Remove all the tiles in windows 10 start menu

#Requires -RunAsAdministrator

$START_MENU_LAYOUT = @"
<LayoutModificationTemplate xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout" xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout" Version="1" xmlns:taskbar="http://schemas.microsoft.com/Start/2014/TaskbarLayout" xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification">
    <LayoutOptions StartTileGroupCellWidth="6" />
    <DefaultLayoutOverride>
        <StartLayoutCollection>
            <defaultlayout:StartLayout GroupCellWidth="6" />
        </StartLayoutCollection>
    </DefaultLayoutOverride>
</LayoutModificationTemplate>
"@

$layoutFile="C:\Windows\StartMenuLayout.xml"

#Delete layout file if it already exists
If(Test-Path $layoutFile)
{
    Remove-Item $layoutFile
}

#Creates the blank layout file
$START_MENU_LAYOUT | Out-File $layoutFile -Encoding ASCII

$regAliases = @("HKLM", "HKCU")

#Assign the start layout and force it to apply with "LockedStartLayout" at both the machine and user level
foreach ($regAlias in $regAliases){
    $basePath = $regAlias + ":\SOFTWARE\Policies\Microsoft\Windows"
    $keyPath = $basePath + "\Explorer" 
    IF(!(Test-Path -Path $keyPath)) { 
        New-Item -Path $basePath -Name "Explorer"
    }
    Set-ItemProperty -Path $keyPath -Name "LockedStartLayout" -Value 1
    Set-ItemProperty -Path $keyPath -Name "StartLayoutFile" -Value $layoutFile
}

#Restart Explorer, open the start menu (necessary to load the new layout), and give it a few seconds to process
Stop-Process -name explorer
Start-Sleep -s 5
$wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys('^{ESCAPE}')
Start-Sleep -s 5

#Enable the ability to pin items again by disabling "LockedStartLayout"
foreach ($regAlias in $regAliases){
    $basePath = $regAlias + ":\SOFTWARE\Policies\Microsoft\Windows"
    $keyPath = $basePath + "\Explorer" 
    Set-ItemProperty -Path $keyPath -Name "LockedStartLayout" -Value 0
}

#Restart Explorer and delete the layout file
Stop-Process -name explorer

# Uncomment the next line to make clean start menu default for all new users
#Import-StartLayout -LayoutPath $layoutFile -MountPath $env:SystemDrive\

Remove-Item $layoutFile


#######################################################################


## Install winget 
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Install-Script -Name winget-install -Force
winget-install.ps1


#Pause for 60  seconds per loop
## Link: https://lazyadmin.nl/powershell/start-sleep/
Do {
    # Do stuff
    # Sleep 60 seconds
    Start-Sleep -s 60
}
while ($condition -eq $true)


## install from winget åber microsoft store og søg efter app installer eller winget 

## install termina priview 

winget install 9N8G5RFZ9XK3  -e --silent --accept-source-agreements --accept-package-agreements 

## install Google-Chrome

winget install Google.Chrome -e --silent --accept-source-agreements --accept-package-agreements 

## install firefox

winget install Mozilla.Firefox -e --silent --accept-source-agreements --accept-package-agreements

## install Google-Drive

winget install Google.Drive  -e --silent --accept-source-agreements --accept-package-agreements

## install bitwarden 

winget install Bitwarden.Bitwarden -e --silent --accept-source-agreements --accept-package-agreements

## install 7.Zip

winget install 7zip.7zip  -e --silent --accept-source-agreements --accept-package-agreements

## install VideoLAN.VLC

winget install  VideoLAN.VLC  -e --silent --accept-source-agreements --accept-package-agreements 

## install Speedtest by Ookla

winget install  9NBLGGH4Z1JC  -e --silent --accept-source-agreements --accept-package-agreements 

## install Teamviewer

winget install XPDM17HK323C4X  -e --silent --accept-source-agreements --accept-package-agreements 
 
## Install Notepad++

winget install Notepad++.Notepad++  -e --silent --accept-source-agreements --accept-package-agreements 

## Balena Etcher

winget install  Balena.Etcher  -e --silent --accept-source-agreements --accept-package-agreements 

## Install OneNote

winget install XPFFZHVGQWWLHB -e --silent --accept-source-agreements --accept-package-agreements 

## Istall Rufus 

winget install Rufus.Rufus -e --silent --accept-source-agreements --accept-package-agreements 

## install Screenpresso

 winget install Learnpulse.Screenpresso -e --silent --accept-source-agreements --accept-package-agreements 

## Install Everything voidtools.Everything

winget install voidtools.Everything -e --silent --accept-source-agreements --accept-package-agreements 

## install AdvancedIPScanner

winget install Famatech.AdvancedIPScanner -e --silent --accept-source-agreements --accept-package-agreements 

## TreeSize 

winget install JAMSoftware.TreeSize.Free -e --silent --accept-source-agreements --accept-package-agreements 

## Adobe.Acrobat.Reader.64-bit

winget install Adobe.Acrobat.Reader.64-bit -e --silent --accept-source-agreements --accept-package-agreements 

## Microsoft.OneDrive.Enterprise

winget install Microsoft.OneDrive.Enterprise -e --silent --accept-source-agreements --accept-package-agreements 


# winget install XP8BT8DW290MPQ  -e --silent --accept-source-agreements --accept-package-agreements 

## Install onenote

 #winget install XPFFZHVGQWWLHB -e --silent --accept-source-agreements --accept-package-agreements 
 
## Install ONLYOFFICE

#$source ="https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v7.3.0/DesktopEditors_x64.exe"
#$destination = "C:\Users\$Env:USERNAME\Downloads\DesktopEditors_x64.exe"
#Start-BitsTransfer -Source $source -Destination $destination

#start "C:\Users\$Env:USERNAME\Downloads\DesktopEditors_x64.exe"

  
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

## upgrade all winget install 

## Uninstall OneDrive from winget 

winget uninstall Microsoft.OneDrive

## unsiall office 

#winget uninstall Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe

winget upgrade --all


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

Get-AppxPackage *Tik.Tok* | Remove-AppPackage
 
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

#Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -norestart

## enable linux subsystem 

#Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -norestart

### Delete Desktop Icons

Remove-Item C:\Users\*\Desktop\*lnk –Force

#Pause for 60  seconds per loop
## Link: https://lazyadmin.nl/powershell/start-sleep/
Do {
    # Do stuff
    # Sleep 60 seconds
    Start-Sleep -s 60
}
while ($condition -eq $true)

## Delete Desktop Icons

Remove-Item C:\Users\*\Desktop\*lnk –Force

Set-ExecutionPolicy -ExecutionPolicy Restricted -Force 

Restart-Computer


##  ubuntu on wsl 

## update wsl 

#wsl --update 

#wsl --install -d Ubuntu 