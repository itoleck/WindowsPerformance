#2024 Chad Schultz
#https://github.com/itoleck/WindowsPerformance

param(
      [Parameter(Mandatory=$true)][int] $FileSizeBytes,
      [Parameter(Mandatory=$true)][int] $FileCount,
      [Parameter(Mandatory=$true)][System.IO.DirectoryInfo] $FolderPath
)

Write-Verbose ($FolderPath | Select-Object *)

$ErrorActionPreference = 'Stop'
trap {
    Write-Error "An error occurred in the script, exiting."
}

function updateprogress($percent) {
    Write-Progress -Activity "Creating Files" -Status "$percent% Complete:" -PercentComplete $percent
}

if ($FolderPath.Exists) {
    $script:Stopwatch = [system.diagnostics.stopwatch]::StartNew()
    $folderfixed = ($FolderPath.FullName.TrimEnd("\"))
    $l = $FileSizeBytes
    $str = ''
    $cs = 33..126 -as [char[]]
    1..($l - 2) | ForEach-Object {
        $str += $cs | Get-Random
    }
    
    Write-Verbose $str

    for ($i = 0; $i -lt $FileCount; $i++) {
        $str|Set-Content -LiteralPath $folderfixed\$i.tmp -Encoding ascii -Force
        updateprogress ($i / $FileCount * 100)
    }

    $script:Stopwatch.stop()

} else {
    Write-Verbose "Path ($FolderPath) not found."
}
Write-Output "$FileCount files created in $($script:Stopwatch.ElapsedMilliseconds) (ms)"