## Get printer

Get-PrinterPort

## Get drivers 

Get-PrinterDriver

## print drive 

Add-PrinterDriver -Name "Microsoft PCL6 Class Driver"

## Add tpc/ip 

Add-PrinterPort -Name test2 -PrinterHostAddress 192.168.1.2

## add printer 

add-printer -name "test2" -PortName test2 -DriverName "Microsoft PCL6 Class Driver"