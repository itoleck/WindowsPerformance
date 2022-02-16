#requires –RunAsAdministrator

Write-Host "Start 500MB circular capture. Press a key to save capture. Capture will not automatically start after reboot."
Netsh trace start capture=yes
pause
Write-Host "Stopping and merging capture. This may take a few moments."
Netsh trace stop
Set-Location -Path "$env:USERPROFILE\AppData\Local\Temp\NetTraces"
Get-ChildItem

If (!(Test-Path "$env:USERPROFILE\Downloads\etl2pcapng.zip")) {
    Write-Host "Downloading etl2pcapng from GitHub"
    Invoke-WebRequest -Uri "https://github.com/microsoft/etl2pcapng/releases/download/v1.7.0/etl2pcapng.zip" -OutFile "$env:USERPROFILE\Downloads\etl2pcapng.zip"
}
If (!(Test-Path "$env:USERPROFILE\Downloads\etl2pcapng\x64\etl2pcapng.exe")) {
    Write-Host "Expanding etl2pcapng to folder in Downloads folder"
    Expand-Archive -Path "$env:USERPROFILE\Downloads\etl2pcapng.zip" -DestinationPath "$env:USERPROFILE\Downloads\etl2pcapng" -Force
}

Write-Host "Starting automatic conversion of network trace from .etl to .pcapng for WireShark analysis."
Start-Process -FilePath "$env:USERPROFILE\Downloads\etl2pcapng\x64\etl2pcapng.exe" -ArgumentList "$env:USERPROFILE\AppData\Local\Temp\NetTraces\NetTrace.etl $env:USERPROFILE\AppData\Local\Temp\NetTraces\NetTrace.pcapng"
