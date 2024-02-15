# WPA First Steps of Analyzing a Performance Trace

## Steps

1. [Understand the System](#understand1)
2. [Understand the Problem](#understand2)
3. [Understand the Solution](#understand3)

### <a id="understand1"></a>Understand the System

The System Configuration window has all kinds of information about the machine and conditions of the trace. This is the first place to start in any investigation of an .etl file with Windows Performance Analyzer(WPA.exe).
To open the System Configuration, open a trace and go to the Menu->Trace->System Configuration.

![WPA System Configuration](/ETW/Tools/WPT/WPA/images/SystemConfiguration.png)

From the System Configuration you can view the hardware information of the machine, like the storage, CPU, Operating system and much more. Some of the important pieces of information to check are below.

#### Storage
Look to see what the model of the underlying storage is. You can copy the information and search to see the exact hardware details. Is the storage a 5,400RPM drive or a PCIE Gen 5 NVME? This is important to understand so you can baseline what performance to expect. If the storage is virtualized, then you will need to find out what kind of storage is being used under the hood manually. Other aspects of the drive are also available that can have a performance impact like, Write Caching, Offset and sector size.

#### General
This panel is where you can find the Operating System information and others like CPU cores, speed, Hyper-Threading, RAM size and security features that are enabled. The CPU cores are necessary when troubleshooting CPU usage weight.

#### Trace Statistics
You can view all of the providers with events captured and how much space is used by each. Useful to verify that the correct information was captured for analysis. The Provider Id can also be enabled to view the Provider Ids for use in tools like [ETLSmasher](https://github.com/itoleck/ETLSmasher).

#### Traces
Another panel to view trace information. When the trace was taken, if there are any lost events and if the trace was a boot trace.

#### Other Panels

- Services

    - Useful for knowing the Windows Services states.

- PnP

    - Has all of the hardware device Ids and names.

- Network

    - Network information like IP address and types of adapters.

- Display

    - Video display information.

### <a id="understand2"></a>Understand the Problem

Make sure that you have narrowed down the issue to a time, reproduction steps, hardware resource/s, software/App if possible. Collect just the information needed using wpr.exe, wprui.exe or xperf.exe. Remember that ETW traces can log a lot of events very quickly, even up to multiple gigabytes in a few seconds. Some example trace commands are available [here](/ETW/Tools/WPT/WPR/CaptureScripts/) 

There are ways to capture Event Trace data for longer periods using circular logging in memory (RAM) and/or capturing only necessary data. The trace is usually stopped as soon after the performance issue as possible. This can be automated if there is a specific Event Log event of other data that can be monitored to stop the tracing.

Here are some ways to capture for longer periods.

- Change the CPU profile capture frequency.
    - wpr.exe -setprofint 10000000
- Set larger buffers for memory traces
    - Edit a .wprp profile and set the memory used to a higher value based on the amount of RAM installed in the machine. An example of a 4GB buffer is below.
      ```
      <SystemCollector Id="GeneralSystemCollector" Name="GeneralSystemCollector">
        <BufferSize Value="1024"/>
        <Buffers Value="2048"/>
      </SystemCollector>

      ...

      <EventCollector Id="GeneralEventCollector" Name="GeneralEventCollector">
        <BufferSize Value="1024"/>
        <Buffers Value="2048"/>
      </EventCollector>

      ```
- Reduce the amount of providers captured
    - Do not use the "wpr.exe -start GeneralProfile". The GeneralProfile has many extra providers, Anti-virus, Javascript that may not be necessary. See the [Basic Superlight](/ETW/Tools/WPT/WPR/Profiles/General-CPU-Light-Circular-500MB.wprp) profile for an example. The example script to capture a super light trace is [here](/ETW/Tools/WPT/WPR/Profiles/Start-Circular-SuperLight-CPU-500MB.ps1) Change the buffer size to trace for a longer time frame.

Example, if the machine is experiencing a storage performance issue trace the storage related providers; DiskIO, FileIO, Mini-filter IO Activity. Do not capture unnecessary information, GPU, HTML, Audio/Video.

If stack information is necessary to determine the cause of an issue, capture verbose tracing.

### <a id="understand3"></a>Understand the Solution

There will be false positives, errant data and other dead ends while analyzing performance data. Explore all options before determining the cause.
