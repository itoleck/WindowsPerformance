#requires –RunAsAdministrator

#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

Write-Host "Start DiskIO, FileIO and Minifilter Light Boot capture."
Write-Host "After rebooting the machine run the save script (Save-BootTrace.ps1) to stop the capture and save the file."
Write-Host "This is done so that the trace can be saved without the 2 minute auto-rundown time."

If (!(Test-Path $env:TEMP)) {
    New-Item -Path $env:TEMP
}

wpr.exe -boottrace -addboot ..\Profiles\Boot-DiskIO-FileIO.wprp -addboot Minifilter -filemode -recordtempto $env:TEMP

Write-Host "Please reboot the machine, login and run the Save-BootTrace.ps1 script as an administrator."