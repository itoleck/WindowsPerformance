# Tools for Event Tracing for Windows

## Microsoft Download Tools

WPT <https://aka.ms/adk> - Windows Performance Toolkit (Windows ADK)
    WPR / WPRUI - Windows Performance Recorder
    WPA - Windows Performance Analyzer
    wpaexporter.exe - Exports Table data from trace based on a WPA profile.
    xperf.exe / xperfview.exe(Deprecated) / xbootmgr.exe

Windows Assessment Toolkit - <https://aka.ms/adk> - Assess performance of Office and other applications.

Performance HUD <https://www.microsoft.com/en-us/download/100813> - A real-time performance profiler that detects and identifies the source of high resource usage, GDI leaks, memory leaks and more.

Network Monitor 3 - <https://docs.microsoft.com/en-us/troubleshoot/windows-server/networking/network-monitor-3#download-and-support-information> - View .etl network traces.

etl2pcapng - <https://github.com/microsoft/etl2pcapng> - Open source tool to convert .etl network traces to WireShark format.

<https://github.com/microsoft/eventtracing-processing> - Microsoft.Windows.EventTracing.Processing NuGet package - Create .Net applications that can read and utilize Event Trace Logs (.etl).

<https://github.com/Microsoft/perfview> - Perfview - PerfView is a free performance-analysis tool that helps isolate CPU and memory-related performance issues.

<https://docs.microsoft.com/en-us/openspecs/blog/ms-winintbloglp/dd98b93c-0a75-4eb0-b92e-e760c502394f> - Microsoft Message Analyzer - Retired November 25, 2019.

## Built-in Tools

WPR.exe - Built-in Windows 10+ version. Capture a trace without installing the ADK or anything else.

Perfmon.exe - Built-in Windows. Performance Monitor

Logman.exe - Built-in Windows. Manage performance logs and ETW tracing from command line.

Tracerpt.exe - Built-in Windows. Processes event trace logs or real-time data from instrumented event trace providers and allows you to generate trace analysis reports and CSV (comma-delimited) files for the events generated

Event Viewer - Built-in Windows. View log files.

## Other Tools

<https://github.com/google/UIforETW> - User interface for recording and managing ETW traces - Bruce Dawson

<https://github.com/gcpartners/ETLParser> - parse ETL files

<https://github.com/lowleveldesign/wtrace> - FileIO for a process

<https://github.com/ryanries/ETWSplitter> - ETWSplitter, split a large .etl file into smaller files.
