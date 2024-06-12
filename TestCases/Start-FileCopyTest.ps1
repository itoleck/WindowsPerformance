#2024 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

#requires -Version 5 -PSEdition Desktop -RunAsAdministrator

<#
        .SYNOPSIS
        Copies files in a path and show time taken.
        .DESCRIPTION
        Copies files in a path and show time taken.
        To trace disk performance, start a Perfmon or WPR/Xperf trace before running command and save after the files have been created.
        .PARAMETER FileCount
        Number of files to copy. i.e. 1000
        .PARAMETER SourcePath
        Folder path to copy files from. i.e. c:\folder1\
        .PARAMETER DestinationPath
        Folder path to copy files to. i.e. c:\folder2\
        .PARAMETER FileSize
        Size of each file to write in bytes. i.e. 1024
        .PARAMETER TimeFrame
        Time to run the test. i.e. (New-TimeSpan -Seconds 10)
        .PARAMETER ShowTemps
        .OUTPUTS
        String
        .EXAMPLE
        .\Start-FileCopyTest.ps1 -FileCount 1000 -SourcePath c:\temp\ -DestinationPath c:\temp2\ -FileSize 1024 -TimeFrame (New-TimeSpan -Seconds 10) -ShowTemps -Verbose
        .NOTES
        Sequential, not multi-threaded. Iterates test within a specific time period.
        .LINK
#>

param(
      [Parameter(Mandatory=$true)][int] $FileCount,
      [Parameter(Mandatory=$true)][System.IO.DirectoryInfo] $SourcePath,
      [Parameter(Mandatory=$true)][System.IO.DirectoryInfo] $DestinationPath,
      [Parameter(Mandatory=$true)][int] $FileSize,
      [Parameter(Mandatory=$true)][timespan] $TimeFrame,
      [Parameter(Mandatory=$false)][switch] $ShowTemps
)

$ErrorActionPreference = 'Stop'
trap {
    Write-Error "An error occurred in the script, exiting."
}

$script:TotalTicks = 0
$script:IsFileCountGood = $true
$script:SourceFileCount = -1
$script:IsFileSizesGood = $true
$script:IsDestinationGood = $true
$script:TotalIterations = 0

$script:SourceFileCount = (Get-ChildItem -LiteralPath $SourcePath).Count

Function IsFolderCorrectFileCount() {
    #Check to see if the number of files are available in the source and if their sizes match test or if the folder is empty. Otherwise fail because the source has other data.

    if ($script:SourceFileCount -ne $FileCount) {
        $script:IsFileCountGood = $false
    }

    if ($script:SourceFileCount -eq 0) {
        #No Files
        $script:IsFileCountGood = $true
    }
}

Function IsFolderFilesCorrectSize() {
    #Check that all files in source are correct size for test
    foreach ($file in (Get-ChildItem -LiteralPath $SourcePath)) {
        if ($file.Length -ne $FileSize) {
            $script:IsFileSizesGood = $false
        }
    }
}

Function IsDestinationFolderAvailable() {
    if (-Not (Test-Path -LiteralPath $DestinationPath)) {
        $script:IsDestinationGood = $false
    }
}

function updateprogress($percent) {
    Write-Progress -Activity "Loading profile" -Status "$percent% Complete:" -PercentComplete $percent
}

IsFolderCorrectFileCount
IsFolderFilesCorrectSize
IsDestinationFolderAvailable

Write-Verbose "File Count in $SourcePath Good: $script:IsFileCountGood"
Write-Verbose "File Sizes in $SourcePath Good: $script:IsFileSizesGood"
Write-Verbose "Number of Files in source: $script:SourceFileCount"
Write-Verbose "Is destination good: $script:IsDestinationGood"

#Deternine to run the script or not based on parameters provided
if ( ($script:IsFileCountGood) -and ($script:IsFileSizesGood) -and ($script:IsDestinationGood) ) {

    $script:Stopwatch = [system.diagnostics.stopwatch]::StartNew()

    if ($ShowTemps) {
        Write-Output "Disk Temps at start"
        Write-Output (Get-PhysicalDisk | Get-StorageReliabilityCounter | Select-Object DeviceID, Temperature, TemperatureMax | Format-Table -AutoSize)
    }

    do {
        Copy-Item -LiteralPath $SourcePath -Destination $DestinationPath -Recurse -Force
        $script:TotalIterations = $script:TotalIterations + 1
        $percentcompleted = ($script:Stopwatch.ElapsedMilliseconds / $TimeFrame.TotalMilliseconds * 100)
        if ($percentcompleted -gt 100) {
            $percentcompleted = 100
        }
        updateprogress $percentcompleted
    } while (
        $script:Stopwatch.ElapsedMilliseconds -lt $TimeFrame.TotalMilliseconds
    )

    $script:Stopwatch.stop()

    if ($ShowTemps) {
        Write-Output "Disk Temps at end"
        Write-Output (Get-PhysicalDisk | Get-StorageReliabilityCounter | Select-Object DeviceID, Temperature, TemperatureMax | Sort-Object | Format-Table -AutoSize)
    }

} else {
    Write-Output "Script did not run because of a bad setup. Check parameters and source and destination folders. Enable -Verbose for more info."
}

$avgiteration = ($script:Stopwatch.ElapsedMilliseconds / $script:TotalIterations)

Write-Output "Average file copy iteration time for $FileCount $FileSize byte files: $avgiteration (ms)"
Write-Output "Test ran for $($script:Stopwatch.ElapsedMilliseconds) milliseconds and $script:TotalIterations iterations."