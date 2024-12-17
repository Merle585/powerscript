## Install Ubuntu-Desktop 

## server19: password P@ssw0rd

New-VM -Name "Ubuntu-Desktop" -MemoryStartupBytes 16384mb -Generation 1 -Path D:\Hyper\Ubuntu-Desktop -NewVHDPath D:\Hyper\Ubuntu-Desktop\Ubuntu-Desktop.vhdx -NewVHDSizeBytes 250GB 

Set-VM -Name "Ubuntu-Desktop" -ProcessorCount 4

Add-VMDvdDrive -VMName "Ubuntu-Desktop" -Path D:\iso_folder\ubuntu-22.04.1-desktop-amd64.iso


## Dynamic resource provisioning and secured file sharing using virtualization

Get-VM  

vmconnect localhost "Ubuntu-Desktop" /edit


## Checkpoint

## Link: https://www.thomasmaurer.ch/2020/07/how-to-manage-hyper-v-vm-checkpoints-with-powershell/

Checkpoint-Vm -Name "Ubuntu-Desktop" -SnapshotName "Ubuntu-Desktop_update_upgrade_Install_from_PS" 

Get-VMCheckpoint "Ubuntu-Desktop"

Stop-VM ubuntu-Desktop