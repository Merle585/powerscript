
## PowerShell - Networking with Windows Routing

## link: https://codeandkeep.com/PowerShell-Windows-Routing/

# New-VMSwitch -Name "test" -NetAdapterName Ethernet -AllowManagementOS $true

New-VMSwitch -Name Mytest -SwitchType Internal

Get-VMNetworkAdapter -All

Get-VMNetworkAdapter -Name 

Remove-VMSwitch -Name

## install VM`s

New-VM -Name "server" -MemoryStartupBytes 2048MB -Generation 1 -Path D:\Hyper-V\vm-folder\server -NewVHDPath D:\Hyper-V\vm-folder\server\server.vhdx -NewVHDSizeBytes 25GB -SwitchName "Mytest"

set-VM -Name "server" -ProcessorCount 1

Add-VMDvdDrive -VMName "server" -Path D:\Hyper-V\server-2016.ISO

Start-VM -Name "server"

New-Vm -Name "pctest" -MemoryStartupBytes 4092MB -Generation 1 -Path D:\Hyper-V\vm-folder\pctest -NewVHDPath  D:\Hyper-V\vm-folder\pctest\pctest.vhdx -NewVHDSizeBytes 25GB -SwitchName "Mytest"

Set-Vm -Name "pctest" -ProcessorCount 2

Add-VMDvdDrive -VMName "pctest" -Path D:\Hyper-V\windows-10-dk.iso

start-VM -Name "pctest"



