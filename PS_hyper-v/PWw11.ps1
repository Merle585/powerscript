## windows 11 client VM

 # windows11: password P@ssw0rd

New-VM -Name "windows11" -MemoryStartupBytes 16384mb -Generation 2 -Path D:\Hyper\windows11 -NewVHDPath D:\Hyper\windows11\windows11.vhdx -NewVHDSizeBytes 125GB
 

Set-VM -Name "windows11" -ProcessorCount 4

Add-VMDvdDrive -VMName "windows11" -Path D:\iso_folder\Win11.iso



######################################################################################################################






