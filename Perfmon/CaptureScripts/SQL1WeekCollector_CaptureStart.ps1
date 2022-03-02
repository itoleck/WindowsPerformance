#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

#Administrator access is not needed if your account is member of the 'Performance Log Users' local group.
#Comment below requires statement if this is the case.
#requires –RunAsAdministrator

logman.exe import -n SQL1WeekCollector -xml ..\Templates\PAL\SQLServerDefaultInstance.xml
logman.exe start SQL1WeekCollector