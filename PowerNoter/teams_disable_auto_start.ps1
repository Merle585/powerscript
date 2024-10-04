## Set ExecutionPolicy Unrestricted
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

# Path to the Teams registry key
$teamsRegPath = "HKCU:\Software\Microsoft\Office\Teams"

# Check if the registry key exists
if (Test-Path $teamsRegPath) {
    # Set the 'Auto-start' value to 0
    Set-ItemProperty -Path $teamsRegPath -Name "Auto-start" -Value 0
    Write-Output "Microsoft Teams auto-start disabled."
} else {
    Write-Output "Microsoft Teams is not installed for the current user."
}

#Pause for 30  seconds per loop
Do {
    # Do stuff
    # Sleep 30 seconds
    Start-Sleep -s 30
}
while ($condition -eq $true)

Set-ExecutionPolicy -ExecutionPolicy Restricted -Force 
