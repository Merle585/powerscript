## Set ExecutionPolicy Unrestricted
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

# Path to the Teams registry key
$teamsRegPath = "HKCU:\Software\Microsoft\Office\Teams"

# Check if the registry key exists
if (Test-Path $teamsRegPath) {
    # Set the 'Auto-start' value to 0
    Set-ItemProperty -Path $teamsRegPath -Name "Auto-start" -Value 1
    Write-Output "Microsoft Teams auto-start disabled."
} else {
    Write-Output "Microsoft Teams is not installed for the current user."
}

#Pause for 300  seconds per loop

Do {
    # Do stuff
    # Sleep 300 seconds
    Start-Sleep -s 300
}
while ($condition -eq $true)

Set-ExecutionPolicy -ExecutionPolicy Restricted -Force 
