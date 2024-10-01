@echo off

cls
:: allow double-click powershell scripts
reg add "HKCR\Applications\powershell.exe\shell\open\command" /ve /t REG_SZ /d "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoLogo -ExecutionPolicy unrestricted -File \"%%1\"" /f >nul 2>&1
:: allow powershell scripts
reg add "HKCU\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell" /v "ExecutionPolicy" /t REG_SZ /d "Unrestricted" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell" /v "ExecutionPolicy" /t REG_SZ /d "Unrestricted" /f >nul 2>&1
:: unblock all files in the Temp folder
powershell -Command "$TempPath = [System.IO.Path]::GetTempPath(); Get-ChildItem -Path $TempPath -Recurse | Unblock-File"
exit
