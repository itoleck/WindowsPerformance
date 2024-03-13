#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

#requires -Version 5 -PSEdition Desktop

<#
        .SYNOPSIS
        Create files in a path and show time taken.
        .DESCRIPTION
        Create files in a path and show time taken.
        To trace disk performance, start a Perfmon or WPR/Xperf trace before running command and save after the files have been created.
        .PARAMETER FileCount
        Number of files to write
        .PARAMETER FilePath
        Folder path to write files
        .PARAMETER FileSize
        Size of each file to write in bytes
        .PARAMETER ShowTemps
        .OUTPUTS
        String
        .EXAMPLE
        .\Start-CreateFileLoad.ps1 -FileCount 1000 -FilePath c:\temp\ -FileSize 8192
        .NOTES
        Sequential, not multi-threaded, also tests how fast console hosts spawn, which can be slowed down by high CPU overhead or hooks into CreateProcess.
        1000 8192 byte files should be able to be created on NVME SSD in about 45 seconds.
        1000 8192 byte files should be able to be created on 7,200K RPM HDD in about 50 seconds.
        .LINK
#>

param(
      [Parameter(Mandatory=$true)][int] $FileCount,
      [Parameter(Mandatory=$true)][string] $FilePath,
      [Parameter(Mandatory=$true)][int] $FileSize,
      [Parameter(Mandatory=$false)][switch] $ShowTemps
    )

    $FilePath = $filePath.TrimEnd("\")
    if (-not(Test-Path $FilePath)) {Write-Output "Bad Path";Exit}

    $stopwatch = [system.diagnostics.stopwatch]::StartNew()

    for ($index=1;$index -le $FileCount;$index++) {

        if ( ($ShowTemps) -and (($index -eq 1) -or ($index -eq $FileCount)) ) {
          Write-Output "Disk Temps @ file creation #$index"
          Get-PhysicalDisk | Get-StorageReliabilityCounter | Select-Object DeviceID, Temperature, TemperatureMax
        }

        $fullpath = $FilePath + "\" + $index.ToString() + ".tmp"
        $arglist = "file createnew " + $fullpath + " " + $FileSize.ToString()
        Start-Process -FilePath "fsutil.exe" -ArgumentList $arglist
    }

    $elapsed = ($stopwatch.ElapsedTicks / 10000).ToString()
    $totalbytes = ($FileCount * $FileSize)
    Write-Output "Elasped ms: $elapsed to create $FileCount files of size $fileSize"
    Write-Output "Total bytes written: $totalbytes"
    Write-Output "Remember to delete the test files at: $FilePath"