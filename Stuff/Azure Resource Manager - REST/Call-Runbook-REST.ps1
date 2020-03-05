#Setting some constants
$TennantID = 'EnterYourHere'
$SubscriptionID = 'EnterYourHere'
$ResourceGroup = 'EnterYourHere'
$AutomationAccountName = 'EnterYourHere'
$ApiVersion = "2015-10-31"

$TokenEndpoint = {https://login.windows.net/{0}/oauth2/token} -f $tenantid
$ARMResource = "https://management.core.windows.net/";

$Body = @{
    'resource'= $ARMResource
    'client_id' = $ClientID
    'grant_type' = 'client_credentials'
    'client_secret' = $ClientSecret
}










$URI = 	"https://management.azure.com/subscriptions/$SubscriptionID/resourceGroups/$ResourceGroup/providers/Microsoft.Automation/automationAccounts/$AutomationAccountName/runbooks?api-version=$ApiVersion"

Invoke-WebRequest $URI

