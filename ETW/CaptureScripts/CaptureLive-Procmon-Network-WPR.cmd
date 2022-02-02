netsh.exe trace start capture=yes tracefile=c:\temp\Nettrace.etl maxsize=1024 report=no filemode=circular
wpr.exe -start GeneralProfile -start CPU -start DiskIO -start FileIO
Procmon.exe /AcceptEula /Quiet /Minimized /BackingFile c:\temp\ProcmonTrace.PML
@echo Starting tracing of issue. Please reproduce the problem. Press any key to save.
pause
wpr.exe -stop c:\temp\ETWTrace.etl
netsh trace stop
Procmon.exe /Terminate
pause