## 
## Get all VM commands 

Get-Command *-VM

## Get VHD Commands

Get-Command Get-VHD 

## Get Module Hyper-V

Get-Command -Module Hyper-V

# ExecutionPolicy list

Set-ExecutionPolicy -list


## Get VM

Get-Vm 

## Save VM

Save-VM -Name 

## Checkpoint Vm 

Checkpoint-Vm -Name server

## Start VM

Start-VM -Name 

## Stop VM

Stop-VM -Name

## Restart VM

Restart-VM -Name 

## Rename VM 

Rename-VM -Name

## Remove VM

Remove-VM -Name  

## Suspend VM

Suspend-VM -Name 

#InternalSwitch 

Get-help New-VMSwitch 

New-VMSwitch -Name MyNetwork -SwitchType Internal

Remove-VMSwitch -name Internal

Get-


## Switch 

Remove-VMSwitch -Name test

Get-VMSwitch

Get-VMNetworkAdapter -All

Get-VMNetworkAdapter -VMName win_server_gui_2019_01 | Connect-VMNetworkAdapter -SwitchName "test"

## Dynamic resource provisioning and secured file sharing using virtualization

Get-VM  

vmconnect localhost "VMName" /edit









 



