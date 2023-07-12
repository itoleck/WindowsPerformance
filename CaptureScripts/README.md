# Example scripts for capturing Windows performance issues

In most cases scripts should be ran as an administrator.

These scripts may use multiple tools to capture Event Tracing, Problem Steps, Network Traces, Process Monitor and other information.

Other capture scripts that only rely on a single tool will be in their respective folder. (Perfmon, WPR, Xperf, Etc)

Some tools may need to be installed on the traced system beforehand. Check the script text for more information.

## Trace live system

To trace a live system use the following scripts:

- CaptureLive-Procmon-Network-WPR.cmd
- CaptureLive-PSR-Network-WPR.cmd

These scripts need to run as a local administrator. When the problem occurs a user can hit any key to stop and save the trace files and supply for analysis.
