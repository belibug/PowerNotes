function New-Note {
    [Alias('npn')]
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string] $Body,
        [string] $Topic = $null,
        [priority]$Priority = [priority]::Low
    )
    $NoteParams = @{
        Body = $Body
    }
    if ($null -ne $Topic) { $NoteParams['Topic'] = $Topic }
    $NoteParams['Priority'] = $Priority
    $NoteEntry = [Note]::new($NoteParams)
    Add-NoteEntryToFile -Note $NoteEntry
    return $NoteEntry
}
