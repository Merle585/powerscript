$InstallerPath = "C:\Program Files\Microsoft Office 15\ClientX64\OfficeClickToRun.exe"
$RepairArgs = "scenario=Repair system=x64 culture=en-us RepairType=FullRepair DisplayLevel=True"
Start-Process -FilePath $InstallerPath -ArgumentList $RepairArgs -Wait
