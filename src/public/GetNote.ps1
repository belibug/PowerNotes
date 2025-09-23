function Get-Note {
    [CmdletBinding()]
    param(
        [int] $Year = (Get-Date).Year,
        [int] $Count = 10,
        [switch]$All,
        #TODO Yet to Implement LAST
        [ValidateSet('Week', 'Fortnight', 'Month', 'Quarter')]
        [string]$Last,
        $Topic
    )

    $filePath = Get-NotesFile -Year $Year

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
        $entry = [Note]::new(@{
                Body     = $obj.Body
                Topic    = $obj.Topic
                Priority = [Priority]::$($obj.Priority)
            })
        $entry.ID = $obj.ID
        $entry.Date = [datetime]$obj.Date
        [void]$ResultOut.Add($entry) 
    }
    
    if ($Last) { Write-Warning 'Feature not implemented : Last' }

    if ($Topic) {
        $ResultOut = $ResultOut | Where-Object { $_.Topic -like "*$topic*" }
    }

    if (-not $All) { 
        $ResultOut = $ResultOut | Select-Object -Last $Count 
    }
    return $ResultOut
}