#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

#Administrator access is not needed if your account is member of the 'Performance Log Users' local group.
#Comment below requires statement if this is the case.
#Requires -RunAsAdministrator

$DCSName = "Basic1WeekCollector"
$DCSOS = "Win7-2012"
$DCSTemplate = (" ..\..\Templates\{0}\{1}_{2}.xml" -f $DCSOS, $DCSName, $DCSOS)
$DCSOutputPath = (Select-String -Pattern "<OutputLocation>" -Path $DCSTemplate).ToString().Replace("<OutputLocation>","").Replace("</OutputLocation>","").Trim(" ").Trim("`t")

Write-Host ("Starting Datacollector Set: {0}" -f $DCSName) -ForegroundColor Green

logman.exe import -n $DCSName -xml $DCSTemplate
logman.exe start $DCSName

Write-Host ("Tracing will complete automatically and be saved to {0}" -f $DCSOutputPath) -ForegroundColor Green