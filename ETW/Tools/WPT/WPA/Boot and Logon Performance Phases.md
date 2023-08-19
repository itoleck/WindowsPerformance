# Boot trace phases

Wpa.exe boot analysis

![WPA Boot Phases](bootphasegraph.png)

If the Boot Phases graph is unavailable, use the below information to find the durations of each boot phase.

Alternativley, the [ETLReports](https://github.com/itoleck/ETLReports) tool can be used to create a .csv file and .png file of the boot phase information. The Windows Performance Toolkit application, xperf.exe can also create an .xml report using actions. See **xperf.exe -help processing** for more information.

.\etlreports.exe --infile:<.etl file path> --processor:bootphases --outfile:<output directory>

Example ETLReports output:

![bootphasesreportcsv](bootphasesreportcsv.png) ![bootphasesgraph](bootphasesgraph.png)

|       **Phase**      | **Normal Duration** | **Start of boot phase** | **End of boot phase** | **Notes** |
| ---------------------|---------------------|-------------------------|-----------------------|-----------|
| Pre-Session Init     | 0-9s | Beginning of boot trace | First Smss.exe process starts</br>![smss](smss1.png) | This boot phase starts after the BIOS/UEFI ends and the kernel loads. This phase should only take low single digit seconds to complete. |
| Session Init         | 0-12s | First Smss.exe process starts</br>![smss](smss1.png) | Second Csrss.exe process starts</br>![csrss](csrss1.png)</br></br>or all Microsoft-Windows-Subsys-SMSS/smss:LoadSubsystem/win:Stop(s) end</br>![smssloadsubsystemstop](smssloadsubsystemstop.png) | This phase should only take single digit seconds to complete. |
| WinLogon Init        | 10-60s | Second Csrss.exe process</br>![csrss](csrss1.png)</br></br>or first LogonUI.exe starts</br>![logonui1](logonui1.png)</br></br>or all Microsoft-Windows-Subsys-SMSS/smss:LoadSubsystem/win:Stop(s) end</br>![smssloadsubsystemstop](smssloadsubsystemstop.png) | Process/explorer.exe Start Time (s)</br>![explorerstart](explorerstart.png)</br></br>or Microsoft-Windows-Winlogon/UserShellLaunch/win:Info</br>![usershelllaunch](usershelllaunch.png) | This is usually the longest of the boot phases as it encapsulates the starting of sessions, services and any Group Policies/scripts. A performant mean time for this boot phase is ~30 seconds. |
| Explorer Init        | 0-6s | Microsoft-Windows-Shell-Core/Explorer_InitializingExplorer/win:Start![shellcoreexplorerinit](shellcoreexplorerinit.png)</br></br>or Process/explorer.exe Start Time (s)</br>![explorerstart](explorerstart.png) | Microsoft-Windows-Shell-Core/Explorer_InitializingExplorer/win:Stop![shellcoreexplorerinitstop](shellcoreexplorerinitstop.png)</br></br>or last LogonUI.exe process ends</br>![logonui2](logonui2.png) | This boot phase starts after a user has logged on the machine. The shell(Explorer) and any startup applications start in this phase. This phase should only take single digit seconds to complete. |
