#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

#Administrator access is not needed if your account is member of the 'Performance Log Users' local group.
#Comment below requires statement if this is the case.
#Requires -RunAsAdministrator

param(
      [Parameter(Mandatory=$true)][string] $ProcessName
    )

#Check to make sure process is loaded
if ((Get-Process|Where-Object{$_.MainModule.ModuleName -like "*$ProcessName*"}).length -gt 0) {
   
    Write-Host ("Process {0} should not be loaded before tracing with wpr.exe" -f $ProcessName) -ForegroundColor Red
    Write-Output ("If you need to trace an already loaded process, run: xperf -on Base -start HeapLeak -heap -Pids <ProcessPID> -stackwalk HeapAlloc+HeapRealloc+HeapCreate -BufferSize 1024 -MaxBuffers 1024 -MaxFile 1024 -FileMode Circular")
    Write-Output ("xperf -stop HeapLeak -stop 'NT Kernel Logger' -d '{1}\{0}_Heap-Trace.etl'" -f $ProcessName, $Env:TEMP)

} else {
    #Set the heap profiling for a process in the registry. (HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options)
    wpr.exe -HeapTracingConfig $ProcessName enable
    wpr.exe -start Heap

    Write-Host ("Start process now. Then reproduce issue and run stop command below.") -ForegroundColor Green
    Write-Output ("To stop tracing in PowerShell, run: wpr.exe -stop '{1}\{0}_Heap-Trace.etl' ;wpr.exe -HeapTracingConfig {0} disable" -f $ProcessName, $Env:TEMP)
    Write-Output ("To stop tracing in CMD, run: wpr.exe -stop '{1}\{0}_Heap-Trace.etl' &wpr.exe -HeapTracingConfig {0} disable" -f $ProcessName, $Env:TEMP)
}
