#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

#Administrator access is not needed if your account is member of the 'Performance Log Users' local group.
#Comment below requires statement if this is the case.
#Requires -RunAsAdministrator

Write-Output "Starting verbose Kernel CPU capture. This trace uses ~10MB per second of runtime."
Pause

#Set the CPU profiling slower, 1s, still good enough for general CPU usage. Max is 10,000,000 (10s). Default 10,000 (1ms)
wpr.exe -setprofint 10000
wpr.exe -start ..\Profiles\General-KernelCPU-Verbose-Circular-4GB.wprp

#Set profile interval back to default
wpr.exe -setprofint 10000

Write-Host ("To stop tracing run :wpr.exe -skipPdbGen -stop <filename.etl>") -ForegroundColor Green
