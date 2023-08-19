# Boot trace phases

## Wpa.exe boot analysis

![WPA Boot Phases](/ETW/Tools/WPT/WPA/images/bootphasegraph.png)

If the Boot Phases graph is unavailable, use the below information to find the durations of each boot phase.

Alternativley, the [ETLReports](https://github.com/itoleck/ETLReports) tool can be used to create a .csv file and .png file of the boot phase information. The Windows Performance Toolkit application, xperf.exe can also create an .xml report using actions. See **xperf.exe -help processing** for more information. Wpaexporter.exe also from the Windows Performance Toolkit can also be used to export data from .etl traces. See **wpaexporter.exe /?** for more information.

* ETLReports always outputs to formatted .csv format for easy digestion into other systems.

.\etlreports.exe --infile:<.etl file path> --processor:bootphases --outfile:<output directory>

Example ETLReports output:

![bootphasesreportcsv](/ETW/Tools/WPT/WPA/images/bootphasesreportcsv.png) ![bootphasesgraph](/ETW/Tools/WPT/WPA/images/bootphasesgraph.png)

|       **Phase**      | **Normal Duration** | **Start of boot phase** | **End of boot phase** | **Notes** |
| ---------------------|---------------------|-------------------------|-----------------------|-----------|
| Pre-Session Init     | 0-9s | Beginning of boot trace | First Smss.exe process starts</br>![smss](/ETW/Tools/WPT/WPA/images/smss1.png) | This boot phase starts after the BIOS/UEFI ends and the kernel loads. This phase should only take low single digit seconds to complete. Providers to check in this phase are Microsoft-Windows-CodeIntegrity, Microsoft-Windows-Kernel-Boot and Microsoft-Windows-Kernel-PnP|
| Session Init         | 0-12s | First Smss.exe process starts</br>![smss](/ETW/Tools/WPT/WPA/images/smss1.png) | Second Csrss.exe process starts</br>![csrss](/ETW/Tools/WPT/WPA/images/csrss1.png)</br></br>or all Microsoft-Windows-Subsys-SMSS/smss:LoadSubsystem/win:Stop(s) end</br>![smssloadsubsystemstop](/ETW/Tools/WPT/WPA/images/smssloadsubsystemstop.png) | This phase should only take single digit seconds to complete. Providers to check in this phase are Microsoft-Windows-CodeIntegrity, Microsoft-Windows-Kernel-PnP, Microsoft-Windows-Services and Microsoft-Windows-Services-Svchost|
| WinLogon Init        | 10-60s | Second Csrss.exe process</br>![csrss](/ETW/Tools/WPT/WPA/images/csrss1.png)</br></br>or first LogonUI.exe starts</br>![logonui1](/ETW/Tools/WPT/WPA/images/logonui1.png)</br></br>or all Microsoft-Windows-Subsys-SMSS/smss:LoadSubsystem/win:Stop(s) end</br>![smssloadsubsystemstop](/ETW/Tools/WPT/WPA/images/smssloadsubsystemstop.png) | Process/explorer.exe Start Time (s)</br>![explorerstart](/ETW/Tools/WPT/WPA/images/explorerstart.png)</br></br>or Microsoft-Windows-Winlogon/UserShellLaunch/win:Info</br>![usershelllaunch](/ETW/Tools/WPT/WPA/images/usershelllaunch.png) | This is usually the longest of the boot phases as it encapsulates the starting of sessions, services and any Group Policies/scripts. A performant mean time for this boot phase is ~30 seconds. Providers to check in this phase are Microsoft-Windows-Services, Microsoft-Windows-Services-Svchost, Microsoft-Windows-GroupPolicy, Microsoft-Windows-TaskScheduler and Microsoft-Windows-Winlogon |
| Explorer Init        | 0-6s | Microsoft-Windows-Shell-Core/Explorer_InitializingExplorer/win:Start![shellcoreexplorerinit](/ETW/Tools/WPT/WPA/images/shellcoreexplorerinit.png)</br></br>or Process/explorer.exe Start Time (s)</br>![explorerstart](/ETW/Tools/WPT/WPA/images/explorerstart.png) | Microsoft-Windows-Shell-Core/Explorer_InitializingExplorer/win:Stop![shellcoreexplorerinitstop](/ETW/Tools/WPT/WPA/images/shellcoreexplorerinitstop.png)</br></br>or last LogonUI.exe process ends</br>![logonui2](/ETW/Tools/WPT/WPA/images/logonui2.png) | This boot phase starts after a user has logged on the machine. The shell(Explorer) and any startup applications start in this phase. This phase should only take single digit seconds to complete. Providers to check in this phase are Microsoft-Windows-Shell-Core and Microsoft-Windows-TaskScheduler|

Overall hardware resources like CPU, storage, memory should also be analyzed during a boot/logon trace.
