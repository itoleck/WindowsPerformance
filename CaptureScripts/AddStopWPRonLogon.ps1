#2023 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

#Check Administrator access.
#Requires -RunAsAdministrator

$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
schtasks /CREATE /SC onlogon /TN "StopWPR" /TR "PowerShell.exe '-WindowsStyle Hidden -ExecutionPolicy unrestricted -file $scriptPath\StopWPR.ps1'" /RL HIGHEST /RU SYSTEM