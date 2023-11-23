#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

#Administrator access is not needed if your account is member of the 'Performance Log Users' local group.
#Comment below requires statement if this is the case.
#Requires -RunAsAdministrator

Write-Output "Run this script to stop and save any running boot trace/autologger session."

wpr.exe -boottrace -stopboot $env:TEMP\boottrace.etl "SBSL trace ran from https://github.com/itoleck/WindowsPerformance/ETW/Tools/WPT/WPR/CaptureScripts/"
