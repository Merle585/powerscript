Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

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

## onenote windows 10

 Get-appxpackage *microsoft.office.onenote* | Remove-appxpackage

 ## 

 Get-appxpackage *microsoft.office.onenote* | Remove-appxpackage

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

#############################################################################################################

## Update Microsoft store 

function Write-log {

    [CmdletBinding()]
    Param(
          [parameter(Mandatory=$true)]
          [String]$Path,

          [parameter(Mandatory=$true)]
          [String]$Message,

          [parameter(Mandatory=$true)]
          [String]$Component,

          [Parameter(Mandatory=$true)]
          [ValidateSet("Info", "Warning", "Error")]
          [String]$Type
    )

    switch ($Type) {
        "Info" { [int]$Type = 1 }
        "Warning" { [int]$Type = 2 }
        "Error" { [int]$Type = 3 }
    }

    # Create a log entry
    $Content = "<![LOG[$Message]LOG]!>" +`
        "<time=`"$(Get-Date -Format "HH:mm:ss.ffffff")`" " +`
        "date=`"$(Get-Date -Format "M-d-yyyy")`" " +`
        "component=`"$Component`" " +`
        "context=`"$([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)`" " +`
        "type=`"$Type`" " +`
        "thread=`"$([Threading.Thread]::CurrentThread.ManagedThreadId)`" " +`
        "file=`"`">"

    # Write the line to the log file
    Add-Content -Path $Path -Value $Content
}
$namespaceName = "root\cimv2\mdm\dmmap"
$className = "MDM_EnterpriseModernAppManagement_AppManagement01"
$wmiObj = Get-WmiObject -Namespace $namespaceName -Class $className
$result = $wmiObj.UpdateScanMethod()

$LogCycle = 30
$LogFilePath = Join-Path $PSScriptRoot "$(Get-Date -Format yyyy-M-dd) $($MyInvocation.MyCommand.Name).log"

Write-Warning "Delete log files older than $LogCycle days"
Get-ChildItem -Path $PSScriptRoot | Where-Object {($Now - $_.LastWriteTime).Days -gt $LogCycle -and $_.extension -eq ".log"} | Remove-Item
Write-Host "Update process has been started"
Write-Host "Following apps have updates available"
winget upgrade --accept-source-agreements --accept-package-agreements #Lists all apps which have updates available

$Output= winget upgrade -h --all #Apps Which are being updated and will be listed in log after the update install finishes
Write-Host "Apps which have updates available"
Write-Host $Output
try {

    throw "Updates were Succesfully installed"
	

} 
catch {

    Write-Information ($_ | Out-String) #It will write log in information when script runs as update will be started
    Write-Log -Path $LogFilePath -Message ($_ | Out-String) -Component $MyInvocation.MyCommand.Name -Type Info
}
Write-Host "Updates were installed and log file has been created"

#######################################################################

#Pause for 300  seconds per loop
## Link: https://lazyadmin.nl/powershell/start-sleep/
Do {
    # Do stuff
    # Sleep 300 seconds
    Start-Sleep -s 300
}
while ($condition -eq $true)

#############################################################################################################

## Update Microsoft store 

function Write-log {

    [CmdletBinding()]
    Param(
          [parameter(Mandatory=$true)]
          [String]$Path,

          [parameter(Mandatory=$true)]
          [String]$Message,

          [parameter(Mandatory=$true)]
          [String]$Component,

          [Parameter(Mandatory=$true)]
          [ValidateSet("Info", "Warning", "Error")]
          [String]$Type
    )

    switch ($Type) {
        "Info" { [int]$Type = 1 }
        "Warning" { [int]$Type = 2 }
        "Error" { [int]$Type = 3 }
    }

    # Create a log entry
    $Content = "<![LOG[$Message]LOG]!>" +`
        "<time=`"$(Get-Date -Format "HH:mm:ss.ffffff")`" " +`
        "date=`"$(Get-Date -Format "M-d-yyyy")`" " +`
        "component=`"$Component`" " +`
        "context=`"$([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)`" " +`
        "type=`"$Type`" " +`
        "thread=`"$([Threading.Thread]::CurrentThread.ManagedThreadId)`" " +`
        "file=`"`">"

    # Write the line to the log file
    Add-Content -Path $Path -Value $Content
}
$namespaceName = "root\cimv2\mdm\dmmap"
$className = "MDM_EnterpriseModernAppManagement_AppManagement01"
$wmiObj = Get-WmiObject -Namespace $namespaceName -Class $className
$result = $wmiObj.UpdateScanMethod()

$LogCycle = 30
$LogFilePath = Join-Path $PSScriptRoot "$(Get-Date -Format yyyy-M-dd) $($MyInvocation.MyCommand.Name).log"

Write-Warning "Delete log files older than $LogCycle days"
Get-ChildItem -Path $PSScriptRoot | Where-Object {($Now - $_.LastWriteTime).Days -gt $LogCycle -and $_.extension -eq ".log"} | Remove-Item
Write-Host "Update process has been started"
Write-Host "Following apps have updates available"
winget upgrade --accept-source-agreements --accept-package-agreements #Lists all apps which have updates available

$Output= winget upgrade -h --all #Apps Which are being updated and will be listed in log after the update install finishes
Write-Host "Apps which have updates available"
Write-Host $Output
try {

    throw "Updates were Succesfully installed"
	

} 
catch {

    Write-Information ($_ | Out-String) #It will write log in information when script runs as update will be started
    Write-Log -Path $LogFilePath -Message ($_ | Out-String) -Component $MyInvocation.MyCommand.Name -Type Info
}
Write-Host "Updates were installed and log file has been created"

#######################################################################

#Pause for 300  seconds per loop
## Link: https://lazyadmin.nl/powershell/start-sleep/
Do {
    # Do stuff
    # Sleep 300 seconds
    Start-Sleep -s 300
}
while ($condition -eq $true)

#############################################################################################################


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

## install from winget åber microsoft store og søg efter app installer eller winget 

## install terminal priview 

winget install  Microsoft.WindowsTerminal.Preview  -e --silent --accept-source-agreements --accept-package-agreements --source winget 

## install Google-Chrome

winget install Google.Chrome -e --silent --accept-source-agreements --accept-package-agreements --source winget

## install Google-Drive

winget install Google.GoogleDrive  -e --silent --accept-source-agreements --accept-package-agreements  --source winget 

## install firefox

winget install Mozilla.Firefox -e --silent --accept-source-agreements --accept-package-agreements --source winget 

## install bitwarden 

winget install Bitwarden.Bitwarden -e --silent --accept-source-agreements --accept-package-agreements --source winget 

## install 7.Zip

winget install 7zip.7zip  -e --silent --accept-source-agreements --accept-package-agreements --source winget

## install VideoLAN.VLC

winget install  VideoLAN.VLC  -e --silent --accept-source-agreements --accept-package-agreements --source winget

## install Speedtest by Ookla

winget install  Ookla.Speedtest.Desktop   -e --silent --accept-source-agreements --accept-package-agreements --source winget

## install Teamviewer

winget install TeamViewer.TeamViewer -e --silent --accept-source-agreements --accept-package-agreements --source winget
 
## Install Notepad++

winget install Notepad++.Notepad++  -e --silent --accept-source-agreements --accept-package-agreements --source winget

## Balena Etcher

winget install  Balena.Etcher  -e --silent --accept-source-agreements --accept-package-agreements --source winget

## Istall Rufus 

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

## Microsoft.Office

#winget install Microsoft.Office   -e --silent --accept-source-agreements --accept-package-agreements --source winget

## Install ONLYOFFICE

#$source ="https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v7.3.0/DesktopEditors_x64.exe"
#$destination = "C:\Users\$Env:USERNAME\Downloads\DesktopEditors_x64.exe"
#Start-BitsTransfer -Source $source -Destination $destination

#start "C:\Users\$Env:USERNAME\Downloads\DesktopEditors_x64.exe"

  
#######################################################################

## uninstall from winget 

## Microsoft Tips                       

winget uninstall Microsoft.Getstarted_8wekyb3d8bbwe -e --silent --accept-source-agreements --accept-package-agreements

## Paint 3D                              

winget uninstall Microsoft.MSPaint_8wekyb3d8bbwe -e --silent --accept-source-agreements --accept-package-agreements

## WindowsMaps

winget uninstall Microsoft.WindowsMaps_8wekyb3d8bbwe -e --silent --accept-source-agreements --accept-package-agreements

##  Films & TV

winget uninstall  Microsoft.ZuneVideo_8wekyb3d8bbwe -e --silent --accept-source-agreements --accept-package-agreements

## Uninstall 3D viewer
 
winget uninstall 9NBLGGH42THS -e --silent --accept-source-agreements --accept-package-agreements

## Uninstall Disney+

winget uninstall Disney+ -e --silent --accept-source-agreements --accept-package-agreements

## unibstall windows 10 onenote 

# winget uninstall Microsoft.Office.OneNote_8wekyb3d8bbwe -e --silent --accept-source-agreements --accept-package-agreements

#######################################################################


## enable hyper-v 

#Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -norestart

###########################################################


## enable linux subsystem 

#Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -norestart

###########################################################

## install ubuntu on wsl and update wsl 

#wsl --update 

#wsl --install -d Ubuntu 

###############################################################

## Delete Desktop Icons

Remove-Item C:\Users\*\Desktop\*lnk –Force

###############################################################

#Pause for 60  seconds per loop
## Link: https://lazyadmin.nl/powershell/start-sleep/
Do {
    # Do stuff
    # Sleep 60 seconds
    Start-Sleep -s 60
}
while ($condition -eq $true)

###############################################################

## Delete Desktop Icons

Remove-Item C:\Users\*\Desktop\*lnk –Force

###############################################################

Set-ExecutionPolicy -ExecutionPolicy Restricted -Force 

###############################################################

Restart-Computer
