#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

#Administrator access is not needed if your account is member of the 'Performance Log Users' local group.
#Comment below requires statement if this is the case.
#Requires -RunAsAdministrator


logman.exe import -n IIS1WeekCollector -xml ..\..\Templates\PAL\IIS_1Week_PAL.xml
logman.exe start IIS1WeekCollector