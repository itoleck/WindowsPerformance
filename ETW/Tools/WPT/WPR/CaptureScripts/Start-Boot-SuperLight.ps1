#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

#Administrator access is not needed if your account is member of the 'Performance Log Users' local group.
#Comment below requires statement if this is the case.
#Requires -RunAsAdministrator

Write-Output "Start Ultra Low Impact Boot capture."
Write-Output "After rebooting the machine run the save script (Save-BootTrace.ps1) to stop the capture and save the file."
Write-Output "This is done so that the trace can be saved without the 2 minute auto-rundown time."

If (!(Test-Path $env:TEMP)) {
    New-Item -Path $env:TEMP
}

#Set the CPU profiling slower, 1s, still good enough for general CPU usage. Max is 10,000,000 (10s).
wpr.exe -setprofint 100000
wpr.exe -boottrace -addboot ..\Profiles\Boot-Basic-SuperLight.wprp -filemode -recordtempto $env:TEMP

Write-Output "Please reboot the machine, login and run the Save-BootTrace.ps1 script as an administrator."