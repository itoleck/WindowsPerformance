#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

#Administrator access is not needed if your account is member of the 'Performance Log Users' local group.
#Comment below requires statement if this is the case.
#Requires -RunAsAdministrator

#Set the CPU profiling to the slowest possible, 100ms, still good enough for general CPU usage.
wpr.exe -setprofint 1000000
wpr.exe -start ..\Profiles\General-CPU-Light-Circular-500MB.wprp

Write-Host ("To stop tracing run :wpr.exe -stop <filename.etl>") -ForegroundColor Green
