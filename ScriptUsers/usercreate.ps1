Write-Host `CREACIÓN DE USUARIOS CON CSV`

Import-Csv -Delimiter ";" -Path ".\usuarios.csv" | ForEach-Object {

<# Cogemos como variables la primera linea de cada columna que serán los datos de los usuarios #>


$GivenName=$_.GivenName
$Surname=$_.Surname
$Name=$_.Name
$DisplayName=$_.DisplayName
$Password=$_.Password
$Upn=$User+'@'+'intruders.local'
$User=$_.SamAccountName
$enc_pasword=(ConvertTo-SecureString -AsPlainText $Password -Force)

New-ADUser -Name $Name -GivenName $GivenName -Surname $Surname -SamAccountName $User -UserPrincipalName $Upn -Enable $true -AccountPassword $enc_pasword -Path "OU=testers,DC=intruders,DC=local"


}

