@echo off
echo Press a key when ready to start...
pause
echo .
echo ...Capturing...
echo .

netsh trace start capture=yes

echo Press a key when you want to stop...
pause
echo .
echo ...Stopping...
echo .

netsh trace stop
