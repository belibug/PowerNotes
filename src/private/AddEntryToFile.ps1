function Add-NoteEntryToFile {
    param(
        [Note] $Note,
        $Year = (Get-Date).Year
    )
    $filePath = Get-NotesFile -Year $Year -Create
    $NoteValue = $Note | ConvertTo-Json -Compress
    $NoteValue = $NoteValue + "`n"
    try {
        [System.IO.File]::AppendAllText($filePath, $NoteValue, [Text.UTF8Encoding]::new($false))
    } catch {
        Write-Error $_
    }
}