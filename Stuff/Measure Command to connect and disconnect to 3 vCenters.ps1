$Credentials = Get-Credential
Measure-Command -Expression {
$VIServer =@("vcenter1", "vcenter2", "vcenter3")
Import-Module VMware.VimAutomation.Cis.Core, VMware.VimAutomation.Core
Set-PowerCLIConfiguration -DefaultVIServerMode Multiple -Scope Session -InvalidCertificateAction Ignore -Confirm:$false
Connect-VIServer $VIServer -Credential $Credentials
Disconnect-VIServer * -Confirm:$false
}