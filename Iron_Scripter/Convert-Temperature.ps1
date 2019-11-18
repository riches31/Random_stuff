<#
.SYNOPSIS
Converts temperature between Celsius and Fahrenheit.

.DESCRIPTION
Converts temperature from Celsius to Fahrenheit or Fahrenheit to Celsius.

.PARAMETER Temperature
The Temperature(s) to convert from.

.PARAMETER ToCelsius
Converts from Fahrenheit to Celsius

.PARAMETER ToFahrenheit
Converts from Celsius to Fahrenheit

.EXAMPLE
Convert-Temperature 98
Converts 98 degrees Fahrenheit to Celsius

.EXAMPLE
Convert-Temperature 37 -ToFahrenheit
Converts 37 degrees Celsius to Fahrenheit

.EXAMPLE
$Temperatures | Convert-Temperature -ToFahrenheit
Converts a collection of temperatures from Celsius to Fahrenheit

.OUTPUTS
Temperature

.NOTES
Author: Peter Östman

.LINK
#>


[CmdletBinding(DefaultParameterSetName='ToCelsius')]

param (
    [Parameter(Mandatory = $true, 
            Position = 0, 
            ParameterSetName = 'ToFahrenheit', 
            ValueFromPipeline = $true)
            ]
    [Parameter(Mandatory = $true, 
            Position = 0, 
            ParameterSetName = 'ToCelsius', 
            ValueFromPipeline = $true)
            ]
    [Single[]]$Temperature,

    [Parameter(ParameterSetName = 'ToFahrenheit')]
    [Switch]$ToFahrenheit,

    [Parameter(ParameterSetName = 'ToCelsius')]
    [Switch]$ToCelsius
)#Param

Begin{

}#Begin

Process{
    Function ConvertTo-Celsius{
        Param(
            $Temperature
        )#Param
        $NewTemperature = ($($Temperature)-32)/1.8
        Return $NewTemperature
    }#Function
    
    Function ConvertTo-Fahrenheit{
        Param(
            $Temperature
        )
        $NewTemperature = ($($Temperature)*1.8)+32
        Return $NewTemperature
    }#Function

    #Being control section
    If ($ToFahrenheit){
        $NewTemperature = ConvertTo-Fahrenheit -Temperature $Temperature
    }Else {
        $NewTemperature = ConvertTo-Celsius -Temperature $Temperature
    }#If

    Write-Output $NewTemperature
}#Process

End{

}#End


