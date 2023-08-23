#requires –RunAsAdministrator

#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

Write-Host "Start Windows Update Troubleshooting capture."

#Set the CPU profiling slower, 1ms, still good enough for general CPU usage. Max is 10,000,000 (10s). Default 10,000 (1ms)
wpr.exe -setprofint 1000000
wpr.exe -start ..\Profiles\Generral-WindowsUpdateTroubleshooting.wprp

Write-Host ("To stop tracing run :wpr.exe -stop <filename.etl>") -ForegroundColor Green