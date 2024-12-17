
## Changing Product Key to Upgrade Edition

## clear the product key 

slmgr.vbs /cpky

slmgr.vbs /ckms


##  activate product key

slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX

## Get product key 

(Get-WmiObject -query 'select * from SoftwareLicensingService').OA3xOriginalProductKey

## Restart computer 

Restart-Computer 