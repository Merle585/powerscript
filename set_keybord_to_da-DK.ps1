# Get the current list of user languages
$LanguageList = Get-WinUserLanguageList

# Add Danish (Denmark) to the language list
$LanguageList.Add("da-DK")

# Apply the updated language list
Set-WinUserLanguageList $LanguageList

Get-WinUserLanguageList


