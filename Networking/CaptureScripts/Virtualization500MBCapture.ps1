#requires –RunAsAdministrator

#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

#This script tries to download the etl2pcapng release from Microsoft's Github repository.
#If Internet access is not available downlaod and copy the latest etl2pcapng.zip release to the User downloads folder.

Write-Output "Start 500MB circular capture. Press a key to save capture. Capture will not automatically start after reboot."
Netsh trace start capture=yes scenario=NDIS,LAN,NetConnection,Virtualization,Layer2
pause
Write-Output "Stopping and merging capture. This may take a few moments."
Netsh trace stop
Set-Location -Path "$env:USERPROFILE\AppData\Local\Temp\NetTraces"
Get-ChildItem

If (!(Test-Path "$env:USERPROFILE\Downloads\etl2pcapng.zip")) {
    Write-Output "Downloading etl2pcapng from GitHub"
    Invoke-WebRequest -Uri "https://github.com/microsoft/etl2pcapng/releases/download/v1.7.0/etl2pcapng.zip" -OutFile "$env:USERPROFILE\Downloads\etl2pcapng.zip"
}
If (!(Test-Path "$env:USERPROFILE\Downloads\etl2pcapng\x64\etl2pcapng.exe")) {
    Write-Output "Expanding etl2pcapng to folder in Downloads folder"
    Expand-Archive -Path "$env:USERPROFILE\Downloads\etl2pcapng.zip" -DestinationPath "$env:USERPROFILE\Downloads\etl2pcapng" -Force
}

Write-Output "Starting automatic conversion of network trace from .etl to .pcapng for WireShark analysis."
Write-Output ".etl file can also be opened in Event Viewer, WPA, Network Monitor or other tools for ETW event analysis."

Start-Process -FilePath "$env:USERPROFILE\Downloads\etl2pcapng\x64\etl2pcapng.exe" -ArgumentList "$env:USERPROFILE\AppData\Local\Temp\NetTraces\NetTrace.etl $env:USERPROFILE\AppData\Local\Temp\NetTraces\NetTrace.pcapng"

Write-Output "Automatically start WireShark and Load trace"
Start-Process -FilePath "$env:ProgramFiles\WireShark\WireShark.exe" -ArgumentList "$env:USERPROFILE\AppData\Local\Temp\NetTraces\NetTrace.pcapng"