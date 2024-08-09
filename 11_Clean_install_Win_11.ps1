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


## Remove All Windows app 

Get-AppxPackage -allusers | foreach {if (!($_.IsFramework -or $_.PublisherId -eq "cw5n1h2txyewy")) {Remove-AppxPackage -Package $_.PackageFullName}}





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

## install Microsoft.WindowsStore

Get-AppxPackage -AllUsers Microsoft.WindowsStore* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

## snipping tool

Get-AppxPackage -AllUsers Microsoft.ScreenSketch* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}




## install Google-Chrome

# winget install Google.Chrome -e --silent --accept-source-agreements --accept-package-agreements --source winget 

$LocalTempDir = $env:TEMP; $ChromeInstaller = "ChromeInstaller.exe"; (new-object    System.Net.WebClient).DownloadFile('http://dl.google.com/chrome/install/375.126/chrome_installer.exe', "$LocalTempDir\$ChromeInstaller"); & "$LocalTempDir\$ChromeInstaller" /silent /install; $Process2Monitor =  "ChromeInstaller"; Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound)

## install firefox

winget install Mozilla.Firefox -e --silent --accept-source-agreements --accept-package-agreements --source winget 

## install Google-Drive

winget install Google.Drive  -e --silent --accept-source-agreements --accept-package-agreements --source winget  

## install bitwarden 

winget install Bitwarden.Bitwarden -e --silent --accept-source-agreements --accept-package-agreements --source winget 

## install 7.Zip

winget install 7zip.7zip  -e --silent --accept-source-agreements --accept-package-agreements --source winget 

## install VideoLAN.VLC

winget install  VideoLAN.VLC  -e --silent --accept-source-agreements --accept-package-agreements --source winget  

## install Speedtest by Ookl

winget install  9NBLGGH4Z1JC  -e --silent --accept-source-agreements --accept-package-agreements  --source winget  

## install Teamviewer

winget install XPDM17HK323C4X  -e --silent --accept-source-agreements --accept-package-agreements --msstore
 
## Install Notepad++

winget install Notepad++.Notepad++  -e --silent --accept-source-agreements --accept-package-agreements --source winget  

## Balena Etcher

winget install  Balena.Etcher  -e --silent --accept-source-agreements --accept-package-agreements --source winget 

## Install OneNote

winget install Microsoft.Office -e --silent --accept-source-agreements --accept-package-agreements --source winget

## Install Rufus 

winget install Rufus.Rufus -e --silent --accept-source-agreements --accept-package-agreements --source winget 

## install Screenpresso

 winget install Learnpulse.Screenpresso -e --silent --accept-source-agreements --accept-package-agreements --source winget 

## Install Everything voidtools.Everything

winget install voidtools.Everything -e --silent --accept-source-agreements --accept-package-agreements --source winget 

## install AdvancedIPScanner

winget install Famatech.AdvancedIPScanner -e --silent --accept-source-agreements --accept-package-agreements --source winget 

## TreeSize 

winget install JAMSoftware.TreeSize.Free -e --silent --accept-source-agreements --accept-package-agreements --source winget 

## Adobe.Acrobat.Reader.64-bit

winget install Adobe.Acrobat.Reader.64-bit -e --silent --accept-source-agreements --accept-package-agreements --source winget 

## install phone link 

winget install 9NMPJ99VJBWV -e --silent --accept-source-agreements --accept-package-agreements --msstore

## Notepad

winget install 9MSMLRH6LZF3 -e --silent --accept-source-agreements --accept-package-agreements --msstore

## Phone Link 

winget install 9NMPJ99VJBWV -e --silent --accept-source-agreements --accept-package-agreements --msstore

## Microsoft Photos

winget install 9WZDNCRFJBH4 -e --silent --accept-source-agreements --accept-package-agreements --msstore

## Windows Calculator

winget install 9WZDNCRFHVN5 -e --silent --accept-source-agreements --accept-package-agreements --msstore


## Install ONLYOFFICE

#$source ="https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v7.3.0/DesktopEditors_x64.exe"
#$destination = "C:\Users\$Env:USERNAME\Downloads\DesktopEditors_x64.exe"
#Start-BitsTransfer -Source $source -Destination $destination

#start "C:\Users\$Env:USERNAME\Downloads\DesktopEditors_x64.exe"


## upgrade all winget install 

winget upgrade --all | Out-Host 


#######################################################################

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


## enable

## enable hyper-v 

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All  -norestart

## enable linux subsystem 

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux  -norestart

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




