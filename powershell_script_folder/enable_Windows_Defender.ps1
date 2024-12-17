# Enable Real-Time Monitoring
Set-MpPreference -DisableRealtimeMonitoring $false

# Enable IOAV Protection
Set-MpPreference -DisableIOAVProtection $false

# Ensure Real-Time Protection is enabled in the registry
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "Real-Time Protection" -Force


