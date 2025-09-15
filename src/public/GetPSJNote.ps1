function Get-PSJNote {
    [CmdletBinding()]
    param(
        [int] $Year = (Get-Date).Year
    )

    $filePath = Get-PSJournalFile -Year $Year

    $list = [System.Collections.ArrayList]::new() 

    if (-not (Test-Path $filePath)) {
        return $list
    }

    $raw = Get-Content -Path $filePath -Raw
    if ([string]::IsNullOrWhiteSpace($raw)) {
        return $list
    }

    $items = $raw | ConvertFrom-Json  

    foreach ($obj in $items) {
        $entry = [Jrnl]::new(@{
                Body     = $obj.Body
                Topic    = $obj.Topic
                Priority = [Priority]::$($obj.Priority)
            })
        $entry.ID = $obj.ID
        $entry.Time = [datetime]$obj.Time
        [void]$list.Add($entry) 
    }
    return $list
}