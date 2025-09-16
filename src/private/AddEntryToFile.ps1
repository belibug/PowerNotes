function Add-JrnlEntryToFile {
    param(
        [Jrnl] $Note,
        $Year = (Get-Date).Year
    )
    $filePath = Get-PSJournalFile -Year $Year -Create
    $list = [System.Collections.ArrayList]::new()

    if (Test-Path $filePath) {
        $json = Get-Content -Path $FilePath -Raw
        if ($json) {
            $items = $json | ConvertFrom-Json
            # Convert deserialized objects into Jrnl objects if needed
            foreach ($item in $items) {
                $jrnlEntry = [Jrnl]::new(@{
                        Body     = $item.Body
                        Topic    = $item.Topic
                        Priority = [Priority]$($item.Priority)
                    })
                $jrnlEntry.Time = [datetime]$item.Time
                $jrnlEntry.ID = $item.ID
                [void]$list.Add($jrnlEntry)
            }
        }
    }
    [void]$list.Add($Note)

    $jsonOut = $list | ConvertTo-Json -Depth 5 -EnumsAsStrings
    Set-Content -Path $filePath -Value $jsonOut -Encoding UTF8
}