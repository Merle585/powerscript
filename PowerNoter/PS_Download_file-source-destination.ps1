
# lINK: https://adamtheautomator.com/powershell-download-file/

$source ="https://download.teamviewer.com/download/TeamViewer_Setup_x64.exe"
$destination = "C:\Users\$Env:USERNAME\Downloads\TeamViewer_Setup_x64.exe"
Start-BitsTransfer -Source $source -Destination $destination

start "C:\Users\$Env:USERNAME\Downloads\TeamViewer_Setup_x64.exe" /S