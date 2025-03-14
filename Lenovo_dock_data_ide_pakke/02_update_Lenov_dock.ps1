# Define the output file path
$outputFile = "C:\02_$($computerSystem.Name)_update.txt"

# Update/upgrade apps using winget
winget upgrade --all | Out-File -FilePath $outputFile -Append

# Update/upgrade all Lenovo drivers
$updates = Get-LSUpdate
$updates | Install-LSUpdate -Verbose | Out-File -FilePath $outputFile -Append
