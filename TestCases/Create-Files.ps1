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

if ($FolderPath.Exists) {
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
    }
} else {
    Write-Verbose "Path ($FolderPath) not found."
}
