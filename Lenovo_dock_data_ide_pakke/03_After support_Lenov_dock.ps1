# Set ExecutionPolicy to Unrestricted
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

# Install NuGet package provider
Install-PackageProvider Nuget -Force

# Get computer system information
$computerSystem = Get-CimInstance -ClassName Win32_ComputerSystem

# Get processor information
$processor = Get-CimInstance -ClassName Win32_Processor

# Get BIOS information
$bios = Get-CimInstance -ClassName Win32_BIOS

# Display the desired properties
$info = [PSCustomObject]@{
    CsManufacturer = $computerSystem.Manufacturer
    CsProcessors   = $processor.Name
    CsModel        = $computerSystem.Model
    CsName         = $computerSystem.Name
    BiosSerialNumber = $bios.SerialNumber
}

# Define the output file path
$outputFilePath = "C:\03_$($computerSystem.Name)_AS.txt"

# Collect all output
$output = @()

# Add computer info to output
$output += "# Computer info:"
$output += $info | Out-String

# Add Windows updates to output
$output += "# Windows update / HotFixID"
$hotfixes = Get-HotFix | Sort-Object -Property InstalledOn | Select-Object InstalledOn, HotFixID
foreach ($hotfix in $hotfixes) {
    $hotfix.InstalledOn = "N/A"
}
$output += $hotfixes | Out-String

# Install LSUClient Module
Install-Module -Name LSUClient -Force

# Add Lenovo drive ready upgrade info to output
$output += "# List for Lenovo drive ready upgrade"
$output += Get-LSUpdate | Out-String
$updates = Get-LSUpdate | Where-Object { $_.Installer.Unattended }
$output += $updates | Save-LSUpdate -Verbose | Out-String
$output += $updates | Install-LSUpdate -Verbose | Out-String

# Add ThinkPad Thunderbolt info to output
$output += "# The connected dock info"
$output += (Get-WmiObject -Class win32_networkadapter -Property * | Where-Object { $_.Name -like "*Lenovo USB Ethernet*" }) | Out-String

$output += "# ThinkPad Thunderbolt"
$output += (Get-PnpDevice | Where-Object { $_.FriendlyName -like "*ThinkPad Thunderbolt*" }) | Out-String

# Get all connected displays
$displays = Get-WmiObject -Namespace root\wmi -Class WmiMonitorID

# Display information about each connected display
$output += "# Display information about each connected display"
foreach ($display in $displays) {
    $manufacturer = [System.Text.Encoding]::ASCII.GetString($display.ManufacturerName -ne 0)
    $productCode = [System.Text.Encoding]::ASCII.GetString($display.ProductCodeID -ne 0)
    $serialNumber = [System.Text.Encoding]::ASCII.GetString($display.SerialNumberID -ne 0)
    $userFriendlyName = [System.Text.Encoding]::ASCII.GetString($display.UserFriendlyName -ne 0)

    $output += "Manufacturer: $manufacturer"
    $output += "Product Code: $productCode"
    $output += "Serial Number: $serialNumber"
    $output += "User Friendly Name: $userFriendlyName"
    $output += "-----------------------------------"
}

# Get all network adapters
$output += "# Get all network adapters"
$networkAdapters = Get-NetAdapter -Name "*"

# Display detailed information about all Ethernet adapters
$ethernetAdapters = $networkAdapters | Where-Object { $_.Name -like "Ethernet*" }
$output += $ethernetAdapters | Format-List -Property * | Out-String

# Add Intel Thunderbolt Driver Advisory info to output
$output += "# Intel Thunderbolt Driver Advisory"
$output += (Get-WmiObject -Class Win32_Product | Select-Object -Property Name, Version) | Out-String
$output += (Get-WmiObject Win32_PnPSignedDriver | Where-Object { $_.DeviceName -like '*Thunderbolt*' } | Select-Object -Property DeviceName, DriverVersion, DriverDate) | Out-String
$output += "# Retrieve System, Network, Display, and Thunderbolt Driver Information"
$output += (Get-WmiObject Win32_PnPSignedDriver | Where-Object { $_.DeviceClass -eq 'System' -or $_.DeviceClass -eq 'Net' -or $_.DeviceClass -eq 'Display' -or $_.DeviceName -like '*Thunderbolt*' } | Select-Object -Property DeviceName, DriverVersion, DriverDate) | Out-String

# Add Winget info to output
$output += "# List all winget app ready upgrades"
$output += (winget list --upgrade-available --source=winget) | Out-String

# Save the output to the file
$output | Out-File -FilePath $outputFilePath

# Inform the user
Write-Output "The output has been saved to $outputFilePath"

# Set ExecutionPolicy back to Restricted
Set-ExecutionPolicy -ExecutionPolicy Restricted -Force