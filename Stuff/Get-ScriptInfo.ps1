function Get-Fileinfo{
    [OutputType([System.IO.FileInfo])]
    [CmdletBinding()]

    param()

    DynamicParam{
        $ParamAttrib  = New-Object System.Management.Automation.ParameterAttribute
        $ParamAttrib.Mandatory  = $true
        $ParamAttrib.ParameterSetName  = '__AllParameterSets'
        $AttribColl = New-Object  System.Collections.ObjectModel.Collection[System.Attribute]
        $AttribColl.Add($ParamAttrib)
        $configurationFileNames  = Get-ChildItem -Path 'C:\ConfigurationFiles' | Select-Object -ExpandProperty  Name
        $AttribColl.Add((New-Object  System.Management.Automation.ValidateSetAttribute($configurationFileNames)))
        $RuntimeParam  = New-Object System.Management.Automation.RuntimeDefinedParameter('FileName',  [string], $AttribColl)
        $RuntimeParamDic  = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
        $RuntimeParamDic.Add('FileName',  $RuntimeParam)
        Return  $RuntimeParamDic
    }

    process{
        $configFileFolder  = 'C:\ConfigurationFiles'
        Get-ChildItem  -Path $configFileFolder -Filter "$($PSBoundParameters.FileName).ps1"
    }
}