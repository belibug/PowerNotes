function Find-Note {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Text,
        [int] $Year = (Get-Date).Year,
        [int]$MaxCount
    )

    $filePath = Get-NotesFile -Year $Year
    $ResultOut = [System.Collections.ArrayList]::new() 

    if (-not (Test-Path $filePath)) {
        return $ResultOut
        # Quit, No file found
    }

    $rawData = Get-Content -Path $filePath
    if ([string]::IsNullOrWhiteSpace($rawData)) {
        return $ResultOut
        # Quit, No entires in the JSON
    }
    $rawData | ForEach-Object {
        $obj = $_ | ConvertFrom-Json
        $entry = [Note]::new(@{
                Body     = $obj.Body
                Topic    = $obj.Topic
                Priority = [Priority]::$($obj.Priority)
            })
        $entry.ID = $obj.ID
        $entry.Date = [datetime]$obj.Date
        [void]$ResultOut.Add($entry) 
    }
    $ResultOut = $ResultOut | Where-Object { $_.Body -like "*$Text*" }
    
    if ($MaxCount) { $ResultOut = $ResultOut | Select-Object -Last $MaxCount }

    return $ResultOut
}