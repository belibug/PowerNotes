function Add-NoteEntryToFile {
    param(
        [Note] $Note,
        $Year = (Get-Date).Year
    )
    $filePath = Get-NotesFile -Year $Year -Create
    $list = [System.Collections.ArrayList]::new()

    if (Test-Path $filePath) {
        $json = Get-Content -Path $FilePath -Raw
        if ($json) {
            $items = $json | ConvertFrom-Json
            # Convert deserialized objects into Note objects if needed
            foreach ($item in $items) {
                $NoteEntry = [Note]::new(@{
                        Body     = $item.Body
                        Topic    = $item.Topic
                        Priority = [Priority]$($item.Priority)
                    })
                $NoteEntry.Date = [datetime]$item.Date
                $NoteEntry.ID = $item.ID
                [void]$list.Add($NoteEntry)
            }
        }
    }
    [void]$list.Add($Note)

    $jsonOut = $list | ConvertTo-Json -Depth 5 -EnumsAsStrings
    Set-Content -Path $filePath -Value $jsonOut -Encoding UTF8
}