function Find-PSJNote {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Text,
        [int] $Year = (Get-Date).Year,
        [int]$MaxCount
    )

    $filePath = Get-PSJournalFile -Year $Year

    $ResultOut = [System.Collections.ArrayList]::new() 

    if (-not (Test-Path $filePath)) {
        return $ResultOut
        # Quit, No file found
    }

    $raw = Get-Content -Path $filePath -Raw
    if ([string]::IsNullOrWhiteSpace($raw)) {
        return $ResultOut
        # Quit, No entires in the JSON
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
        [void]$ResultOut.Add($entry) 
    }
    $ResultOut = $ResultOut | Where-Object { $_.Body -like "*$Text*" }
    
    if ($MaxCount) { $ResultOut = $ResultOut | Select-Object -Last $MaxCount }

    return $ResultOut
}