
## Hyper-V_install_vm:

######################################################################################################################

## windows10_ENG_01 VM

New-VM -Name "windows10_ENG_01" -MemoryStartupBytes 10240mb -Generation 2 -Path C:\hyper-v\windows10_ENG_01 -NewVHDPath  C:\hyper-v\windows10_ENG_01\windows10_ENG_01.vhdx -NewVHDSizeBytes 125GB
 
Set-VM -Name "windows10_ENG_01" -ProcessorCount 2 

Add-VMDvdDrive -VMName "windows10_ENG_01" -Path C:\iso\Win10_22H2_English_x64v2.iso

#vmconnect localhost "windows10_ENG_01" /edit

## windows10_DK_01 VM

New-VM -Name "windows10_DK_01" -MemoryStartupBytes 10240mb -Generation 2 -Path C:\hyper-v\windows10_DK_01 -NewVHDPath C:\hyper-v\windows10_DK_01\windows10_DK_01.vhdx -NewVHDSizeBytes 125GB
 
Set-VM -Name "windows10_DK_01" -ProcessorCount 2 

Add-VMDvdDrive -VMName "windows10_DK_01" -Path  C:\iso\Win10_22H2_Dansk_x64v2.iso

#vmconnect localhost "windows10_DK_01" /edit

## Ad_windows10_DK VM

New-VM -Name "Ad_windows10_DK" -MemoryStartupBytes 10240mb -Generation 2 -Path C:\hyper-v\Ad_windows10_DK -NewVHDPath C:\hyper-v\Ad_windows10_DK\Ad_windows10_DK.vhdx -NewVHDSizeBytes 125GB
 
Set-VM -Name "Ad_windows10_DK" -ProcessorCount 2 

Add-VMDvdDrive -VMName "Ad_windows10_DK" -Path  C:\iso\Win10_22H2_Dansk_x64v2.iso

#vmconnect localhost "Ad_windows10_DK" /edit


######################################################################################################################
 
## windows11_ENG_01: HUSK! AT ENABLE TPM

New-VM -Name "windows11_ENG_01" -MemoryStartupBytes 8192mb -Generation 2 -Path C:\hyper-v\windows11_ENG_01 -NewVHDPath C:\hyper-v\windows11_ENG_01\windows11_ENG_01.vhdx -NewVHDSizeBytes 125GB
 
Set-VM -Name "windows11_ENG_01" -ProcessorCount 2 

Add-VMDvdDrive -VMName "windows11_ENG_01" -Path C:\iso\Win11_22H2_English_x64v2.iso

#vmconnect localhost "windows11_ENG_01" /edit

## windows11_DK_01: HUSK! AT ENABLE TPM

New-VM -Name "windows11_DK_01" -MemoryStartupBytes 8192mb -Generation 2 -Path C:\hyper-v\windows11_DK_01 -NewVHDPath C:\hyper-v\windows11_DK_01\windows11_DK_01.vhdx -NewVHDSizeBytes 125GB
 
Set-VM -Name "windows11_DK_01" -ProcessorCount 2 

Add-VMDvdDrive -VMName "windows11_DK_01" -Path C:\iso\Win11_22H2_Danish_x64v2.iso

# vmconnect localhost "windows11_DK_01" /edit


## Ad_windows11_DK: HUSK! AT ENABLE TPM

New-VM -Name "Ad_windows11_DK" -MemoryStartupBytes 8192mb -Generation 2 -Path C:\hyper-v\Ad_windows11_DK -NewVHDPath C:\hyper-v\Ad_windows11_DK\Ad_windows11_DK.vhdx -NewVHDSizeBytes 125GB
 
Set-VM -Name "Ad_windows11_DK" -ProcessorCount 2 

Add-VMDvdDrive -VMName "Ad_windows11_DK" -Path C:\iso\Win11_22H2_Danish_x64v2.iso

# vmconnect localhost "Ad_windows11_DK" /edit


######################################################################################################################

## win_server_gui_2012_01:

New-VM -Name "win_server_gui_2012_01" -MemoryStartupBytes 8192mb -Generation 2 -Path C:\hyper-v\win_server_gui_2012_01 -NewVHDPath C:\hyper-v\win_server_gui_2012_01\win_server_gui_2012_01.vhdx -NewVHDSizeBytes 125GB
 
Set-VM -Name "win_server_gui_2012_01" -ProcessorCount 2 

Add-VMDvdDrive -VMName "win_server_gui_2012_01" -Path C:\iso\win_Server_2012.ISO

#vmconnect localhost "win_server_gui_2012_01" /edit
 

## win_server_gui_2016_01:

