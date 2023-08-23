# Capture script details

All scripts must be run as administrator

- ## Save-BootTrace.ps1

    Use this script after tracing the boot to save the trace as a file in your TEMP folder.

- ## Start-Boot-DiskIO-FileIO-Minifilter.ps1

    Start Medium Impact Boot capture. The machine **WILL** be rebooted after running script!

- ## Start-Boot-SuperLight.ps1

    Start Ultra Low Impact Boot capture. The machine **WILL** be rebooted after running script!

- ## Start-Circular-DNSServer-1GB.ps1

    Trace the overall CPU usage, DiskIO and Microsoft-Windows-DNSServer, Microsoft-Windows-DNS-Server-Service and Microsoft-Windows-TCPIP events without stack information

- ## Start-Circular-Light-CPU-Disk-500MB.ps1

    Trace the overall CPU usage and DiskIO usage without stack information.

- ## Start-Circular-Light-CPU-Disk-TCP-500MB.ps1

    Trace the overall CPU usage, DiskIO and Microsoft-Windows-TCPIP events without stack information.

- ## Start-Circular-Light-CPU-Drivers-1GB.ps1

    Trace the overall CPU usage and driver CPU usage durations without stack information. The driver/device I/O trace events are part of the DiskIO provider.</br>![DiskIO](/ETW/Tools/WPT/WPR/CaptureScripts/images/diskio.png)

    Use the CPU Usage (Sampled) graph to view CPU usage.</br>![CPUUsage](/ETW/Tools/WPT/WPR/CaptureScripts/images/cpuusage.png)

    Use the Device I/O graph to view driver usage.</br>![DriverUsage](/ETW/Tools/WPT/WPR/CaptureScripts/images/driver-io.png)

- ## Start-Circular-Verbose-CPU-Drivers-4GB.ps1

    Trace the overall CPU usage and driver CPU usage durations with stack information. Load symbols when analyzing. Refer to light trace for more details.

- ## Start-Circular-SuperLight-CPU-500MB.ps1

    Trace the overall CPU usage and driver CPU usage durations without stack information. User mode and kernel mode CPU usage included. Sets the CPU profiling events to once per second. This trace can be ran for an extended period of time (+15 minutes) without overwritting the memory buffer.

- ## Start-Circular-Verbose-CPU-Disk-1GB.ps1

    Trace the overall CPU usage, DiskIO and FileIO usage with stack information. Load symbols when analyzing.

- ## Start-Process-Heap.ps1 -ProcessName 'process name'

    Trace a process's heap memory allocations. The process needs to be started after the trace. For an already running process, run script with process name for more information about running xperf.exe with proces PID. Load symbols when analyzing.
    
    Use the Memory->Heap graphs to view heap usage.</br>![Heap](/ETW/Tools/WPT/WPR/CaptureScripts/images/heap.png)
