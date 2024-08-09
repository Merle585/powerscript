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

## Windows 11

## install winget v1.4.10173

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
$MyLink = "https://github.com/microsoft/winget-cli/releases/download/v1.4.10173/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
Write-Host "Winget is being downloaded"

<#
  Ensure a concrete path to perform the download and execution of the file.
#>

Invoke-WebRequest -Uri $MyLink -OutFile winget-installer.msixbundle
Write-Host "Winget installer downloaded, launching installer."
Add-AppxPackage -Path .\winget-installer.msixbundle -ForceUpdateFromAnyVersion -ForceTargetApplicationShutdown


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

# winget install Google.Chrome -e --silent --accept-source-agreements --accept-package-agreements 

# winget install Google.Chrome -e --silent --accept-source-agreements --accept-package-agreements 

$LocalTempDir = $env:TEMP; $ChromeInstaller = "ChromeInstaller.exe"; (new-object    System.Net.WebClient).DownloadFile('http://dl.google.com/chrome/install/375.126/chrome_installer.exe', "$LocalTempDir\$ChromeInstaller"); & "$LocalTempDir\$ChromeInstaller" /silent /install; $Process2Monitor =  "ChromeInstaller"; Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound)



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

## Install Rufus 

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

## Install Microsoft Teams

winget install XP8BT8DW290MPQ  -e --silent --accept-source-agreements --accept-package-agreements 

## install phone link 

winget install 9NMPJ99VJBWV -e --silent --accept-source-agreements --accept-package-agreements

## Notepad

winget install 9MSMLRH6LZF3 -e --silent --accept-source-agreements --accept-package-agreements

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

## XBOX

winget uninstall Microsoft.GamingApp_8wekyb3d8bbwe

## uninstall office 

#winget uninstall Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe

## MicrosoftTeams "school"  

# winget uninstall MicrosoftTeams_8wekyb3d8bbwe

## upgrade all winget install 

winget upgrade --all | Out-Host 


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

## Uninstall Tik Tok

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

## Taskbar

Chat:

REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v TaskbarMn /t REG_DWORD /d 0

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Chat" /f /v ChatIcon /t REG_DWORD /d 3

Widgets:

REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v TaskbarDa /t REG_DWORD /d 0

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Dsh" /f /v AllowNewsAndInterests /t REG_DWORD /d 0

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /f /v EnableFeeds /t REG_DWORD /d 0

powershell -noprofile -executionpolicy bypass -command "Get-AppxPackage -Name WebExperience | Foreach {Remove-AppxPackage $_.PackageFullName}"

powershell -noprofile -executionpolicy bypass -command "Get-ProvisionedAppxPackage -Online | Where-Object { $_.PackageName -match 'WebExperience' } | ForEach-Object { Remove-ProvisionedAppxPackage -Online -PackageName $_.PackageName }"

winget uninstall "windows web experience pack"

## enable

## enable hyper-v 

#Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

## enable linux subsystem 

#Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

## Delete Desktop Icons

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

## Edge desktop icone

$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Microsoft Edge.lnk")
$Shortcut.TargetPath = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
$Shortcut.Save()
$bytes = [System.IO.File]::ReadAllBytes("$Home\Desktop\\msedge.lnk.lnk")
$bytes[0x15] = $bytes[0x15] -bor 0x20
[System.IO.File]::WriteAllBytes("$Home\Desktop\\Microsoft Edge.lnk", $bytes)

Set-ExecutionPolicy -ExecutionPolicy Restricted -Force 

Restart-Computer


##  ubuntu on wsl 

## update wsl 

#wsl --update 

#wsl --install -d Ubuntu 