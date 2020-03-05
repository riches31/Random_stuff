#Create a JSON-list

$Host1 = New-Object -TypeName PSCustomObject @{
    Name = "host1"
    Tags = "DC-A,ANKEBORG,WINDOWS,PROD,SQL"
}
$Host2 = New-Object -TypeName PSCustomObject @{
    Name = "host2"
    Tags = "DC-A,ANKEBORG,WINDOWS,TEST"
}

$Host3 = New-Object -TypeName PSCustomObject @{
    Name = "host3"
    Tags = "DC-A,ANKEBORG,WINDOWS,DEV"
}

$Host4 = New-Object -TypeName PSCustomObject @{
    Name = "host4"
    Tags = "DC-A,ANKEBORG,WINDOWS,PROD"
}

$Host5 = New-Object -TypeName PSCustomObject @{
    Name = "host5"
    Tags = "DC-A,ANKEBORG,WINDOWS,DEV,SQL"
}




$Hosts =@($Host1, $Host2,$Host3,$Host4,$Host5)
$Hosts | ConvertTo-Json | Out-file .\hosts.json