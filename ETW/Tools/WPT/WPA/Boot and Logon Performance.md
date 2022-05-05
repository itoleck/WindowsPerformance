# Boot trace phases

Wpa.exe boot analysis

![Alt text](bootphasegraph.png)

If the Boot Phases graph is unavailable, use the below information to find the durations of each boot phase.

|       **Phase**      | **Start of boot phase** | **End of boot phase** | **Notes** |
| ---------------- |-------------------|---|---|
| Pre-Session Init     | Beginning of boot trace | First Smss.exe process starts | This boot phase starts after the BIOS/UEFI ends and the kernel loads. This phase should only take low single digit seconds to complete. |
| Session Init         | First Smss.exe process starts | Second Csrss.exe process starts or all Microsoft-Windows-Subsys-SMSS/smss:LoadSubsystem/win:Stop(s) end | This phase should only take single digit seconds to complete. |
| WinLogon Init        | Second Csrss.exe process starts or all Microsoft-Windows-Subsys-SMSS/smss:LoadSubsystem/win:Stop(s) end | Process/explorer.exe Start Time (s) or Microsoft-Windows-Winlogon/UserShellLaunch/win:Info | This is usually the longest of the boot phases as it encapsulates the starting of sessions, services and any Group Policies/scripts. A performant mean time for this boot phase is ~30 seconds. |
| Explorer Init        | Microsoft-Windows-Shell-Core/Explorer_InitializingExplorer/win:Start or Process/explorer.exe Start Time (s) | Microsoft-Windows-Shell-Core/Explorer_InitializingExplorer/win:Stop or last LogonUI.exe process ends | This boot phase starts after a user has logged on the machine. The shell(Explorer) and any startup applications start in this phase. This phase should only take single digit seconds to complete. |
