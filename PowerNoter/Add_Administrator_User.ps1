
## DK $PS Administratorer

$Password = Read-Host -AsSecureString
New-LocalUser "cli_02" -Password $Password -FullName "cli_02" 
Add-LocalGroupMember -Group "Administratorer" -Member "cli_02"

Restart-Computer 

## CTR ALT DEL
 Powershell -noprofile -nologo -noninteractive -command “(new-object -ComObject shell.application).WindowsSecurity()”


## USA $PS Administrators

$Password = Read-Host -AsSecureString
New-LocalUser "cli_02" -Password $Password -FullName "cli_02" 
Add-LocalGroupMember -Group "Administrators" -Member "cli_02"

Restart-Computer 

## CTR ALT DEL
# Powershell -noprofile -nologo -noninteractive -command “(new-object -ComObject shell.application).WindowsSecurity()”

## get users 

net users 





