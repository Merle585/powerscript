## Add a user to a local grup (G)

Add-ADGroupMember -Identity "GroupName" -Members "Username"

## Add all from a ou to a local-grup  (G)

Get-ADUser -Filter * -SearchBase "OU=Users,DC=example,DC=com" | ForEach-Object { Add-ADGroupMember -Identity "GroupName" -Members $_.sAMAccountName }