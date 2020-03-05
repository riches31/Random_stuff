
#Requires -Version 5.0

<#
Written by Peter Östman
To use the functions in this module, use the Import-Module command followed by the path to this file. For example:
Import-Module C:\files\Coffee.psm1
You can also place the .psm1 file in one of the locations PowerShell searches for available modules to import.
These paths can be found in the $env:PSModulePath variable.A common path is C:\Users\<UserID>\Documents\WindowsPowerShell\Modules
Any and all technical advice, scripts, and documentation are provided as is with no guarantee.
Always review any code and steps before applying to a production system to understand their full impact.
Version Notes
V1.0 - 01/2/2020 - Initial Version
#>

# *** Exported Functions ***

Function Get-Coffee {
    <#
    .SYNOPSIS
    Gets Coffee

    .DESCRIPTION
    Writes that the computer will provide you with Coffe, but it's all just a lie!

    .PARAMETER Strength
    The strength of your coffee.

    .PARAMETER Milk
    Add milk?

    .EXAMPLE
    Get-Coffee -Strength Strong -Milk $True
    Example 1 will write "Strong Coffee, Milk: True" in green text.

    .EXAMPLE
    Get-Coffee -Strength Medium
    Example 2 will write "Medium Coffee, Milk: False" in green text.

    .NOTES
    This is just a test function for teaching purposes.
    #>

    Param ($Strength, [Boolean]$Milk)

    Process
        {
        Write-host $Strength "Coffee, Milk:" $Milk -ForegroundColor Green
        }
}

Function Set-Coffee {
    <#
    .SYNOPSIS
    Sets coffee preferences.

    .DESCRIPTION
    Sets your coffee preferences and writes to screen.

    .PARAMETER Strength
    The strength of your coffee.

    .PARAMETER Milk
    Add milk?

    .EXAMPLE
    Set-Coffee -Strength Strong -Milk $True
    Example 1 will write "Setting Strong Coffee, Milk: True" in green text.

    .EXAMPLE
    Set-Coffee -Strength Medium
    Example 2 will write "Setting Medium Coffee, Milk: False" in green text.

    .NOTES
    This is just a test function for teaching purposes.
    #>

    [CmdletBinding(SupportsShouldProcess=$True)]
    Param ($Strength, [Boolean]$Milk)

    Process
        {
        If ($PSCmdlet.ShouldProcess("Will write: 'Setting $Strength Coffee, Milk: $Milk', in green text to console")){
            Write-host "Setting $Strength Coffee, Milk: $Milk" -ForegroundColor Green}
        }
}
Export-ModuleMember -Function Get-Coffee, Set-Coffee
