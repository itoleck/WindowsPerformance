# Windows Performance Recorder Information

## Profiles

.wprp files for recording WPR.exe or WPRUI.exe traces.

More .wprp profiles files can be found in the folders(C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Assessment Toolkit) of the [Windows Assessment Toolkit](https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install).

## CaptureScripts

Scripts to start various wpr.exe captures. Most of the scripts use the .wprp profiles found in the the Profiles folder and use a relative path; so they are best used by cloning this whole repository first.

## Special Notes

To run the wpr.exe and wprui.exe applications your account needs the rights of an administrator, including being able to shut down the machine, even if you are not tracing a power transition (Boot, Reboot Cycle, Shutdown).

If your account does not have all of the rights you will receive the following error: "Not all privileges or groups referenced are assigned to the caller"

To check your account rights use secpol.msc

For a list of available [Kernel event keywords - .\SystemProviderKeywords.md](./SystemProviderKeywords.md)

For a list of available [Stack Events - .\StackEnumerations.md](./StackEnumerations.md)