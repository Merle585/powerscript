Set-Location ($env:LOCALAPPDATA + 'MicrosoftWindowsApps')
Start-Process "ms-teams.exe"


# Open Microsoft Edge with Favorites Bar
$edgeFavoritesPath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Bookmarks"
if (Test-Path $edgeFavoritesPath) {
    $edgeFavorites = Get-Content $edgeFavoritesPath | ConvertFrom-Json
    $edgeUrls = $edgeFavorites.roots.bookmark_bar.children | Where-Object { $_.type -eq "url" } | ForEach-Object { $_.url }
    foreach ($url in $edgeUrls) {
        Start-Process "msedge.exe" $url
    }
} else {
    Write-Output "Edge Favorites file not found at: $edgeFavoritesPath"
}

# Open Google Chrome with Favorites Bar
$chromeFavoritesPath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Bookmarks"
if (Test-Path $chromeFavoritesPath) {
    $chromeFavorites = Get-Content $chromeFavoritesPath | ConvertFrom-Json
    $chromeUrls = $chromeFavorites.roots.bookmark_bar.children | Where-Object { $_.type -eq "url" } | ForEach-Object { $_.url }
    foreach ($url in $chromeUrls) {
        Start-Process "chrome.exe" $url
    }
} else {
    Write-Output "Chrome Favorites file not found at: $chromeFavoritesPath"
}

# Open Slack
$slackPath = "$env:LOCALAPPDATA\slack\slack.exe"
if (Test-Path $slackPath) {
    Start-Process $slackPath
} else {
    Write-Output "Slack not found at: $slackPath"
}

# Skype

Start-Process "C:\Program Files\Microsoft Office\root\Office16\lync.exe"

# Open Outlook
$outlookPath = "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"
if (Test-Path $outlookPath) {
    Start-Process $outlookPath
} else {
    Write-Output "Outlook not found at: $outlookPath"
}

# Open OneNote
try {
    Start-Process onenote:
} catch {
    Write-Output "Failed to start OneNote. Ensure OneNote is installed."
}

# Open Visual Studio Code
try {
    Start-Process "code"
} catch {
    Write-Output "Failed to start Visual Studio Code. Ensure VSCode is installed and 'code' command is in PATH."
}

# Bomgar

Start-Process "C:\Users\dmv809\AppData\Local\Bomgar\bomgar-rep\support.ku.dk\Software\bomgar-rep.exe"


# agent

 Start-Process "C:\Program Files (x86)\Mitel\MiCC Enterprise\Applications\Bin\Agent.exe"

