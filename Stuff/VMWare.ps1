$VIServer =@("vcenter1", "vcenter2", "vcenter3")

$Folder = "Global"
$Template
$Credentials = Get-Credential
$Datacenter = "MyDC"

Import-Module VMware.VimAutomation.Cis.Core, VMware.VimAutomation.Core

Set-PowerCLIConfiguration -DefaultVIServerMode Multiple -Scope Session -InvalidCertificateAction Ignore -Confirm:$false
Connect-VIServer $VIServer -Credential $Credentials
Get-VM -name MyVM
Get-Datacenter $Datacenter
Get-Datastore -Location (Get-Datacenter $Datacenter) | Where-Object {$_.Name -notlike "*LOCAL*"} | Where-Object {$_.State -ne "Maintenance"} | Sort-Object FreeSpaceGB -Descending
$DataStore = (Get-Datastore -Location (Get-Datacenter $Datacenter) | Where-Object {$_.Name -notlike "*LOCAL*"} | Where-Object {$_.State -ne "Maintenance"} | Sort-Object FreeSpaceGB -Descending)[0]
$DataStore

$EsxHost = (Get-VMHost -Location (Get-Datacenter $Datacenter) | Sort-Object CpuUsageMhz,MemoryUsageGB)[0]
$Location = Get-Folder -Name $Folder -Location (Get-Datacenter $Datacenter)

Disconnect-VIServer * -Confirm:$false

<#
Here are some examples with Powercli (please note that the tags themselves are case-sensitive).

Listing  all Vm's with the single tag Windows:
Get-VM -Tag Windows

List all Vm's with either tags DC-1, DC-2 or DC-3
Get-VM -Tag DC-1,DC-2,DC-3

List all Vm's with tags Windows and Prod and DC-A
$VMs = Get-TagAssignment (Get-VM -Tag Windows)
$VMs = $VMs | Where-Object {
                    $_.Tag -match 'Prod'
                    -and
                    $_.Tag -match 'DC-'1                  
                }#Where-Object
Get-VM $VMs.Entity.Name


List all tags assigned to the VM MyServer
get-vm MyServer | get-tagassignment

Get-tag
get-vm -tag "1,2,3"
get-vm -tag MyTag | get-tagassignment
#>

# Skjuta in ett script i en VM:
# Invoke-VMScript