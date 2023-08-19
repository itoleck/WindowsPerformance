# WindowsPerformance

## Various Windows Performance trace file examples

<https://1drv.ms/u/s!AuY3A9qpvso6lfMpVPV408UDaAaMdQ?e=wkeaSR>

If you would like to comment your findings use the (<https://github.com/itoleck/WindowsPerformance/issues>) tab and create a new issue with the "**question**" tag. Walk-throughs are available in the Issues tab with the **answer key** tag.

&nbsp;

### Boot and Logon Related

- **StorageEnumPerf.etl** - Can you find the difference in start up performance between storage types?

- [**Shutdown60.etl**](https://github.com/itoleck/WindowsPerformance/issues/7) - Another shutdown trace, can you find out why Windows took too long to shutdown?

- [**LongShutdown.etl**](https://github.com/itoleck/WindowsPerformance/issues/6) - Can you find out why Windows took too long to shutdown?

- [**SlowBoot1.etl**](https://github.com/itoleck/WindowsPerformance/issues/4) - Can you find the 2 issues with slow Windows boot and login performance?

- [**SlowBoot2.etl**](https://github.com/itoleck/WindowsPerformance/issues/5) - Can you find why this computer took too long to boot?

- [**SlowBoot4.etl**](https://github.com/itoleck/WindowsPerformance/issues/10) - Can you find why this computer took too long to boot?

- **SlowBoot5.etl** - Can you find why this computer took too long to boot?

- **SlowBoot6.etl** - Can you find why this computer took too long to boot?

### CPU Related

- [**HighCPUUsageEasy.etl**](https://github.com/itoleck/WindowsPerformance/issues/11) - Can you find the cause of high CPU usage?

- **HighCPUUsage.etl** - Can you find the cause of high CPU usage?

- [**HighCPUPlusOtherIssues.etl**](https://github.com/itoleck/WindowsPerformance/issues/1) - What process/es are using CPU, Is it causing any other issues with resources? The files in the folder /symache can be copied to the symcache folder of your analysis machine to help with the analysis. For more information on configuring symbols see; https://learn.microsoft.com/en-us/windows-hardware/test/wpt/load-symbols-or-configure-symbol-paths

- **CPUUsageSpikesInteresting.etl** - Can you find what is causing the CPU to spike at some times? What is happening at this time? Can you find out more process, file, or version information about the cause?

    - [More analysis](https://github.com/itoleck/WindowsPerformance/commit/e0e6371e5973fbe8a9f4b2121ea8f62613e6c239) by https://github.com/MagicAndre1981

### Storage Related

- [**Create_100files.etl**](https://github.com/itoleck/WindowsPerformance/issues/3) - 100 files were being created. Can you find the issue with disk performance in this trace?

- [**DiskIOHigh.etl**](https://github.com/itoleck/WindowsPerformance/issues/2) - Can you find out why the Disk/s were very utilized in this trace?

- **SlowFileCopy1.etl** - Can you find why this computer copied files slowly?

### Memory Related

- [**MemoryUsage1.etl**](https://github.com/itoleck/WindowsPerformance/issues/9) - Can you find the reason for memory usage spikes? Are the spikes cause for concern? Can you view the stack for the memory allocations? If so, how? If not, why not?

    - [More analysis](https://github.com/itoleck/WindowsPerformance/commit/04924266d20e16d8daf2724a47340314f7fef82b) by https://github.com/MagicAndre1981

### Other issues

- [**CaseOfThe30SecondFileExplorer.etl**](https://github.com/itoleck/WindowsPerformance/issues/8) - Can you find out why Windows Explorer was slow to show the "My Computer" files and folders?
