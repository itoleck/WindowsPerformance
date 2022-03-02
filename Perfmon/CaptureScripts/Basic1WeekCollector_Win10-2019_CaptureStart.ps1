#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

#Administrator access is not needed if your account is member of the 'Performance Log Users' local group.
#Comment below requires statement if this is the case.
#Requires -RunAsAdministrator

logman.exe import -n Basic1WeekCollector_Win10-2019 -xml ..\Templates\Win10-2019\Basic1WeekCollector_Win10-2019.xml
logman.exe start Basic1WeekCollector_Win10-2019