#2023 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

#Administrator access is not needed if your account is member of the 'Performance Log Users' local group.
#Comment below requires statement if this is the case.
#Requires -RunAsAdministrator

Write-Output "Starting DNS Server Events capture. Captures ~4MB per second. Open .etl in Event Viewer for DNS events."
Pause

#Set the CPU profiling slower, 1s, still good enough for general CPU usage. Max is 10,000,000 (10s).
wpr.exe -setprofint 1000000
wpr.exe -start ..\Profiles\DNSServer-Light-Circular-1GB.wprp

#Set profile interval back to default
wpr.exe -setprofint 10000

Write-Host ("To stop tracing run :wpr.exe -skipPdbGen -stop <filename.etl>") -ForegroundColor Green
