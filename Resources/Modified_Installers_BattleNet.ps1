If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
    Start-Process PowerShell.exe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
    Exit
}

# Battle.net installation
function Get-FileFromWeb {
    param ([string]$URL, [string]$File)
    Invoke-WebRequest -Uri $URL -OutFile $File
}

# Download and install Battle.net
$BattleNetURL = "https://www.battle.net/download/getInstaller?os=win"
$BattleNetInstaller = "$env:TEMP\BattleNetSetup.exe"

# Suppress output
Get-FileFromWeb -URL $BattleNetURL -File $BattleNetInstaller
Start-Process -Wait $BattleNetInstaller -ArgumentList "/S"

# End of script
