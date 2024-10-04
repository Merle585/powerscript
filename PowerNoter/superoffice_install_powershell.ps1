
## Dowload program:

$source ='https://www3.superoffice.com/DownloadService/download/?component=maillink&osType=windows&serverVersion=1.0'
$destination = 'C:\Users\*\Downloads\SuperOffice.MailLink.Setup.exe'
Start-BitsTransfer -Source $source -Destination $destination

## Install program .exe: 

$Arguments = @(
    "/S"
    "/V/qn"
    )
Start-Process -FilePath  'C:\Users\*\Downloads\SuperOffice.MailLink.Setup.exe' -ArgumentList $Arguments -Wait -NoNewWindow



# start -Wait -ArgumentList "/silent"  -PassThru -FilePath 'C:\Users\*\Downloads\SuperOffice.MailLink.Setup.exe'

# Start-Process -Wait -ArgumentList "/silent" -PassThru -FilePath   'C:\Users\*\Downloads\SuperOffice.MailLink.Setup.exe' 

# Start-Process -Wait -FilePath  'C:\Users\*\Downloads\SuperOffice.MailLink.Setup.exe'  -ArgumentList '/S','/v','/qn' -passthru

