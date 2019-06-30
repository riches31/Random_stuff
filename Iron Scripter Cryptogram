Function Start-Decryption {
param (
    [int32]$X,
    [int32]$Y
)
$string = ""
$i=$x-1
$string += $crypto[$i]

Do{
        $i += $Y
        $string += $crypto[$i]
        $i += $x
        $string += $crypto[$i]
    }Until ($i -gt $crypto.Length)

        Write-host $string -ForegroundColor Red
}

$crypto = @"
P k T r 2 s z 2 * c F -
r a z 7 G u D 4 w 6 U #
g c t K 3 E @ B t 1 a Y
Q P i c % 7 0 5 Z v A e
W 6 j e P R f p m I ) H
y ^ L o o w C n b J d O
S i 9 M b e r # ) i e U
* f 2 Z 6 M S h 7 V u D
5 a ( h s v 8 e l 1 o W
Z O 7 l p K y J l D z $
- j I @ t T 2 3 R a i k
q = F & w B 6 c % H l y
"@

$crypto = $crypto.Replace("`n"," ")
$crypto = $crypto.Replace("`r"," ")
$crypto = $crypto.Replace(" ", "")

for ($i=1;$i -le 15;$i++) {
    For($j=1;$j -le 15;$j++){
            $X=$i
            $Y=$j
            Write-Host "Using $X & $Y" -ForegroundColor Green
            Start-Decryption -X $X -Y $Y
        }
    }
