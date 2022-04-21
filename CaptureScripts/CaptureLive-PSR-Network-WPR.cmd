REM No installation of tools is necessary on Windows 10/2019+ as Wpr.exe should be built-in.

set CUR_YYYY=%date:~10,4%
set CUR_MM=%date:~4,2%
set CUR_DD=%date:~7,2%

set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)
set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
set CUR_MS=%time:~9,2%

set SUBFILENAME=%COMPUTERNAME%-%CUR_YYYY%%CUR_MM%%CUR_DD%-%CUR_HH%%CUR_NN%%CUR_SS%

start psr.exe /start /output "c:\temp\%SUBFILENAME%-PSR.zip" /sc 1 /maxsc 25 /arcmht 1 /gui 0
netsh trace start capture=yes tracefile="c:\temp\%SUBFILENAME%-nettrace.etl" maxsize=1024 report=no filemode=circular
wpr.exe -start GeneralProfile -start CPU -start DiskIO -start FileIO -start GPU -start DesktopComposition -start Minifilter
@echo Starting tracing of issue. Please reproduce the problem. Press any key to save.
pause
wpr.exe -marker "User stopped tracing. The rest of trace is rundown, merge and save."
wpr.exe -stop "c:\temp\%SUBFILENAME%-ETWTrace_Output.etl"
netsh trace stop
start /w psr.exe /stop
pause