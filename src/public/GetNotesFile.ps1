function Get-NotesFile {
    param (
        [int] $Year = (Get-Date).Year,
        [switch]$Create
    )
    $baseDir = Get-NotesDir
    $fileName = "Notes-$Year.json"
    $FullFilePath = Join-Path $baseDir $fileName
    if ($Create -and (-not (Test-Path $FullFilePath))) {
        New-Item $FullFilePath | Out-Null
    }
    return Join-Path $baseDir $fileName
}