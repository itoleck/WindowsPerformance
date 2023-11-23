#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

#Administrator access is not needed if your account is member of the 'Performance Log Users' local group.
#Comment below requires statement if this is the case.
#Requires -RunAsAdministrator

Write-Output "Start Windows Update Troubleshooting capture. Open .etl in Event Viewer for Windows Update events."
Pause

#Set the CPU profiling slower, 1ms, still good enough for general CPU usage. Max is 10,000,000 (10s). Default 10,000 (1ms)
wpr.exe -setprofint 1000000
wpr.exe -start ..\Profiles\General-WindowsUpdateTroubleshooting.wprp

#Set profile interval back to default
wpr.exe -setprofint 10000

Write-Host ("To stop tracing run :wpr.exe -stop <filename.etl>") -ForegroundColor Green