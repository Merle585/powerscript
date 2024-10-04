Set-ExecutionPolicy -list

Get-Command *-VM

-WhatIf

Get-Vm 

Save-VM -Name 

Checkpoint-Vm -Name 

Start-VM -Name 

Stop-VM -Name

Restart-VM -Name 

Rename-VM -Name

Restart-VM -Name

Remove-VM -Name  

Suspend-VM -Name 

## Switch 

Get-VMSwitch

Get-VMNetworkAdapter -All

Get-VM "server" | Get-VMNetworkAdapter | Connect-VMNetworkAdapter -SwitchName "Mytest"

Get-VM -Name "server" | Format-List *








 



