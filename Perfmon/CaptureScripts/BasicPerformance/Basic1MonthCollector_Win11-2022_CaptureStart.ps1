#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

#Administrator access is not needed if your account is member of the 'Performance Log Users' local group.
#Comment below requires statement if this is the case.
#Requires -RunAsAdministrator


logman.exe import -n Basic1MonthCollector_Win11-2022 -xml ..\..\Templates\Win11-2022\Basic1MonthCollector_Win11-2022.xml
logman.exe start Basic1MonthCollector_Win11-2022