#2022 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

<#
        .SYNOPSIS
        Create files in a path and show time taken.
        .DESCRIPTION
        Create files in a path and show time taken.
        To trace disk performance, start a Perfmon or WPR/Xper trace before running command and save after the files have been created.
        .PARAMETER FileCount
        Number of files to write
        .PARAMETER FilePath
        Folder path to write files
        .PARAMETER FileSize
        Size of each file to write in bytes
        .OUTPUTS
        String
        .EXAMPLE
        .\Start-CreateFileLoad.ps1 -FileCount 2 -FilePath c:\temp\ -FileSize 8192
        .NOTES
        
        .LINK
#>

param(
      [Parameter(Mandatory=$true)][int] $FileCount,
      [Parameter(Mandatory=$true)][string] $FilePath,
      [Parameter(Mandatory=$true)][int] $FileSize
    )

    $FilePath = $filePath.TrimEnd("\")
    if (-not(Test-Path $FilePath)) {Write-Host "Bad Path";Exit}

    $stopwatch = [system.diagnostics.stopwatch]::StartNew()

    for ($index=1;$index -le $FileCount;$index++) {
        $fullpath = $FilePath + "\" + $index.ToString() + ".tmp"
        $arglist = "file createnew " + $fullpath + " " + $FileSize.ToString()
        Start-Process -FilePath "fsutil.exe" -ArgumentList $arglist
    }

    $elapsed = ($stopwatch.ElapsedTicks / 10000).ToString()
    $totalbytes = ($FileCount * $FileSize)
    Write-Host "Elasped ms: $elapsed to create $FileCount files of size $fileSize"
    Write-Host "Total bytes written: $totalbytes"
