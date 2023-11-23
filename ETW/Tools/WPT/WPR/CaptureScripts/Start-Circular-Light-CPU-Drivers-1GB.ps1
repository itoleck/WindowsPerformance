#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

#Administrator access is not needed if your account is member of the 'Performance Log Users' local group.
#Comment below requires statement if this is the case.
#Requires -RunAsAdministrator

Write-Output "Start drivers capture."
Pause

#Set the CPU profiling slower, 1ms, still good enough for general CPU usage. Max is 10,000,000 (10s). Default 10,000 (1ms)
wpr.exe -setprofint 10000
wpr.exe -start ..\Profiles\General-CPU-Drivers-Light-Circular-1GB.wprp

#Set profile interval back to default
wpr.exe -setprofint 10000

Write-Host ("To stop tracing run :wpr.exe -skipPdbGen -stop <filename.etl>") -ForegroundColor Green