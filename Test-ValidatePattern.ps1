[CmdletBinding()]
Param(
    [ValidateScript({
        If ($_ -Match '^[\w-.]+$'){
            $True
        }Else{
            Throw "$_ is not a valid domain name, please provide an alphanumeric string value."
        }
    })]
    $Message = 'Not Set'
)
Write-Output "Hello World $Message!"
