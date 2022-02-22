@echo off
echo Press a key when ready to start...
pause
echo .
echo ...Capturing...
echo .

xperf -on PROC_THREAD+LOADER+CSWITCH+DRIVERS+HARD_FAULTS+DPC+INTERRUPT+DISPATCHER+DISK_IO+DISK_IO_INIT -stackwalk Profile+CSwitch+ReadyThread+ThreadCreate+DiskReadInit+DiskWriteInit+DiskFlushInit+DiskReadInit+DiskWriteInit+DiskFlushInit -BufferSize 1024 -MinBuffers 1024 -MaxBuffers 1024 -MaxFile 1024 -FileMode Circular -f c:\kernel.etl

echo Press a key when you want to stop...
pause
echo .
echo ...Stopping...
echo .

xperf -stop -d result.etl
