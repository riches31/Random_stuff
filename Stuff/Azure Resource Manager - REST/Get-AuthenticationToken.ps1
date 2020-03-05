#Setting some constants
$TennantID = 'EnterYourHere'

#Azure Authtentication Token

#requires -Version 3
#SPN ClientId and Secret
$ClientID       = "clientid" #ApplicationID
$ClientSecret   = "ClientSecret"  #key from Application
 
$TokenEndpoint = {https://login.windows.net/{0}/oauth2/token} -f $tenantid 
$ARMResource = "https://management.core.windows.net/";

$Body = @{
        'resource'= $ARMResource
        'client_id' = $ClientID
        'grant_type' = 'client_credentials'
        'client_secret' = $ClientSecret
}

$params = @{
    ContentType = 'application/x-www-form-urlencoded'
    Headers = @{'accept'='application/json'}
    Body = $Body
    Method = 'Post'
    URI = $TokenEndpoint
}

$token = Invoke-RestMethod @params

$token | select access_token, @{L='Expires';E={[timezone]::CurrentTimeZone.ToLocalTime(([datetime]'1/1/1970').AddSeconds($_.expires_on))}} | fl *