New-VM -Name "win_server_gui_2016_01" -MemoryStartupBytes 8192mb -Generation 2 -Path C:\hyper-v\win_server_gui_2016_01 -NewVHDPath C:\hyper-v\win_server_gui_2016_01\win_server_gui_2016_01.vhdx -NewVHDSizeBytes 125GB
 
Set-VM -Name "win_server_gui_2016_01" -ProcessorCount 2 

Add-VMDvdDrive -VMName "win_server_gui_2016_01" -Path C:\iso\Win_Server_2016.iso

#vmconnect localhost "win_server_gui_2016_01" /edit


## win_server_gui_2019_01:

New-VM -Name "win_server_gui_2019_01" -MemoryStartupBytes 8192mb -Generation 2 -Path C:\hyper-v\win_server_gui_2019_01 -NewVHDPath C:\hyper-v\win_server_gui_2019_01\win_server_gui_2019_01.vhdx -NewVHDSizeBytes 125GB
 
Set-VM -Name "win_server_gui_2019_01" -ProcessorCount 2 

Add-VMDvdDrive -VMName "win_server_gui_2019_01" -Path C:\iso\server2019.iso

## Add HD 2 

# New-VHD -Path C:\hyper-v\win_server_gui_2019_01\win_server_gui_2019_01_02.vhdx -SizeBytes 125Gb -Dynamic

# Add-VMHardDiskDrive -VMName "win_server_gui_2019_01" -Path C:\hyper-v\win_server_gui_2019_01\win_server_gui_2019_01_02.vhdx


#vmconnect localhost "win_server_gui_2019_01" /edit

## win_server_gui_2019_02:

New-VM -Name "win_server_gui_2019_02" -MemoryStartupBytes 8192mb -Generation 2 -Path C:\hyper-v\win_server_gui_2019_02 -NewVHDPath C:\hyper-v\win_server_gui_2019_02\win_server_gui_2019_02.vhdx -NewVHDSizeBytes 125GB
 
Set-VM -Name "win_server_gui_2019_02" -ProcessorCount 2 

Add-VMDvdDrive -VMName "win_server_gui_2019_02" -Path C:\iso\server2019.iso

#vmconnect localhost "win_server_gui_2019_01" /edit

## Add HD 2 

New-VHD -Path C:\hyper-v\win_server_gui_2019_02\win_server_gui_2019_02_02.vhdx -SizeBytes 125Gb -Dynamic

Add-VMHardDiskDrive -VMName "win_server_gui_2019_02" -Path C:\hyper-v\win_server_gui_2019_02\win_server_gui_2019_02_02.vhdx

## win_server_gui_2022_01:

New-VM -Name "win_server_gui_2022_01" -MemoryStartupBytes 8192mb -Generation 2 -Path C:\hyper-v\win_server_gui_2022_01 -NewVHDPath C:s\hyper-v\win_server_gui_2022_01\win_server_gui_2022_01.vhdx -NewVHDSizeBytes 125GB
 
Set-VM -Name "win_server_gui_2022_01" -ProcessorCount 2 

Add-VMDvdDrive -VMName "win_server_gui_2022_01" -Path C:\Users\cli\Documents\iso\win_server_2022.iso

#vmconnect localhost "win_server_gui_2022_01" /edit


######################################################################################################################


## ubuntu_gui_22_04_01:

New-VM -Name "ubuntu_gui_22_04_01" -MemoryStartupBytes 8192mb -Generation 1 -Path C:\hyper-v\ubuntu_gui_22_04_01 -NewVHDPath C:\hyper-v\ubuntu_gui_22_04_01\ubuntu_gui_22_04_01.vhdx -NewVHDSizeBytes 125GB
 
Set-VM -Name "ubuntu_gui_22_04_01" -ProcessorCount 2 

Add-VMDvdDrive -VMName "ubuntu_gui_22_04_01" -Path C:\iso\ubuntu_gui_22_04.iso

#vmconnect localhost "win_server_gui_2019_01" /edit


######################################################################################################################


## ubuntu_core_22_04:


New-VM -Name "ubuntu_core_22_04" -MemoryStartupBytes 8192mb -Generation 1 -Path C:\hyper-v\ubuntu_core_22_04 -NewVHDPath C:\ubuntu_core_22_04\ubuntu_core_22_04.vhdx -NewVHDSizeBytes 50GB
 
Set-VM -Name "ubuntu_core_22_04" -ProcessorCount 1 

Add-VMDvdDrive -VMName "ubuntu_core_22_04" -Path C:\iso\ubuntu-22.04.1-desktop-amd64.iso

#vmconnect localhost "ubuntu_core_22_04" /edit






\Users\cli\Document