

################################################################

## install winget on  Windows 10

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Install-Script -Name winget-install -Force
winget-install.ps1

################################################################

## install winget on  Windows 11

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

$MyLink = "https://github.com/microsoft/winget-cli/releases/download/v1.4.10173/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
Write-Host "Winget is being downloaded"

<#
  Ensure a concrete path to perform the download and execution of the file.
#>

Invoke-WebRequest -Uri $MyLink -OutFile winget-installer.msixbundle
Write-Host "Winget installer downloaded, launching installer."
Add-AppxPackage -Path .\winget-installer.msixbundle -ForceUpdateFromAnyVersion -ForceTargetApplicationShutdown

################################################################

## Install  Adobe Acrobat Reader

winget install Adobe.Acrobat.Reader.64-bit -e --silent --accept-source-agreements --accept-package-agreements 

## Install OneDrive

winget install Microsoft.OneDrive.Enterprise -e --silent --accept-source-agreements --accept-package-agreements 


## Install chrome 

winget install Google.Chrome -e --silent --accept-source-agreements --accept-package-agreements 

or

$LocalTempDir = $env:TEMP; $ChromeInstaller = "ChromeInstaller.exe"; (new-object    System.Net.WebClient).DownloadFile('http://dl.google.com/chrome/install/375.126/chrome_installer.exe', "$LocalTempDir\$ChromeInstaller"); & "$LocalTempDir\$ChromeInstaller" /silent /install; $Process2Monitor =  "ChromeInstaller"; Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound)

## Install Super Office


## Dowload program:

$source ='https://www3.superoffice.com/DownloadService/download/?component=maillink&osType=windows&serverVersion=1.0'
$destination = 'C:\Users\*\Downloads\SuperOffice.MailLink.Setup.exe'
Start-BitsTransfer -Source $source -Destination $destination

## Install program .exe: 

$Arguments = @(
    "/S"
    "/V/qn"
    )
Start-Process -FilePath  'C:\Users\*\Downloads\SuperOffice.MailLink.Setup.exe' -ArgumentList $Arguments -Wait -NoNewWindow


################################################################

