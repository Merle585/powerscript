## Get file and folder permissions

[System.Enum]::GetNames([System.Security.AccessControl.FileSystemRights])

#############################################################

## Shared Folder

New-SmbShare -Path "E:\Firma1" -Name "Firma1"

## Get Permissions no a folder ot file 

(Get-ACL -Path "E:\Firma1").Access | Format-Table IdentityReference,FileSystemRights,AccessControlType,IsInherited,InheritanceFlags -AutoSize


# Get-ADGroup distinguishedname:

Get-ADGroup -Filter "Name -like '*'" | ft


#############################################################

## Folde Firma1:

## Shared Folder

New-SmbShare -Path "E:\Firma1" -Name "Firma1"

## Everyone none on Firma1 folder:

$current_acls = Get-Acl "E:\Firma1"
$access_rule = New-Object  System.Security.AccessControl.FileSystemAccessRule("everyone","full","ContainerInherit,Objectinherit","none","Allow")
$current_acls.RemoveAccessRule($access_rule)

## Authenticated Users','FullControl on  Firma1 folde:

Set-Acl "E:\Firma1" $current_acls
$acl = get-acl  -Path "E:\Firma1"
$ace = new-object system.security.AccessControl.FileSystemAccessRule('Authenticated Users','FullControl','Allow')
$acl.AddAccessRule($ace)
$acl | Set-Acl

#############################################################


# Get-ADGroup distinguishedname:

Get-ADGroup -Filter "Name -like '*'" | ft

##DL-Direktion Modify:

$acl = Get-Acl -Path 'E:\Firma1\Direktion'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Direktion","Modify","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Direktion'

## DL-Salgafdeling Modify:

$acl = Get-Acl -Path 'E:\Firma1\Salgafdeling'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Salgafdeling","Modify","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Salgafdeling'


## DL-Indkøbafdeling Modify:

$acl = Get-Acl -Path 'E:\Firma1\Indkøbafdeling'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Indkøbafdeling","Modify","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Indkøbafdeling'


## DL-Administrator_Afd Modify:

$acl = Get-Acl -Path 'E:\Firma1\Administrator_Afd'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Administrator_Afd","Modify","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Administrator_Afd'

## DL-Personaleafdeling Modify:

$acl = Get-Acl -Path 'E:\Firma1\Personaleafdeling'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Personaleafdeling","Modify","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Personaleafdeling'

## DL-Økonmiafdelen Modify:

$acl = Get-Acl -Path 'E:\Firma1\Økonmiafdelen'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Økonmiafdelen","Modify","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Økonmiafdelen'

## DL-IT_Afdeling Modify:

$acl = Get-Acl -Path 'E:\Firma1\IT'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-IT_Afdeling","Modify","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\IT'

## DL-Produkions Modify:

$acl = Get-Acl -Path 'E:\Firma1\Produktion_Afd\Produktion'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Produkions","Modify","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Produktion_Afd\Produktion'



## DL-Reparation Modify:

$acl = Get-Acl -Path 'E:\Firma1\Produktion_Afd\Reparation'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Reparation","Modify","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Produktion_Afd\Reparation'



## DL-Lager Modify:

$acl = Get-Acl -Path 'E:\Firma1\Produktion_Afd\Lager'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Lager","Modify","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Produktion_Afd\Lager'


## DL-Manualer ReadAndExecute:

$acl = Get-Acl -Path 'E:\Firma1\Manualer'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Manualer","ReadAndExecute","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Manualer'


## DL-Manualer_M Modify:

$acl = Get-Acl-Path 'E:\Firma1\Manualer'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Manualer_M","Modify","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Manualer'


## DL-AdminOpgave Modify:

$acl = Get-Acl -Path 'E:\Firma1\AdminOpgave'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-AdminOpgave","Modify","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\AdminOpgave'


## DL-Progammer ReadAndExecute:

$acl = Get-Acl -Path 'E:\Firma1\Progammer'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Progammer","ReadAndExecute","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Progammer'



## DL-Progammer_M Modify:

$acl = Get-Acl -Path 'E:\Firma1\Progammer'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Progammer","Modify","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Progammer'


## DL-Ledelse, Modify:

$acl = Get-Acl -Path 'E:\Firma1\Ledelse'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Ledelse","Modify","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Ledelse'

## DL-Bestyrelsesmøde, Modify:

$acl = Get-Acl -Path 'E:\Firma1\Bestyrelsesmøde'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Bestyrelsesmøde","Modify","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Bestyrelsesmøde'


## DL-Bestyrelsesmøde ReadAndExecute:

$acl = Get-Acl -Path 'E:\Firma1\Bestyrelsesmøde'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Bestyrelsesmøde_RX","ReadAndExecute","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Bestyrelsesmøde'

## DL-Reparationsedler, Modify:

$acl = Get-Acl -Path 'E:\Firma1\Reparationsedler'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Reparationsedler","Modify","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Reparationsedler'

## DL-Personaleforening, Modify:

$acl = Get-Acl -Path 'E:\Firma1\Personaleforening'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Personaleforening","Modify","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Personaleforening'

## DL-Personaleforening ReadAndExecute:

$acl = Get-Acl -Path 'E:\Firma1\Personaleforening'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Personaleforening_RX","ReadAndExecute","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Personaleforening'

## DL-Personalsager, Modify:

$acl = Get-Acl -Path 'E:\Firma1\Personalsager'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Personalsager","Modify","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Personalsager'

## DL-Elevlærling, Modify:

$acl = Get-Acl -Path 'E:\Firma1\Elevlærling'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-Elevlærling","Modify","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\Elevlærling'

## DL-WEB, Modify:

$acl = Get-Acl -Path 'E:\Firma1\WEB'
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DL-WEB","Modify","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'E:\Firma1\WEB'