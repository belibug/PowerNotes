function Get-NotesDir {
    if ($IsWindows) {
        $base = $env:APPDATA
    } elseif ($IsLinux -or $IsMacOS) {
        $base = $env:XDG_DATA_HOME
        if (-not $base) {
            if ($IsMacOS) { $base = Join-Path $HOME 'Library/Application Support' }
            else { $base = Join-Path $HOME '.local/share' }
        }
    } else { throw 'Unsupported OS' }
    $dir = Join-Path $base 'PowerNotes'
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
    return $dir
}