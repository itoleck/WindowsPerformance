#requires –RunAsAdministrator

#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

Write-Host "Start driver capture."

If (!(Test-Path $env:TEMP)) {
    New-Item -Path $env:TEMP
}

#Set the CPU profiling slower, 1s, still good enough for general CPU usage. Max is 10,000,000 (10s).
wpr.exe -setprofint 10000
wpr.exe -boottrace -start ..\Profiles\General-CPU-Drivers-Light-Circular-1GB.wprp -filemode -recordtempto $env:TEMP

Write-Host ("To stop tracing run :wpr.exe -stop <filename.etl>") -ForegroundColor Green