
################################################################################

## DC_01_win_server_gui_2019_01: 

New-VM -Name "DC_01_win_server_gui_2019_01" -MemoryStartupBytes 8192mb -Generation 2 -Path C:\Users\cli\Documents\hyper-v\DC_01_win_server_gui_2019_01 -NewVHDPath C:\Users\cli\Documents\hyper-v\DC_01_win_server_gui_2019_01\DC_01_win_server_gui_2019_01_drive_01.vhdx -NewVHDSizeBytes 125GB
 
## ProcessorCount

Set-VM -Name "DC_01_win_server_gui_2019_01" -ProcessorCount 2 

## Add ISO file

Add-VMDvdDrive -VMName "DC_01_win_server_gui_2019_01" -Path C:\Users\cli\Documents\iso\Win_Server_2019.iso

## Firmware boot order DVD.

$VMNAME= "DC_01_win_server_gui_2019_01"
$VMDVD = Get-VMDvdDrive -VMName $VMNAME
Set-VMFirmware -VMName $VMNAME -FirstBootDevice $VMDVD

vmconnect localhost "DC_01_win_server_gui_2019_01" /edit

################################################################################

## Add new Network Adapter

New-VMSwitch -Name MyNetwork -SwitchType Internal

Get-VM

get-help Set-NetAdapter

## VM Network Adapter To update vm 

Get-VMNetworkAdapter -VMName DC_01_win_server_gui_2019_01 | Connect-VMNetworkAdapter -SwitchName "Default Switch"

## VM Network Adapter To Config vm 

 #Get-VMNetworkAdapter -VMName DC_01_win_server_gui_2019_01 | Connect-VMNetworkAdapter -SwitchName "MyNetwork"


################################################################################

## DC_02_win_server_gui_2019_01: 

New-VM -Name "DC_02_win_server_gui_2019_02" -MemoryStartupBytes 8192mb -Generation 2 -Path C:\Users\cli\Documents\hyper-v\DC_02_win_server_gui_2019_02 -NewVHDPath C:\Users\cli\Documents\hyper-v\DC_02_win_server_gui_2019_02\DC_02_win_server_gui_2019_02_drive_01.vhdx -NewVHDSizeBytes 125GB
 
## ProcessorCount

Set-VM -Name "DC_02_win_server_gui_2019_02" -ProcessorCount 2 

## Add ISO file

Add-VMDvdDrive -VMName "DC_02_win_server_gui_2019_02" -Path C:\Users\cli\Documents\iso\Win_Server_2019.iso

vmconnect localhost "DC_02_win_server_gui_2019_02" /edit

## VM Network Adapter To update vm 

Get-VMNetworkAdapter -VMName "DC_02_win_server_gui_2019_02" | Connect-VMNetworkAdapter -SwitchName "Default Switch"

## VM Network Adapter To Config vm 

# Get-VMNetworkAdapter -VMName "DC_02_win_server_gui_2019_02" | Connect-VMNetworkAdapter -SwitchName "MyNetwork"

## Firmware boot order DVD.

$VMNAME= "DC_02_win_server_gui_2019_02"
$VMDVD = Get-VMDvdDrive -VMName $VMNAME
Set-VMFirmware -VMName $VMNAME -FirstBootDevice $VMDVD

vmconnect localhost "DC_02_win_server_gui_2019_02" /edit


## add Hard disk E drive for file server 
  
Get-Help New-vhd -Detailed

Get-Help New-VHD -full

Get-Help New-VirtualDisk -Detailed


New-VHD -Path C:\Users\cli\Documents\hyper-v\DC_02_win_server_gui_2019_02\DC_02_win_server_gui_2019_02_drive_02.vhdx -SizeBytes 125Gb -Dynamic

Add-VMHardDiskDrive -VMName "DC_02_win_server_gui_2019_02" -Path C:\Users\cli\Documents\hyper-v\DC_02_win_server_gui_2019_02\DC_02_win_server_gui_2019_02_drive_02.vhdx

################################################################################
