#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

#Administrator access is not needed if your account is member of the 'Performance Log Users' local group.
#Comment below requires statement if this is the case.
#Requires -RunAsAdministrator

Write-Output "Starting light general capture."
Pause

wpr.exe -setprofint 100000
wpr.exe -start ..\Profiles\General-CPU-DiskIO-WS-Light-Circular-500MB.wprp

#Set profile interval back to default
wpr.exe -setprofint 10000

Write-Host ("To stop tracing run :wpr.exe -skipPdbGen -stop <filename.etl>") -ForegroundColor Green
