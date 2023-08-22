#requires –RunAsAdministrator

#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

Write-Host "Start Ultra Low Impact Boot capture."
Write-Host "After rebooting the machine run the save script (Save-BootTrace.ps1) to stop the capture and save the file."
Write-Host "This is done so that the trace can be saved without the 2 minute auto-rundown time."

If (!(Test-Path $env:TEMP)) {
    New-Item -Path $env:TEMP
}

#Set the CPU profiling slower, 1s, still good enough for general CPU usage. Max is 10,000,000 (10s).
wpr.exe -setprofint 10000
wpr.exe -boottrace -addboot ..\Profiles\General-CPU-Drivers-Light-Circular-1GB.wprp -filemode -recordtempto $env:TEMP

Write-Host "Please reboot the machine, login and run the Save-BootTrace.ps1 script as an administrator."