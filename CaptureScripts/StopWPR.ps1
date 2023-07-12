#2023 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

#Check Administrator access.
#Requires -RunAsAdministrator

$r = Get-Random
$path = $env:TEMP + "\" + $r.Tostring() + ".etl"
Wpr.exe -stop $path
Write-Output 'Trace saved at ' + $path