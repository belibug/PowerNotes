function New-Note {
    [Alias('npn')]
    [CmdletBinding(SupportsShouldProcess = $true)]
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
    if (-not $PSCmdlet.ShouldProcess($NoteEntry, 'Will write the note')) { return }
    Add-NoteEntryToFile -Note $NoteEntry
    return $NoteEntry
}
