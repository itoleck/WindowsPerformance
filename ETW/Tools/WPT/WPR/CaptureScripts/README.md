# Capture script details

- ## Save-BootTrace.ps1

- ## Start-Boot-DiskIO-FileIO-Minifilter.ps1

- ## Start-Boot-SuperLight.ps1

- ## Start-Circular-DNSServer-1GB.ps1

- ## Start-Circular-Light-CPU-Disk-500MB.ps1

- ## Start-Circular-Light-CPU-Disk-TCP-500MB.ps1

- ## Start-Circular-Light-CPU-Drivers-1GB.ps1

    Trace the CPU usage and driver CPU usage durations without stack information. The driver/device I/O trace events are part of the DiskIO provider.</br>![DiskIO](/ETW/Tools/WPT/WPR/CaptureScripts/images/diskio.png)

    Use the CPU Usage (Sampled) graph to view CPU usage.</br>![CPUUsage](/ETW/Tools/WPT/WPR/CaptureScripts/images/cpuusage.png)

    Use the Device I/O graph to view driver usage.</br>![DriverUsage](/ETW/Tools/WPT/WPR/CaptureScripts/images/driver-io.png)

- ## Start-Circular-Verbose-CPU-Drivers-4GB.ps1

    Trace the CPU usage and driver CPU usage durations with stack information. Load symbols when analyzing. Refer to light trace for more details.

- ## Start-Circular-SuperLight-CPU-500MB.ps1

- ## Start-Circular-Verbose-CPU-Disk-1GB.ps1

- ## Start-Process-Heap.ps1 -ProcessName 'process name'

    Trace a process's heap memory allocations. The process needs to be started after the trace. For an already running process, run command with process name for more information. Load symbols when analyzing.</br>![Heap](/ETW/Tools/WPT/WPR/CaptureScripts/images/heap.png)
