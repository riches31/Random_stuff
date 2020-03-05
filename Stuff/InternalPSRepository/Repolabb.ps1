#Sätt lite repoparametrar

$RepoParam = @{
    Name = 'EnterYourHere'
    SourceLocation ='\\EnterYourHere'
    PublishLocation = '\\EnterYourHere'
    InstallationPolicy = 'Trusted'
}

#Registrera repot i din lokala powershell.
Register-PSRepository @RepoParam

#Publicera moduler till repot
#Do web request over TLS1.2 and Publish Module on local PSRepository
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Publish-Module -Path '.\Coffee\' -Repository 'EnterYourHere' -Force


#För att installera från Repot
#Kolla vilka moduler som ligger i lokala repot.
Find-Module -Repository EnterYourHere

#Installera min PoC modul "Coffee"
Find-Module -Repository EnterYourHere -name Coffee | Install-Module -Scope CurrentUser

#Kolla att modulen blev installerad och vilka funktioner (kommandon) som exporteras av den.
Get-Module -Name Coffee

#Testa mina lama kommandon.
Get-Coffee -Strength Strong -Withmilk
Set-Coffee -Strength Medium -WhatIf
Set-Coffee -Strength Medium