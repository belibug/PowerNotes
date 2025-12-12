$PSModPathDir = $env:PSModulePath -split ';' | Where-Object { $_ -match 'OneDrive' } | Select-Object -First 1
try {
    $DirDist = "$PSScriptRoot\..\dist\PowerNotes"
    Copy-Item -Path $DirDist -Destination $PSModPathDir -Force -Recurse -ErrorAction Stop
} catch {
    Write-Error 'Failed to update file'
}
