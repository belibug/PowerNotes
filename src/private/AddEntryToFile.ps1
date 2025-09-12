function Add-JrnlEntryToFile {
    param(
        [Jrnl] $Entry,
        [string] $FilePath = (Get-PSJournalFile)
    )

    $list = [System.Collections.ArrayList]::new()

    if (Test-Path $FilePath) {
        $json = Get-Content -Path $FilePath -Raw
        if ($json) {
            $items = $json | ConvertFrom-Json
            # Convert deserialized objects into Jrnl objects if needed
            foreach ($item in $items) {
                $jrnlEntry = [Jrnl]::new(@{
                        Body     = $item.Body
                        Topic    = $item.Topic
                        Priority = [Priority]::$item.Priority
                    })
                $jrnlEntry.Time = [datetime]$item.Time
                $jrnlEntry.ID = $item.ID
                [void]$list.Add($jrnlEntry)
            }
        }
    }

    [void]$list.Add($Entry)

    $jsonOut = $list | ConvertTo-Json -Depth 5
    Set-Content -Path $FilePath -Value $jsonOut -Encoding UTF8
}
