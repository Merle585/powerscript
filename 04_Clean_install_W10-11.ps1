Set-ExecutionPolicy Unrestricted

#######################################################################
## Import PSWindowsUpdate PSWindowsUpdate

## Lisk: https://pureinfotech.com/install-windows-10-update-powershell/


## Install module PSWindowsUpdate 
Install-Module PSWindowsUpdate

## See WindowsUpdate CMD
Get-WindowsUpdate

## Get all windows update module cmd 
Get-Command -Module PSWindowsUpdate

## Update Windows 
Install-WindowsUpdate

#######################################################################

## install winget 

$source ='https://github.com/microsoft/winget-cli/releases/download/v1.4.10173/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'
$destination = 'C:\Users\test_w10_01\Downloads\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'
Start-BitsTransfer -Source $source -Destination $destination

start C:\Users\test_w10_01\Downloads\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle

## install from winget åber microsoft store og søg efter app installer eller winget 

## install Google-Chrome

winget install Google.Chrome --accept-source-agreements --accept-package-agreements 

start chrome

## install Google-Drive

winget install Google.Drive --accept-source-agreements --accept-package-agreements 

## install bitwarden 

winget install Bitwarden.Bitwarden --accept-source-agreements --accept-package-agreements

## install 7.Zip

winget install 7zip.7zip --accept-source-agreements --accept-package-agreements


winget install  VideoLAN.VLC 

#######################################################################

## uninstall from winget 


## cortana

winget uninstall  Microsoft.549981C3F5F10_8wekyb3d8bbwe

## Microsoft Tips                       

winget uninstall Microsoft.Getstarted_8wekyb3d8bbwe 

## Paint 3D                              

winget uninstall Microsoft.MSPaint_8wekyb3d8bbwe

## WindowsMaps

winget uninstall Microsoft.WindowsMaps_8wekyb3d8bbwe

## Spotify

winget uninstall  Spotify.Spotify

##  Films & TV

winget uninstall  Microsoft.ZuneVideo_8wekyb3d8bbwe

#######################################################################

## uninstall from PowerShell 

## Uninstall Xbox Live 
 
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


##Alarms and Clocks	
#Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage

##AV1 Codec
#Get-AppxPackage *AV1VideoExtension* | Remove-AppxPackage

##Calculator
#Get-AppxPackage *WindowsCalculator* | Remove-AppxPackage

##Cortana	
#Get-AppxPackage *Microsoft.549981C3F5F10* | Remove-AppxPackage

##Feedback Hub	
#Get-AppxPackage *WindowsFeedbackHub* | Remove-AppxPackage

##HEIF image support	
#Get-AppxPackage *HEIFImageExtension* | Remove-AppxPackage

##Help and tips	
#Get-AppxPackage *GetHelp* | Remove-AppxPackage

##Maps	
#Get-AppxPackage *WindowsMaps* | Remove-AppxPackage

##Microsoft Edge	
#Get-AppxPackage *MicrosoftEdge* | Remove-AppxPackage

##Microsoft To-Do	
#Get-AppxPackage *Todos* | Remove-AppxPackage

##Movies and TV	
#Get-AppxPackage *ZuneVideo* | Remove-AppxPackage

##MS Office	
#Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage

##MS Paint	
#Get-AppxPackage *Paint* | Remove-AppxPackage

##Music app	
Get-AppxPackage *ZuneMusic* | Remove-AppxPackage

##News app
#Get-AppxPackage *BingNews* | Remove-AppxPackage

##Notepad	
#Get-AppxPackage *WindowsNotepad* | Remove-AppxPackage

##OneDrive	
#Get-AppxPackage *OneDriveSync* | Remove-AppxPackage

##People app	
#Get-AppxPackage *People* | Remove-AppxPackage

##Photos	
#Get-AppxPackage *Windows.Photos* | Remove-AppxPackage

##PowerAutomate	
#Get-AppxPackage *PowerAutomateDesktop* | Remove-AppxPackage

##PowerShell
#Get-AppxPackage *PowerShell* | Remove-AppxPackage

##Screen And Sketch/Snipping Tool	
#Get-AppxPackage *ScreenSketch* | Remove-AppxPackage

##Skype
#Get-AppxPackage *SkypeApp* | Remove-AppxPackage

##Solitaire Collection
#Get-AppxPackage *MicrosoftSolitaireCollection* | Remove-AppxPackage

##Spotify
#Get-AppxPackage *SpotifyAB.SpotifyMusic* | Remove-AppxPackage

##Sticky Notes	
#Get-AppxPackage *MicrosoftStickyNotes* | Remove-AppxPackage

##Teams/Chat	
#Get-AppxPackage *Teams* | Remove-AppxPackage

##Voice Recorder	
#Get-AppxPackage *WindowsSoundRecorder* | Remove-AppxPackage

##Weather	
#Get-AppxPackage *BingWeather* | Remove-AppxPackage

##WebP image support	
#Get-AppxPackage *WebpImageExtension* | Remove-AppxPackage

##Windows Terminal	
#Get-AppxPackage *WindowsTerminal* | Remove-AppxPackage

##Xbox and related apps	
#Get-AppxPackage *Xbox* | Remove-AppxPackage

##Your Phone	
#Get-AppxPackage *YourPhone* | Remove-AppxPackage
