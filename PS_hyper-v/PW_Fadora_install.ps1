## Install Ubuntu-Desktop 

## server19: password P@ssw0rd

New-VM -Name "Fadora-Desktop" -MemoryStartupBytes 16384mb -Generation 1 -Path D:\Hyper\Fadora-Desktop -NewVHDPath D:\Hyper\Fadora-Desktop\Fadora-Desktop.vhdx -NewVHDSizeBytes 250GB 

Set-VM -Name "Fadora-Desktop" -ProcessorCount 4

Add-VMDvdDrive -VMName "Fadora-Desktop" -Path D:\iso_folder\Fedora.iso


## Dynamic resource provisioning and secured file sharing using virtualization

Get-VM  

vmconnect localhost "Fadora-Desktop" /edit


## Checkpoint

## Link: https://www.thomasmaurer.ch/2020/07/how-to-manage-hyper-v-vm-checkpoints-with-powershell/

Checkpoint-Vm -Name "Fadora-Desktop" -SnapshotName "Fadora-Desktop_update_upgrade_Install_from_PS" 

Get-VMCheckpoint "Fadora-Desktop"

Stop-VM Fadora-Desktop