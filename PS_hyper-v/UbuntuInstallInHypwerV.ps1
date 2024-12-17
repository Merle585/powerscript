# server19: password P@ssw0rd

New-VM -Name "Ubuntu-Desktop" -MemoryStartupBytes 8192mb -Generation 1 -Path D:\Hyper\Ubuntu-Desktop -NewVHDPath D:\Hyper\Ubuntu-Desktop\Ubuntu-Desktop.vhdx -NewVHDSizeBytes 125GB

Set-VM -Name "Ubuntu-Desktop" -ProcessorCount 4

Add-VMDvdDrive -VMName "Ubuntu-Desktop" -Path D:\iso_folder\ubuntu-22.04.1-desktop-amd64.iso

Get-VM