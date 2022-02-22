@echo off
echo Press a key when ready to start...
pause
echo .
echo ...Capturing...
echo .

xperf -on PROC_THREAD+LOADER+REGISTRY -stackwalk RegQueryKey+RegEnumerateKey+RegEnumerateValueKey+RegDeleteKey+RegCreateKey+RegOpenKey+RegSetValue+RegDeleteValue+RegQueryValue+RegQueryMultipleValue+RegSetInformation+RegFlush+RegKcbCreate+RegKcbDelete+RegVirtualize+RegCloseKey -BufferSize 1024 -MinBuffers 256 -MaxBuffers 256 -MaxFile 256 -FileMode Circular

echo Press a key when you want to stop...
pause
echo .
echo ...Stopping...
echo .

xperf -stop -d registry.etl
