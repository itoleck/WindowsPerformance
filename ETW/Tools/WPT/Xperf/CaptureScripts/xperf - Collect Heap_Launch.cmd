@echo off 
echo Press a key when ready to start... 
pause

echo .
echo ...Capturing... 
echo .

rem Add the process to IFEO
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%1.exe" /v TracingFlags /t REG_DWORD /d 1 /f

xperf -on PROC_THREAD+LOADER+VIRT_ALLOC -BufferSize 1024 -MinBuffers 256 -MaxBuffers 256 -stackwalk VirtualAlloc
xperf -start HeapSession -heap -pids 0 -stackwalk HeapAlloc+HeapRealloc -BufferSize 1024 -MinBuffers 256 -MaxBuffers 256 -MaxFile 256 -FileMode Circular

echo Press a key when you want to stop...
pause

echo . 
echo ...Stopping... 
echo .

xperf -stop HeapSession -stop -d heap.etl

rem Remove the process from IFEO
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%1.exe" /v TracingFlags /f
