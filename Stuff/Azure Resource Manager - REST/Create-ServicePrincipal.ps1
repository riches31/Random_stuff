#region variables
$ADApplicationName = 'EnterYourHere'
$HomePage = 'EnterYourURLHere'
$ADApplicationPassword = (ConvertTo-SecureString -String "EnterYourHere!" -AsPlainText -Force)
#endregion

#region Login to Azure
Add-AzureRmAccount
 
#Select Azure Subscription
$subscription = (Get-AzureRmSubscription -SubscriptionName EnterYourHere)
Set-AzureRmContext -Subscription $subscription.Id -Tenant $subscription.TenantID
Select-AzureRmSubscription -SubscriptionObject $Subscription
#endregion

#region create SPN with Password
$App = New-AzureRmADApplication -DisplayName "EnterYourHere" -HomePage $ADApplicationName -IdentifierUris $HomePage -Password $ADApplicationPassword -OutVariable app
New-AzureRmADServicePrincipal -ApplicationId $app.ApplicationId
New-AzureRmRoleAssignment -RoleDefinitionName Contributor -ServicePrincipalName $app.ApplicationId.Guid

Get-AzureRmADApplication -DisplayNameStartWith 'EnterYourHere' -OutVariable app
Get-AzureRmADServicePrincipal -ServicePrincipalName $app.ApplicationId.Guid -OutVariable SPN
#endregion