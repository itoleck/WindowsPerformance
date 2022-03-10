# Windows Network Capture Scripts

These capture scripts use the built-in Netsh.exe command in Windows to capture network packets and events. The scripts also try to automatically convert the .etl(Netsh) file to .pcapng(WireShark) format by downloading the Microsoft [etl2pcapng](https://github.com/microsoft/etl2pcapng) application.

After capturing and converting, keep the .etl file as any ETW events captured will not be converted to pcapng format. Tools that can read .etl can be used to view network events(Event Viewer, WPA, Network Monitor).
