@echo off

rem Using CLR 4.0 NGEN PDB Support
rem http://msdn.microsoft.com/en-us/library/windows/desktop/hh448186.aspx

echo Press a key when ready to start...
pause
echo .
echo ...Capturing...
echo .

set XPERF_CreateNGenPdbs=1
xperf -on PROC_THREAD+LOADER+PROFILE+INTERRUPT+DPC+DISPATCHER -stackwalk Profile -BufferSize 1024 -MinBuffers 256 -MaxBuffers 256 -MaxFile 256 -FileMode Circular
xperf -start ClrSession -on ClrAll:0x98:5 -f clr.etl -buffersize 128 -minbuffers 256 -maxbuffers 512

echo Press a key when you want to stop...
pause

echo .
echo ...Running CLR Rundown for 15 seconds...
echo .

xperf -start ClrRundownSession -on ClrAll:0x118:5+a669021c-c450-4609-a035-5af59af4df18:0x118:5 -f clr_DCend.etl -buffersize 128 -minbuffers 256 -maxbuffers 512
timeout /t 15

echo .
echo ...Stopping...
echo .

xperf -stop ClrSession ClrRundownSession -stop -d cpu_clr.etl
