﻿
## Add Users

## Creating AD Users from CSV with Powershell | ServerAcademy.com
## Link: https://www.youtube.com/watch?v=9WAcQE-Q9xo&ab_channel=ServerAcademy

## New-ADUser

## Link https://learn.microsoft.com/en-us/powershell/module/activedirectory/new-aduser?view=windowsserver2022-ps

## Import required modules 

Import-Module ActiveDirectory

## Prompt user for CSV file pathe

$filepath = Read-Host -Prompt "Enter the path to CSV file"

## Import file into into a variable

$Users = Import-Csv $filepath

## Loop Through eash row and gathar information 

ForEach ($user in $users) {
    

    # Gather the user`s information

    $Fullname = $user. 'Name'
    $Fname = $user. 'First Name'
    $Lname = $user. 'Last Name'
    $Logname = $user. 'Logoin Name'  
    $Uname = $user. 'User Name'
    $Jtittle = $user.'Job Title'
    $Dname = $user.'Display Name'
    $desciper = $user. 'Description'
    $email = $user.'Email '
    $OUpath = $user.'Organizational Unit'
    $password = $user. 'Password'

    # Create New Ad User for each user in CSV file 

    New-ADUser -Name "$Fullname" -GivenName "$Fname" -Surname "$Lname" -UserPrincipalName "$Logname" -DisplayName "$Dname" -EmailAddress "$email" -Path "$OUpath" -Description $desciper   -AccountPassword (ConvertTo-SecureString "$password" -AsPlainText -Force)  -ChangePasswordAtLogon $false -Enabled $true



    echo $Fullname $Fname $Lname $Logname $Uname $Jtittle $Dname $desciper $email $OUpath  $password
}
 # echo "Account created for $Fname $Lname $OUpath "





}





}

