#requires –RunAsAdministrator

#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

Write-Host "Run this script to stop and save any running boot trace/autologger session."

wpr.exe -boottrace -stopboot $env:TEMP\boottrace.etl "SBSL trace ran from https://github.com/itoleck/WindowsPerformance/ETW/Tools/WPT/WPR/CaptureScripts/"
