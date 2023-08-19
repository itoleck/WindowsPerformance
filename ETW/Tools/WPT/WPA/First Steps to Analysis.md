# WPA First Steps of Analyzing a Performance Trace

## Steps

1. [Understand the System](#understand1)
2. [Understand the Problem](#understand2)
3. [Understand the Solution](#understand3)

### <a id="understand1"></a>Understand the System ###

The System Configuration window has all kinds of information about the machine and conditions of the trace. This is the first place to start in any investigation of an .etl file with Windows Performance Analyzer(WPA.exe).
To open the System Configuration, open a trace and go to the Menu->Trace->System Configuration.

![WPA System Configuration](/ETW/Tools/WPT/WPA/images/SystemConfiguration.png)


### <a id="understand2"></a>Understand the Problem ###

Make sure that you have narrowed down the issue to a time, reproduction steps, hardware resource/s, software/App if possible. Collect just the information needed using wpr.exe, wprui.exe or xperf.exe. Remember that ETW traces can log a lot of events very quickly, even up to multiple gigabytes in a few seconds. Some example trace commands are available [here](/ETW/Tools/WPT/WPR/CaptureScripts/) 

Example, if the machine is experiencing a storage performance issue trace the storage related providers; DiskIO, FileIO, Minifilter IO Activity. Do not capture unneccessary information, GPU, HTML, Audio/Video.

If stack information is neccessary to determine the cause of an issue, capture verbose tracing.

### <a id="understand3"></a>Understand the Solution ###

There wiill be false positives, errant data and other dead ends while analyzing performance data. Explore all options before determining the cause.
